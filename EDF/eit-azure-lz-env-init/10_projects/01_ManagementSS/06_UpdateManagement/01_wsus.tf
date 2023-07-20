################ Resource Group - managementHs Wsus #############

module "createTargetRgForSSWsus" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.wsusRgName
  resourceLocation  = var.wsusLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

################ NIC - managementHs Wsus #############
module "createNicForWsusVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukssswus01-nic-01" #should be static
  location          = var.wsusLocation
  resourceGroupName = module.createTargetRgForSSWsus.rgName

  subnetId = data.azurerm_subnet.wsusSubnet.id

  nicIpConfigName = "eitukssswus01-nic-01-Ip-Config" #should be static
  ipName          = "eitukssswus01-nic-01-Ip"        #should be static
  ipAddress       = local.privateStaticIpAddress
}

################ ASet - managementHs Wsus #############
module "createAsetWsus" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet"

  aSetname          = "eit-uks-alz-ss-wsus-avs" #should be static
  location          = var.wsusLocation
  resourceGroupName = module.createTargetRgForSSWsus.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.wsusVmTags.tagsResult
}
######################## Upload PrepVM PS1 file for VM extensions#############

resource "azurerm_storage_blob" "uploadPrepVMScript" {
  name                   = "PrepVM.ps1"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepVM.ps1"
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

################ VM - managementHs Wsus #############
module "createWsusVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName          = "eitukssswus01" #this should be static
  location        = var.wsusLocation
  vmResourceGroup = module.createTargetRgForSSWsus.rgName

  nicIds = [module.createNicForWsusVm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukssswus01-osdisk" #should be static across environments.
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukssswus01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "1024"
  storageDataDiskCaching  = "None"


  computerName      = "eitukssswus01" #should be static across environments
  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetWsus.aSetId

  additionalTags = module.wsusVm01Tags.tagsResult

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  IaaSAntiMalware          = local.IaaSAntiMalware
  IaaSAntiMalwareDC        = null
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettings
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}

module "domainJoinWsus" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWsusVm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

  depends_on = [module.createWsusVm]
}
