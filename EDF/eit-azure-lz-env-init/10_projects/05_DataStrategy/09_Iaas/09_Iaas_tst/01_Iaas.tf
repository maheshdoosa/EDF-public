######################## Upload PrepVM PS1 file for VM extensions#############

resource "azurerm_storage_blob" "uploadPrepAdScript" {
  name                   = "PrepareVM.ps1"
  storage_account_name   = var.auxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVM.ps1"
}
resource "azurerm_storage_blob" "uploadGBRegion" {
  name                   = "GBRegion.xml"
  storage_account_name   = var.auxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/GBRegion.xml"
}

resource "azurerm_storage_blob" "uploadLAPS" {
  name                   = "LAPS.x64.msi"
  storage_account_name   = var.auxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/LAPS.x64.msi"
}

################ Resource Group - MDWHs Tst VM  #############
module "create-Target-Rg-MDWHs-Tst-VM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"


  resourceGroupName = var.MDWHsTstVmRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Tst-resourceGroupTags.tagsResult //
}

############### NIC for TEST APP VM ##############

module "create-Nic-MDWHsTstAppVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsTstAppVM01nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Tst-VM.rgName

  subnetId = data.azurerm_subnet.MDWHsTstVmSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsTstAppVM01nicIpConfigName
  ipAddress                         = local.MDWHsTstAppVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Tst-VM]
}

############### MDWHs TEST App01 VM  #############

module "create-MDWHs-Tst-AppVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsTstAppVM01 #this should be static
  computerName = var.MDWHsTstAppVM01 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Tst-VM.rgName

  nicIds = [module.create-Nic-MDWHsTstAppVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_B8ms" #should be static across environments

  osDiskName                = var.TstAppVM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.TstAppvm01storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.MDWHs-Tst-AppVM-Tags.tagsResult

  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = null
  IaaSAntiMalware          = local.IaaSAntiMalware
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsgukststhmdboa01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsTstbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsTstAppVM01]
}

######################## Domain Join- AppVM01 #######################
module "domainJoinmdwhsTstAppvm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Tst-AppVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Tst-AppVM01]
}


#################### Enable Backu MDWHs TEST VM ############################

resource "azurerm_backup_protected_vm" "MDWHs-Tst-VM-Backup" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.create-MDWHs-Tst-AppVM01, ]
}
################################### Diagnostic Setting configuration to all the VM's NIC ############################

module "diagsettings-HS-NIC-mgmt-law" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.nic_id
  resource_id                = each.key
  diag_settings_name         = "Diag-Setting-Mgmt-HS-law"
  log_analytics_workspace_id = local.diag_settings_nic["Diag-Setting-Mgmt-HS-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings_nic["Diag-Setting-Mgmt-HS-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings_nic["Diag-Setting-Mgmt-HS-law"]["diagnostic_metrics"]
}

################# MDW Dev VM Import ###########################

######################## Upload PrepVM PS1 file for VM extensions#############

resource "azurerm_storage_blob" "uploadPrepvm01Script" {
  name                   = "PrepareVM-01.ps1"
  storage_account_name   = var.auxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVM-01.ps1"
}

################ Resource Group - MDWHs Dev VM01  #############
module "create-Target-Rg-MDWHs-Dev-VM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.MDWHsDevVmRgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Dev-resourceGroupTags.tagsResult //
}

############### NIC for Dev VM-01 ##############

module "create-Nic-MDWHsDevVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName                           = var.MDWHsDevVM01nicName #should be static
  location                          = var.MDWHsResourceLocation
  resourceGroupName                 = var.MDWHsDevVmRgName
  subnetId                          = data.azurerm_subnet.MDWHsDevVm01Subnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerate_networking
  nicIpConfigName                   = var.MDWHsDevVM01nicIpConfigName
  ipAddress                         = local.MDWHsDevVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Dev-VM01]
}

############### MDWHs Dev VM-01 #############

