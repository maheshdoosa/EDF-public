################ Resource Group - Apex Dev HS #############
module "createTargetRgForApexhs" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.apexHsRgName
  resourceLocation  = var.apexHsResourceLocation
  additionalTags    = module.apexvmTags.tagsResult
}

################ VM01 NIC - Apex Dev HS #############
module "createNicForApexvm1" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.apexnic01name #should be static
  location          = var.apexHsResourceLocation
  resourceGroupName = module.createTargetRgForApexhs.rgName

  subnetId = data.azurerm_subnet.apexSubnet.id

  nicIpConfigName = var.nicIpConfigName #should be static
  ipName          = var.nicipName       #should be static
  ipAddress       = local.apexVm0101PrivateIpAddress
}


############### VM01 - Apex Dev HS #############
module "createApex01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel?ref=v1.1.19"

  vmName       = var.apexvm01Name #this should be static
  computerName = var.apexvm01Name #should be static across environments

  location        = var.apexHsResourceLocation
  vmResourceGroup = module.createTargetRgForApexhs.rgName

  nicIds = [module.createNicForApexvm1.nicId]

  osImagePublisher = "Oracle"       #should be static across environments
  osImageOffer     = "Oracle-Linux" #should be static across environments
  osImageSku       = "ol83-lvm"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F16s" #should be static across environments

  osDiskName                = var.vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Premium_LRS"

  #   storageDiskName         = var.vmstorageDiskName #should be static across environments
  #   storageDiskType         = "Standard_LRS"
  #   storageDiskCreateOption = "FromImage"
  #   storageDiskSizeGb       = "256"
  #   storageDataDiskCaching  = "ReadWrite"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value
  zones             = ["1"]
  # availabilitySetId = module.createAsetAms.aSetId

  additionalTags = module.apexdevvm01Tags.tagsResult

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  MSNetworkWatcher     = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings
  #   PrepVMprotected_settings = local.PrepVMprotected_settings
  #   PrepVMsettings           = local.PrepVMsettings
  #   InstallIaaSAntiMalwareDC = false
  EncryptDisk       = true
  EncryptVMsettings = local.EncryptVMsettingsvm01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

################ VM02 NIC - Apex Dev HS #############
module "createNicForApexvm2" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.apexnic02name #should be static
  location          = var.apexHsResourceLocation
  resourceGroupName = module.createTargetRgForApexhs.rgName

  subnetId = data.azurerm_subnet.apexSubnet.id

  nicIpConfigName = var.nicIpConfigName02 #should be static
  ipName          = var.nicipName02       #should be static
  ipAddress       = local.apexVm02PrivateIpAddress
}

############### VM02 - Apex Dev HS #############
module "createApex02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel?ref=v1.1.19"

  vmName       = var.apexvm02Name #this should be static
  computerName = var.apexvm02Name #should be static across environments

  location        = var.apexHsResourceLocation
  vmResourceGroup = module.createTargetRgForApexhs.rgName

  nicIds = [module.createNicForApexvm2.nicId]

  osImagePublisher = "Oracle"       #should be static across environments
  osImageOffer     = "Oracle-Linux" #should be static across environments
  osImageSku       = "ol83-lvm"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F16s" #should be static across environments

  osDiskName                = var.vm02osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Premium_LRS"

  #   storageDiskName         = var.vm02storageDiskName #should be static across environments
  #   storageDiskType         = "Standard_LRS"
  #   storageDiskCreateOption = "FromImage"
  #   storageDiskSizeGb       = "256"
  #   storageDataDiskCaching  = "ReadWrite"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value
  zones             = ["1"]
  # availabilitySetId = module.createAsetAms.aSetId

  additionalTags = module.apexdevvm02Tags.tagsResult

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  MSNetworkWatcher     = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings
  #   PrepVMprotected_settings = local.PrepVMprotected_settings
  #   PrepVMsettings           = local.PrepVMsettings
  #   InstallIaaSAntiMalwareDC = false
  EncryptDisk       = true
  EncryptVMsettings = local.EncryptVMsettingsvm02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

