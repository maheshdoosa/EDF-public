################ Resource Group - Secgov Projects  #############
module "createTargetRgForLzmanagedHssecgov" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"


  resourceGroupName = var.lzmanagedHssecgovRgName
  resourceLocation  = var.lzHubManagedResourceLocation

  additionalTags = module.Secgovams01Tags.tagsResult
}

################ NIC - managedHs Secgov #############
module "createNicForHssecgovms01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.eamnicName #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagedHssecgov.rgName

  subnetId = data.azurerm_subnet.SecgovSubnet.id

  nicIpConfigName = var.nicIpConfigName #should be static
  ipName          = var.nicipName       #should be static
  ipAddress       = local.secgovams01PrivateIpAddress
}
################ NIC - managedHs Secgov #############
module "createNicForHssecgovms02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.eamnicName02 #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagedHssecgov.rgName

  subnetId = data.azurerm_subnet.SecgovSubnet.id

  nicIpConfigName = var.nicIpConfigName #should be static
  ipName          = var.nicipName       #should be static
  ipAddress       = local.secgovams02PrivateIpAddress
}

##########################Aset for HS Secgov VM######################################

module "createAsetAms" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = var.avSetname #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagedHssecgov.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.Secgovams01Tags.tagsResult
}

######################## Upload PrepVM PS1 file for VM extensions#############
resource "azurerm_storage_blob" "uploadPrepAdScript" {
  name                   = "PrepareVM.ps1"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVM.ps1"
}

resource "azurerm_storage_blob" "uploadGBRegion" {
  name                   = "GBRegion.xml"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/GBRegion.xml"
}

resource "azurerm_storage_blob" "uploadLAPS" {
  name                   = "LAPS.x64.msi"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/LAPS.x64.msi"
}

############### VM -01- managedHs Secgov #############
module "createHsSecgovams01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.eamvmName #this should be static
  computerName = var.eamvmName #should be static across environments

  location        = var.lzHubManagedResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagedHssecgov.rgName

  nicIds = [module.createNicForHssecgovms01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_E2_V3" #should be static across environments

  osDiskName                = var.vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.vmstorageDiskName #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetAms.aSetId

  additionalTags           = module.Secgovams01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsams01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}
############### VM -02- managedHs Secgov #############
module "createHsSecgovams02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.eamvmName02 #this should be static
  computerName = var.eamvmName02 #should be static across environments

  location        = var.lzHubManagedResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagedHssecgov.rgName

  nicIds = [module.createNicForHssecgovms02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be staticmanagedHsAdeKvName across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_E2_V3" #should be static across environments

  osDiskName                = var.vmosDiskName02 #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.vmstorageDiskName02 #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetAms.aSetId

  additionalTags           = module.Secgovams02Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsams02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

######################## Domain Join- Secgov VMs#######################
module "domainJoinSecgovams01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createHsSecgovams01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

  depends_on = [module.createHsSecgovams01Vm]
}
module "domainJoinSecgovams02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createHsSecgovams02Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

  depends_on = [module.createHsSecgovams02Vm]
}

resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createHsSecgovams01Vm, module.createHsSecgovams02Vm]
}


################ Resource Group - Tenable Scanner Linux VMs  #############
module "createTargetRgForLzmanagedHssecgovvm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagedHssecgovtenableRgName
  resourceLocation  = var.lzHubManagedResourceLocation

  additionalTags = module.Secgovamstenable01Tags.tagsResult
}

################ NIC - managementSs Tenable Scanner Linux VMs #############
module "createNicForSecgovms03Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.tenablenicName #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagedHssecgovvm.rgName

  subnetId = data.azurerm_subnet.tenableSubnetName.id

  nicIpConfigName                   = var.tenablenicIpConfigName #should be static
  ipAddress                         = local.secgovams03PrivateIpAddress
  enable_nic_ip_forwarding          = "false"
  enable_nic_accelerated_networking = "true"
  depends_on                        = [module.createTargetRgForLzmanagedHssecgovvm]
  #  additionalTags = module.Secgovamstenable01Tags.tagsResult
}


################ Linux VM (eituksssvscan01) - managementSs WARP #############
module "createSecgovams03Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-tenable?ref=v1.1.19"

  vmName       = var.tenablevmname #this should be static
  computerName = var.tenablevmname #should be static across environments

  location        = var.lzHubManagedResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagedHssecgovvm.rgName

  nicIds = [module.createNicForSecgovms03Vm.nicId]

  osImagePublisher = "tenable"               #should be static across environments
  osImageOffer     = "tenablecorenessus"     #should be static across environments
  osImageSku       = "tenablecorenessusbyol" #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V4" #should be static across environments

  osDiskName                = "eitukshsvscan01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "128"
  osDisktype                = "Standard_LRS"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.Secgovamstenable01Tags.tagsResult

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogtenableStorageAccountName.primary_blob_endpoint
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  MSDependencyAgent         = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  depends_on                = [module.createNicForSecgovms03Vm]
}

module "createdisksForTenable" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create?ref=v1.1.19"
  for_each             = var.disks
  vm_disk_name         = each.value.diskname
  vm_location          = var.lzHubManagedResourceLocation
  vm_rgname            = each.value.vmrgName
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_in_gb      = each.value.diskSize
  zone                 = var.lztenablezone
  depends_on           = [module.createSecgovams03Vm]
}

module "attachdisks" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  #    for_each                = local.diskattach01
  manged_disk_id = data.azurerm_managed_disk.Tenable_data_disk-01.id #each.value.manged_disk_id
  vm_id          = data.azurerm_virtual_machine.tenable_vm.id        #each.value.vm_id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createdisksForTenable]
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