module "create-MDWHs-Dev-VM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v2.0.4"

  vmName                    = var.MDWHsDevVM01 #this should be static
  computerName              = var.MDWHsDevVM01 #should be static across environments
  location                  = var.MDWHsResourceLocation
  vmResourceGroup           = var.MDWHsDevVmRgName
  nicIds                    = [module.create-Nic-MDWHsDevVM01.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D16s_v3"    #should be static across environments
  osDiskName                = var.DevVM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  userAdminName             = data.azurerm_key_vault_secret.adminUser1.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  additionalTags            = module.MDWHs-DevVM01-Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  PrepVMprotected_settings  = local.MDWHsDevVM_PrepVMprotected_settings
  PrepVMsettings            = local.MDWHsDevVM_PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsguksdvhmdwboa01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsTstbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsDevVM01]
}

######################## Domain Join- MDWHs-Dev-VM01 #######################

resource "azurerm_virtual_machine_extension" "MDWHs-Dev-VM01-domjoin" {
  name                 = "join-domain"
  virtual_machine_id   = module.create-MDWHs-Dev-VM01.vmId
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"

  settings           = <<SETTINGS
  {
  "Name":   "${data.azurerm_key_vault_secret.adDomainName.value}",
  "OUPath": "${var.ouPath}",
  "User":   "${data.azurerm_key_vault_secret.adAdminUser.value}",
  "Restart": "true",
  "Options": "3"
  }
 SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
 {
  "Password": "${data.azurerm_key_vault_secret.adAdminPassword.value}"
 }
  PROTECTED_SETTINGS
}

################ Resource Group - MDWHs Dev VM02  #############
module "create-Target-Rg-MDWHs-Dev-VM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.MDWHsDevVm02RgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Dev-resourceGroupTags.tagsResult //
}

############### NIC for Dev VM-02 ##############

module "create-Nic-MDWHsDevVM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName                           = var.MDWHsDevVM02nicName #should be static
  location                          = var.MDWHsResourceLocation
  resourceGroupName                 = var.MDWHsDevVm02RgName
  subnetId                          = data.azurerm_subnet.MDWHsDevVm02Subnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerate_networking
  nicIpConfigName                   = var.MDWHsDevVM02nicIpConfigName
  ipAddress                         = local.MDWHsDevVM02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Dev-VM02]
}

############### MDWHs Dev VM-02 #############

module "create-MDWHs-Dev-VM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v2.0.4"

  vmName                    = var.MDWHsDevVM02 #this should be static
  computerName              = var.MDWHsDevVM02 #should be static across environments
  location                  = var.MDWHsResourceLocation
  vmResourceGroup           = var.MDWHsDevVm02RgName
  nicIds                    = [module.create-Nic-MDWHsDevVM02.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D4s_v3"     #should be static across environments
  osDiskName                = var.DevVM02OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  userAdminName             = data.azurerm_key_vault_secret.adminUser1.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  additionalTags            = module.MDWHs-DevVM01-Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  PrepVMprotected_settings  = local.MDWHsDevVM_PrepVMprotected_settings
  PrepVMsettings            = local.MDWHsDevVM_PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsguksdvhmdwirt01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsTstbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsDevVM02]
}

######################## Domain Join- MDWHs-Dev-VM02 #######################

resource "azurerm_virtual_machine_extension" "MDWHs-Dev-VM02-domjoin" {
  name                 = "join-domain"
  virtual_machine_id   = module.create-MDWHs-Dev-VM02.vmId
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"

  settings           = <<SETTINGS
  {
  "Name":   "${data.azurerm_key_vault_secret.adDomainName.value}",
  "OUPath": "${var.ouPath}",
  "User":   "${data.azurerm_key_vault_secret.adAdminUser.value}",
  "Restart": "true",
  "Options": "3"
  }
 SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
 {
  "Password": "${data.azurerm_key_vault_secret.adAdminPassword.value}"
 }
  PROTECTED_SETTINGS
}


################ Resource Group - MDWHs Tst VM02  #############
module "create-Target-Rg-MDWHs-Tst-VM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.MDWHsTstVm02RgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Dev-resourceGroupTags.tagsResult //
}

