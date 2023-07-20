####################### Upload PrepVM PS1 file for VM extensions#############
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

######### AVD01 AV Virtual Machine ###################

module "createTargetRgFordtgwVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.dtgwVmRgName
  resourceLocation  = var.dtgwVmResourceLocation

  additionalTags = module.resourceGroupavTags.tagsResult
}

module "createNicFordtgwvm01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.dtgwvm01 #should be static
  location          = var.dtgwVmResourceLocation
  resourceGroupName = module.createTargetRgFordtgwVm.rgName

  subnetId = data.azurerm_subnet.dtgwSubnetName.id

  nicIpConfigName = var.nicIpConfigdtgw01 #should be static
  ipName          = var.nicipNamedtgw01   #should be static
  ipAddress       = local.dtgwvm01PrivateIpAddress

}

# ################ dtgw01 Virtual Machine #####################

module "createdtgw01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.dtgw01Vm #this should be static
  computerName = var.dtgw01Vm #should be static across environments

  location        = var.dtgwVmResourceLocation
  vmResourceGroup = module.createTargetRgFordtgwVm.rgName

  nicIds = [module.createNicFordtgwvm01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D8s_V4" #should be static across environments

  osDiskName                = var.dtgw01osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"


  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"


  extra_disks = [
    {
      size = var.dtgw01Vmdatadisk01size
      name = var.dtgw01Vmdatadisk01
      lun  = var.dtgw01Vmdatadisk01LunNumber
    }
  ]


  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.dtgwvm01Tags.tagsResult

  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDav01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

######################## Domain Join- dtgwVM01#######################
module "domainJoindtgwVM01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createdtgw01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.createdtgw01Vm]
}

# ################ dtgw02 Virtual Machine #####################

module "createNicFordtgwvm02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.dtgwvm02 #should be static
  location          = var.dtgwVmResourceLocation
  resourceGroupName = module.createTargetRgFordtgwVm.rgName

  subnetId = data.azurerm_subnet.dtgwSubnetName.id

  nicIpConfigName = var.nicIpConfigdtgw02 #should be static
  ipName          = var.nicipNamedtgw02   #should be static
  ipAddress       = local.dtgwvm02PrivateIpAddress

}

module "createdtgw02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.dtgw02Vm #this should be static
  computerName = var.dtgw02Vm #should be static across environments

  location        = var.dtgwVmResourceLocation
  vmResourceGroup = module.createTargetRgFordtgwVm.rgName

  nicIds = [module.createNicFordtgwvm02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D8_V4" #should be static across environments

  osDiskName                = var.dtgw02osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"


  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"


  extra_disks = [
    {
      size = var.dtgw02Vmdatadisk01size
      name = var.dtgw02Vmdatadisk01
      lun  = var.dtgw02Vmdatadisk01LunNumber
    }
  ]


  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.dtgwvm02Tags.tagsResult


  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsAVDav02

  MSDependencyAgent    = true
  MSMonitoringAgent    = true
  MSNetworkWatcher     = true
  LAsettings           = local.LAsettings
  LAprotected_settings = local.LAprotected_settings

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

######################## Domain Join- dtgwVM01#######################
module "domainJoindtgwVM02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createdtgw02Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.createdtgw02Vm]
}

##################### Backup ##############################################


resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createdtgw01Vm]
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
