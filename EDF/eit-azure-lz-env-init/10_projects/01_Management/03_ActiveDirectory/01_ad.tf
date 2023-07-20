################ Resource Group - managementHs AD #############
module "createTargetRgForAd" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.resourceGroupName
  resourceLocation  = var.location

  additionalTags = module.resourceGroupTags.tagsResult
}

################ NIC - managementHs AD #############
module "createNicForAdVm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukalzhsads01-nic-01" #should be static
  location          = var.location
  resourceGroupName = module.createTargetRgForAd.rgName

  subnetId = data.azurerm_subnet.adSubnet.id

  ipName          = "eitukalzhsads01-nic-01-Ip"        #should be static
  nicIpConfigName = "eitukalzhsads01-nic-01-Ip-Config" #should be static

  ipAddress = data.azurerm_key_vault_secret.rootDc1IpAddress.value
}
module "createNicForAdVm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukalzhsads02-nic-01" #should be static
  location          = var.location
  resourceGroupName = module.createTargetRgForAd.rgName

  subnetId = data.azurerm_subnet.adSubnet.id

  ipName          = "eitukalzhsads02-nic-01-Ip"        #should be static
  nicIpConfigName = "eitukalzhsads02-nic-01-Ip-Config" #should be static

  ipAddress = data.azurerm_key_vault_secret.rootDc2IpAddress.value
}

################ ASet - managementHs AD #############
module "createAsetAd" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = "eit-uks-alz-hs-adds-avs" #should be static
  location          = var.location
  resourceGroupName = module.createTargetRgForAd.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.adVmTags.tagsResult
}

################ VM-1 - managementHs AD #############
module "createAdVm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName          = "eituksalzhsdc01" #this should be static
  location        = var.location
  vmResourceGroup = module.createTargetRgForAd.rgName

  nicIds = [module.createNicForAdVm01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eituksprdlogsa01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksprdlogsa01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"


  computerName      = "eituksalzhsdc01" #should be static across environments
  userAdminName     = data.azurerm_key_vault_secret.ADadminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.ADadminPassword.value

  availabilitySetId = module.createAsetAd.aSetId

  additionalTags = module.adVm01Tags.tagsResult
}

module "createAdVm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName          = "eituksalzhsdc02" #this should be static
  location        = var.location
  vmResourceGroup = module.createTargetRgForAd.rgName

  nicIds = [module.createNicForAdVm02.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukalzhsdc02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukalzhsdc02-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"


  computerName      = "eituksalzhsdc02" #should be static across environments
  userAdminName     = data.azurerm_key_vault_secret.ADadminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.ADadminPassword.value

  availabilitySetId = module.createAsetAd.aSetId

  additionalTags = module.adVm02Tags.tagsResult
}


################ ActiveDirectory - Domain Controllers #############
module "createActiveDirectoryDC01_02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-addc01-02?ref=v1.1.19"

  storageAccountName      = var.storageAccountName
  saContainerName         = var.saContainerName
  ad1vmId                 = module.createAdVm01.vmId
  ad2vmId                 = module.createAdVm02.vmId
  publisher               = var.publisher
  scriptPathPrepareVm     = var.scriptPathPrepareVm
  scriptFilePrepareVm     = var.scriptFilePrepareVm
  resourceGroupName       = var.resourceGroupName
  virtualMachineName1     = var.virtualMachineName1
  virtualMachineName2     = var.virtualMachineName2
  urlCreateAdRootDc1      = var.urlCreateAdRootDc1
  createADRootDC1         = var.createADRootDC1
  createFunctionAdRootDc1 = var.createFunctionAdRootDc1
  urlConfigureADNextDC    = var.urlConfigureADNextDC
  ConfigureADNextDC       = var.ConfigureADNextDC
  createFunctionAdRootDc2 = var.createFunctionAdRootDc2
  dnsForwarder            = var.dnsForwarder
  storageAccountKey       = data.azurerm_key_vault_secret.storageAccountKey.value
  adDomainName            = data.azurerm_key_vault_secret.adDomainName.value
  rootDc1IpAddress        = data.azurerm_key_vault_secret.rootDc1IpAddress.value
  adminUserName           = data.azurerm_key_vault_secret.ADadminUser.value
  adminPassword           = data.azurerm_key_vault_secret.ADadminPassword.value
  blobSas                 = data.azurerm_storage_account_sas.Blobsas.sas
  subscriptionId          = data.azurerm_key_vault_secret.subscriptionId.value
  tenantId                = data.azurerm_key_vault_secret.tenantId.value
  spSecret                = data.azurerm_key_vault_secret.spSecret.value
  spApplicationId         = data.azurerm_key_vault_secret.spApplicationId.value
}

################ ActiveDirectory - Organization Unit #############
module "createOrganizationalUnit" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-addc-OrganizationUnit?ref=v1.1.19"

  storageAccountName  = var.storageAccountName
  saContainerName     = var.saContainerName
  ad1vmId             = module.createAdVm01.vmId
  publisher           = var.publisher
  resourceGroupName   = var.resourceGroupName
  virtualMachineName1 = var.virtualMachineName1
  scriptPathCreateOU  = var.scriptPathCreateOU
  Blobprefix          = var.serverOuBlobPrefix
  oulist              = var.oulist
  oupath              = var.oupath
  extname             = var.extname
  storageAccountKey   = data.azurerm_key_vault_secret.storageAccountKey.value
  blobSas             = data.azurerm_storage_account_sas.Blobsas.sas
  subscriptionId      = data.azurerm_key_vault_secret.subscriptionId.value
  tenantId            = data.azurerm_key_vault_secret.tenantId.value
  spSecret            = data.azurerm_key_vault_secret.spSecret.value
  spApplicationId     = data.azurerm_key_vault_secret.spApplicationId.value

  depends_on = [module.createActiveDirectoryDC01_02]
}

################ ActiveDirectory - UserOrganization Unit #############
module "createUserOrganizationalUnit" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-addc-OrganizationUnit?ref=v1.1.19"

  storageAccountName  = var.storageAccountName
  saContainerName     = var.saContainerName
  ad1vmId             = module.createAdVm01.vmId
  publisher           = var.publisher
  resourceGroupName   = var.resourceGroupName
  virtualMachineName1 = var.virtualMachineName1
  scriptPathCreateOU  = var.scriptPathCreateOU
  Blobprefix          = var.userOuBlobPrefix
  oulist              = var.useroulist
  oupath              = var.oupath
  extname             = var.extname
  storageAccountKey   = data.azurerm_key_vault_secret.storageAccountKey.value
  blobSas             = data.azurerm_storage_account_sas.Blobsas.sas
  subscriptionId      = data.azurerm_key_vault_secret.subscriptionId.value
  tenantId            = data.azurerm_key_vault_secret.tenantId.value
  spSecret            = data.azurerm_key_vault_secret.spSecret.value
  spApplicationId     = data.azurerm_key_vault_secret.spApplicationId.value

  depends_on = [module.createActiveDirectoryDC01_02, module.createOrganizationalUnit]
}
