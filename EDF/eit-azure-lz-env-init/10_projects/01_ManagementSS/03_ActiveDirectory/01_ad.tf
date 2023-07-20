#######################

resource "azurerm_storage_blob" "uploadPrepAdScript" {
  name                   = "PrepareVMForAD.ps1"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVMForAD.ps1"
}

resource "azurerm_storage_blob" "uploadAdDc1Zip" {
  name                   = "CreateADRootDC1.ps1.zip"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/CreateADRootDC1.ps1.zip"
}

resource "azurerm_storage_blob" "uploadAdDc2Zip" {
  name                   = "ConfigureADNextDC.ps1.zip"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/ConfigureADNextDC.ps1.zip"
}

resource "azurerm_storage_blob" "uploadGBRegion" {
  name                   = "GBRegion.xml"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/GBRegion.xml"
}


################ Resource Group - managementSs AD #############
module "createTargetRgForAd" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.resourceGroupName
  resourceLocation  = var.location

  additionalTags = module.resourceGroupTags.tagsResult
}

################ NIC - managementSs AD #############
module "createNicForAdVm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukalzssads01-nic-01" #should be static
  location          = var.location
  resourceGroupName = module.createTargetRgForAd.rgName

  subnetId = data.azurerm_subnet.adSubnet.id

  ipName          = "eitukalzssads01-nic-01-Ip"        #should be static
  nicIpConfigName = "eitukalzssads01-nic-01-Ip-Config" #should be static

  ipAddress = data.azurerm_key_vault_secret.rootDc1IpAddress.value
}
module "createNicForAdVm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukalzssads02-nic-01" #should be static
  location          = var.location
  resourceGroupName = module.createTargetRgForAd.rgName

  subnetId = data.azurerm_subnet.adSubnet.id

  ipName          = "eitukalzssads02-nic-01-Ip"        #should be static
  nicIpConfigName = "eitukalzssads02-nic-01-Ip-Config" #should be static

  ipAddress = data.azurerm_key_vault_secret.rootDc2IpAddress.value
}

################ VM-1 - managementSs AD #############
module "createAdVm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName          = "eituksalzssdc01" #this should be static
  location        = var.location
  vmResourceGroup = module.createTargetRgForAd.rgName

  nicIds = [module.createNicForAdVm01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukalzssdc01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukalzssdc01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"


  computerName      = "eituksalzssdc01" #should be static across environments
  userAdminName     = local.adminUserName
  userAdminPassword = local.adminPassword

  zones = ["1"]

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags = module.adVm01Tags.tagsResult

  IaaSAntiMalwareDC        = var.IaaSAntiMalwareDC
  IaaSAntiMalware          = null
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = var.PrepVMsettings
  InstallIaaSAntiMalwareDC = true
  isDC                     = true
  DSCsettings              = local.DC01DSCsettings
  DSCprotected_settings    = local.DC01DSCprotected_settings
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsdc01
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}

module "createAdVm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName          = "eituksalzssdc02" #this should be static
  location        = var.location
  vmResourceGroup = module.createTargetRgForAd.rgName

  nicIds = [module.createNicForAdVm02.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukalzssdc02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukalzssdc02-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"


  computerName      = "eituksalzssdc02" #should be static across environments
  userAdminName     = local.adminUserName
  userAdminPassword = local.adminPassword

  zones = ["2"]

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags = module.adVm02Tags.tagsResult

  IaaSAntiMalwareDC        = var.IaaSAntiMalwareDC
  IaaSAntiMalware          = null
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = var.PrepVMsettings
  InstallIaaSAntiMalwareDC = true
  isDC                     = true
  DSCsettings              = local.DC02DSCsettings
  DSCprotected_settings    = local.DC02DSCprotected_settings
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsdc02
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  depends_on               = [module.createAdVm01]
}