######################## Upload Djoin file for VM extensions for Dev #########################
resource "azurerm_storage_blob" "uploadDomainJoinScript" {
  name                   = "domainjoin.sh"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/domainjoin.sh"
}

############### Module to join domain for Apex Dev Linux VMs ##########################

module "domainjoinhsapexdevvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createApex01Vm.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
}

module "domainjoinhsapexdevvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createApex02Vm.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
}
/*
The kevyault secrets to be added are adDomainName,adAdminUser,adAdminPassword
,nameserverip,dNSHostName,dchostname.
Note: The script storage account and key should be created and storage account key
 needs to be added in key vault*/

######################### Backup Recovery Service Vault Apex HS Dev############################

resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createApex01Vm, module.createApex02Vm]
}

############################## Managed disk for Apex HS Dev VM ################################

resource "azurerm_managed_disk" "mddev" {
  for_each             = var.st_disk
  name                 = each.value.vmstorageDiskName
  location             = var.apexHsResourceLocation
  resource_group_name  = var.apexHsRgName #module.createTargetRgForApexhs.rgName
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
  zones                = ["1"]
  depends_on           = [module.createApex01Vm, module.createApex02Vm]
}

module "vmdiskattachdev01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.mdiskdev01.id
  vm_id          = module.createApex01Vm.vmId
  lun_number     = "1"
  caching        = "ReadWrite"
  depends_on     = [module.createApex01Vm, azurerm_managed_disk.mddev]
}

module "vmdiskattachdev02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.mdiskdev02.id
  vm_id          = module.createApex02Vm.vmId
  lun_number     = "2"
  caching        = "ReadWrite"
  depends_on     = [module.createApex02Vm, azurerm_managed_disk.mddev]
}
##############################Apex HS Tst Code#################################################

###################### Resource Group - Apex HS Tst ############################

module "createTargetRgForApexhsTst" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.apexHsRgName_tst
  resourceLocation  = var.apexHsResourceLocation
  additionalTags    = module.apexvmTags.tagsResult
}

######################### VM01 NIC - Apex HS Tst #############################

module "createNicForApexTstvm1" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.apexTstnic01name #should be static
  location          = var.apexHsResourceLocation
  resourceGroupName = module.createTargetRgForApexhsTst.rgName

  subnetId = data.azurerm_subnet.apexTstSubnet.id

  nicIpConfigName = var.nicIpTstConfigName01 #should be static
  ipName          = var.nicipTstName01       #should be static
  ipAddress       = local.apexTstVm01PrivateIpAddress
}


#############################  VM01 - Apex HS Tst ###############################

module "createApex01TstVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel?ref=v1.1.19"

  vmName       = var.apexTstvm01Name #this should be static
  computerName = var.apexTstvm01Name #should be static across environments

  location        = var.apexHsResourceLocation
  vmResourceGroup = module.createTargetRgForApexhsTst.rgName

  nicIds = [module.createNicForApexTstvm1.nicId]

  osImagePublisher = "Oracle"       #should be static across environments
  osImageOffer     = "Oracle-Linux" #should be static across environments
  osImageSku       = "ol83-lvm"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F16s" #should be static across environments

  osDiskName                = var.vmTstosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Premium_LRS"

  #   storageDiskName         = var.vmstorageDiskName #should be static across environments
  #   storageDiskType         = "Standard_LRS"
  #   storageDiskCreateOption = "FromImage"
  #   storageDiskSizeGb       = "256"
  #   storageDataDiskCaching  = "ReadWrite"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value
  zones             = ["1"]
  # availabilitySetId = module.createAsetAms.aSetId

  additionalTags = module.apextstvm01Tags.tagsResult

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  MSNetworkWatcher     = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings
  #   PrepVMprotected_settings = local.PrepVMprotected_settings
  #   PrepVMsettings           = local.PrepVMsettings
  #   InstallIaaSAntiMalwareDC = false
  EncryptDisk       = true
  EncryptVMsettings = local.EncryptVMsettingststvm01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStoragetst.primary_blob_endpoint
}

###########################  VM02 NIC - Apex HS Tst ##########################