############### NIC for Tst VM-02 ##############

module "create-Nic-MDWHsTstVM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.0.0"

  nicName                           = var.MDWHsTstVM02nicName #should be static
  location                          = var.MDWHsResourceLocation
  resourceGroupName                 = var.MDWHsTstVm02RgName
  subnetId                          = data.azurerm_subnet.MDWHsTstVm02Subnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerate_networking
  nicIpConfigName                   = var.MDWHsTstVM02nicIpConfigName
  ipAddress                         = local.MDWHsTstVM02PrivateIpAddress
  depends_on                        = [module.create-Nic-MDWHsDevVM02]
}

############### MDWHs Tst VM-02 #############

module "create-MDWHs-Tst-VM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v2.0.4"

  vmName                    = var.MDWHsTstVM02 #this should be static
  computerName              = var.MDWHsTstVM02 #should be static across environments
  location                  = var.MDWHsResourceLocation
  vmResourceGroup           = var.MDWHsTstVm02RgName
  nicIds                    = [module.create-Nic-MDWHsTstVM02.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D4s_v3"     #should be static across environments
  osDiskName                = var.TstVM02OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  userAdminName             = data.azurerm_key_vault_secret.adminUser1.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  additionalTags            = module.MDWHs-DevVM01-Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  PrepVMprotected_settings  = local.MDWHsDevVM_PrepVMprotected_settings
  PrepVMsettings            = local.MDWHsDevVM_PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsgukstshmdwirt01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsTstbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsTstVM02]
}

######################## Domain Join- MDWHs-Tst-VM02 #######################

resource "azurerm_virtual_machine_extension" "MDWHs-Tst-VM02-domjoin" {
  name                 = "join-domain"
  virtual_machine_id   = module.create-MDWHs-Tst-VM02.vmId
  publisher            = "Microsoft.Compute"
  type                 = "JsonADDomainExtension"
  type_handler_version = "1.3"

  settings           = <<SETTINGS
  {
  "Name":   "${data.azurerm_key_vault_secret.adDomainName.value}",
  "OUPath": "${var.ouPath}",
  "User":   "${data.azurerm_key_vault_secret.adAdminUser.value}",
  "Restart": "true",
  "Options": "3"
  }
 SETTINGS
  protected_settings = <<PROTECTED_SETTINGS
 {
  "Password": "${data.azurerm_key_vault_secret.adAdminPassword.value}"
 }
  PROTECTED_SETTINGS
}

######### importing backup for imported VM #################
#### MDWHs-Dev-VM-01-Backup #########
resource "azurerm_backup_protected_vm" "MDWHs-Dev-VM-01-Backup" {
  recovery_vault_name = var.MDWHsDevrsv_name
  resource_group_name = var.MDWHsDevrsv_rg_name
  source_vm_id        = module.create-MDWHs-Dev-VM01.vmId
  backup_policy_id    = data.azurerm_backup_policy_vm.Daily-2200-52W-InfraVM.id
}

#### MDWHs-Dev-VM-02-Backup #########
resource "azurerm_backup_protected_vm" "MDWHs-Dev-VM-02-Backup" {
  recovery_vault_name = var.MDWHsDevrsv_name
  resource_group_name = var.MDWHsDevrsv_rg_name
  source_vm_id        = module.create-MDWHs-Dev-VM02.vmId
  backup_policy_id    = data.azurerm_backup_policy_vm.Daily-2200-52W-InfraVM.id
}

#### MDWHs-Tst-VM-02-Backup #########
resource "azurerm_backup_protected_vm" "MDWHs-Tst-VM-02-Backup" {
  recovery_vault_name = var.MDWHsDevrsv_name
  resource_group_name = var.MDWHsDevrsv_rg_name
  source_vm_id        = module.create-MDWHs-Tst-VM02.vmId
  backup_policy_id    = data.azurerm_backup_policy_vm.Daily-2200-52W-InfraVM.id
}