module "createNicForTstApexvm2" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.apexTstnic02name #should be static
  location          = var.apexHsResourceLocation
  resourceGroupName = module.createTargetRgForApexhsTst.rgName

  subnetId = data.azurerm_subnet.apexTstSubnet.id

  nicIpConfigName = var.nicIpTstConfigName02 #should be static
  ipName          = var.nicipTstName02       #should be static
  ipAddress       = local.apexTstVm02PrivateIpAddress
}

############################  VM02 - Apex HS Tst ##############################

module "createApex02TstVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel?ref=v1.1.19"

  vmName       = var.apexTstvm02Name #this should be static
  computerName = var.apexTstvm02Name #should be static across environments

  location        = var.apexHsResourceLocation
  vmResourceGroup = module.createTargetRgForApexhsTst.rgName

  nicIds = [module.createNicForTstApexvm2.nicId]

  osImagePublisher = "Oracle"       #should be static across environments
  osImageOffer     = "Oracle-Linux" #should be static across environments
  osImageSku       = "ol83-lvm"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F16s" #should be static across environments

  osDiskName                = var.vmTstosDiskName02 #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Premium_LRS"

  #   storageDiskName         = var.vm02storageDiskName #should be static across environments
  #   storageDiskType         = "Standard_LRS"
  #   storageDiskCreateOption = "FromImage"
  #   storageDiskSizeGb       = "256"
  #   storageDataDiskCaching  = "ReadWrite"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value
  zones             = ["1"]
  # availabilitySetId = module.createAsetAms.aSetId

  additionalTags = module.apextstvm02Tags.tagsResult

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  MSNetworkWatcher     = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings
  #   PrepVMprotected_settings = local.PrepVMprotected_settings
  #   PrepVMsettings           = local.PrepVMsettings
  #   InstallIaaSAntiMalwareDC = false
  EncryptDisk       = true
  EncryptVMsettings = local.EncryptVMsettingststvm02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStoragetst.primary_blob_endpoint
}

######################### Backup Recovery Service Vault Apex HS Tst############################

resource "azurerm_backup_protected_vm" "vmtst" {
  for_each            = var.vm_name_tst
  recovery_vault_name = each.value.recovery_vault_name_tst
  resource_group_name = each.value.rsv_resourceGroupName_tst
  source_vm_id        = local.vm_source_id_tst[each.value.vm_id]
  backup_policy_id    = local.vm_source_id_tst[each.value.policy_id]
  depends_on          = [module.createApex01TstVm, module.createApex02TstVm]
}

######################## Upload Domain Join Sh file for VM extensions#############
resource "azurerm_storage_blob" "uploadDomainJoinScripttst" {
  name                   = "domainjoin.sh"
  storage_account_name   = var.storageAccountNametst
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/domainjoin.sh"
}

########################## Domain Join- Apex HS Tst VMs #######################

module "domainjoinhsapexTstvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createApex01TstVm.vmId
  settings           = local.PrepLinuxVMsettings02
  protected_settings = local.PrepLinuxVMprotected_settings02
}

module "domainjoinhsapexTstvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createApex02TstVm.vmId
  settings           = local.PrepLinuxVMsettings02
  protected_settings = local.PrepLinuxVMprotected_settings02
}

############################## Managed disk for Apex HS Tst VM ################################

resource "azurerm_managed_disk" "mdtst" {
  for_each             = var.tst_disk
  name                 = each.value.vmstorageDiskName
  location             = var.apexHsResourceLocation
  resource_group_name  = var.apexHsRgName_tst #module.createTargetRgForApexhs.rgName
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
  zones                = ["1"]
  depends_on           = [module.createApex01TstVm, module.createApex02TstVm]
}

module "vmdiskattachtst01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.mdisktst01.id
  vm_id          = module.createApex01TstVm.vmId
  lun_number     = "1"
  caching        = "ReadWrite"
  depends_on     = [module.createApex01TstVm, azurerm_managed_disk.mdtst]
}

module "vmdiskattachtst02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.mdisktst02.id
  vm_id          = module.createApex02TstVm.vmId
  lun_number     = "2"
  caching        = "ReadWrite"
  depends_on     = [module.createApex02TstVm, azurerm_managed_disk.mdtst]
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
