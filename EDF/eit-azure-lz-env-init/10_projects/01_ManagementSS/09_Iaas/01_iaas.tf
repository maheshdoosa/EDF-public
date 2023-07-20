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

################ Resource Group - managementSs PKI  #############
module "createTargetRgForLzmanagementSsPki" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagementSsPkiRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.pkiEaRootVmRGTags.tagsResult
}

################ NIC - managementSs PKI #############
module "createNicForPkiEaRootVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksssrca01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eituksssrca01-nic-01-Ip-Config" #should be static
  ipName          = "eituksssrca01-nic-01-Ip"        #should be static
  ipAddress       = local.pkiEaRootPrivateIpAddress
}

module "createNicForPkiCa01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksssica01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eituksssica01-nic-01-Ip-Config" #should be static
  ipName          = "eituksssica01-nic-01-Ip"        #should be static
  ipAddress       = local.pkiCa01PrivateIpAddress
}

module "createNicForPkiCa02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksssica02-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eituksssica02-nic-01-Ip-Config" #should be static
  ipName          = "eituksssica02-nic-01-Ip"        #should be static
  ipAddress       = local.pkiCa02PrivateIpAddress
}

module "createNicForWebPki01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukssscaweb01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukssscaweb01-nic-01-Ip-Config" #should be static
  ipName          = "eitukssscaweb01-nic-01-Ip"        #should be static
  ipAddress       = local.pkiWebPki01PrivateIpAddress
}

module "createNicForWebPki02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukssscaweb02-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukssscaweb02-nic-01-Ip-Config" #should be static
  ipName          = "eitukssscaweb02-nic-01-Ip"        #should be static
  ipAddress       = local.pkiWebPki02PrivateIpAddress
}

module "createNicForAFS01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksssafs01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsAFS.rgName

  subnetId = data.azurerm_subnet.AFSSubnetName.id

  nicIpConfigName = "eituksssafs01-nic-01-Ip-Config" #should be static
  ipName          = "eituksssafs01-nic-01-Ip"        #should be static
  ipAddress       = local.AFS01PrivateIpAddress
}

################ VM - managementSs Pki #############
module "createPkiEaRootVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eituksssrca01" #this should be static
  computerName = "eituksssrca01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsPki.rgName

  nicIds = [module.createNicForPkiEaRootVm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eituksssrca01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksssrca01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags            = module.pkiEaRootVmTags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingssrca01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

module "createPkiCa01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eituksssica01" #this should be static
  computerName = "eituksssica01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsPki.rgName

  nicIds = [module.createNicForPkiCa01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eituksssica01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksssica01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags            = module.pkiCaVm01Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingssica01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

module "createPkiCa02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eituksssica02" #this should be static
  computerName = "eituksssica02" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsPki.rgName

  nicIds = [module.createNicForPkiCa02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eituksssica02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksssica02-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags           = module.pkiCaVm02Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingssica02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

module "createWebPki01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eitukssscaweb01" #this should be static
  computerName = "eitukssscaweb01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsPki.rgName

  nicIds = [module.createNicForWebPki01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukssscaweb01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukssscaweb01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags           = module.webPkiVm01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsscaweb01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

module "createWebPki02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eitukssscaweb02" #this should be static
  computerName = "eitukssscaweb02" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsPki.rgName

  nicIds = [module.createNicForWebPki02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukssscaweb02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukssscaweb02-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags            = module.webPkiVm02Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsscaweb02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}



################ Resource Group - managementSs AFS  #############
module "createTargetRgForLzmanagementSsAFS" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagementSsAFSVmRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.afsVmRGTags.tagsResult
}



module "createAFS01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eituksssafs01" #this should be static
  computerName = "eituksssafs01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsAFS.rgName

  nicIds = [module.createNicForAFS01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V4" #should be static across environments

  osDiskName                = "eituksssafs01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksssafs01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "512"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags            = module.AFSVm01Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsafs01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

###################### Internal Load Balancer for PKI Web Service ####################

module "createInternalLoadBalancerpki" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-internal-load-balancer"

  vNetName                = var.lzmanagementSsVnetName
  subnetName              = var.pkiSubnetName
  subnetID                = data.azurerm_subnet.pkiSubnet.id
  ipconfigName1           = "eitukssscaweb01-nic-01-Ip-Config" #should be static across environments
  ipconfigName2           = "eitukssscaweb02-nic-01-Ip-Config" #should be static across environments
  lbName                  = "eit-uks-alz-ss-caweb-int-lb"      #should be static across environments
  FrontIpAllocationMethod = "static"                           #should be static across environments
  IPaddressforstatic      = local.pkiintLbPrivateIpAddress
  resourceGroupName       = module.createTargetRgForLzmanagementSsPki.rgName
  location                = var.lzHubManagementResourceLocation
  lb_Sku                  = "Standard"                 #should be static across environments
  healthProbProtocol      = "TCP"                      #should be static across environments
  healthProbProtocolPort  = "443"                      #should be static across environments
  lbRuleName              = "pkiweb-ilb-rule1"         #should be static across environments
  lbRuleProtocol          = "TCP"                      #should be static across environments
  lbRuleFrontPort         = "443"                      #should be static across environments
  lbRuleBackPort          = "443"                      #should be static across environments
  backPoolIPConfigName    = "eit-uks-alz-caweb-ilb-be" #should be static across environments
  vm1NicID                = module.createNicForWebPki01Vm.nicId
  vm2NicID                = module.createNicForWebPki02Vm.nicId
  additionalTags          = module.ILBTags.tagsResult

}

######################## Domain Join- PKI VMs excluded root CA VM as per design #######################
module "domainJoinPkiCa01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createPkiCa01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

module "domainJoinPkiCa02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createPkiCa02Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

module "domainJoinAFS01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createAFS01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

module "domainJoinPkiweb01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWebPki01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

module "domainJoinPkiweb02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWebPki02Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

##########################RG for WAC server##################################################

module "createTargetRgForLzmanagementSsWac" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagementSsWacRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.WacVmRGTags.tagsResult
}

###########NIC for wac VM###########################################################

module "createNicForWac01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukssswac01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsWac.rgName

  subnetId = data.azurerm_subnet.wacSubnet.id

  nicIpConfigName = "eitukssswac01-nic-01-Ip-Config" #should be static
  ipName          = "eitukssswac01-nic-01-Ip"        #should be static
  ipAddress       = local.wac01PrivateIpAddress
}

module "createNicForWac02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eitukssswac02-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsWac.rgName

  subnetId = data.azurerm_subnet.wacSubnet.id

  nicIpConfigName = "eitukssswac02-nic-01-Ip-Config" #should be static
  ipName          = "eitukssswac02-nic-01-Ip"        #should be static
  ipAddress       = local.wac02PrivateIpAddress
}

##########################Aset for wac VM######################################

module "createAsetWac" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet"

  aSetname          = "eit-uks-alz-ss-wac-avs" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsWac.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.wacVmTags.tagsResult
}

###################### VM Windows Admin center ############################
module "createWac01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eitukssswac01" #this should be static
  computerName = "eitukssswac01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsWac.rgName

  nicIds = [module.createNicForWac01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_E4_v3" #should be static across environments

  osDiskName                = "eitukssswac01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukssswac01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetWac.aSetId

  additionalTags           = module.wacVm01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsswac01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

module "createWac02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eitukssswac02" #this should be static
  computerName = "eitukssswac02" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsWac.rgName

  nicIds = [module.createNicForWac02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_E4_v3" #should be static across environments

  osDiskName                = "eitukssswac02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukssswac02-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetWac.aSetId

  additionalTags           = module.wacVm02Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsswac02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

######################## Domain Join- Windows Admin Center #######################

module "domainJoinWac1" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWac01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

module "domainJoinWac2" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWac02Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}

###################### Internal Load Balancer for Windows Admin Center ####################

module "createInternalLoadBalancerwac" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-internal-load-balancer"

  vNetName                = var.lzmanagementSsVnetName
  subnetName              = var.wacSubnetName
  subnetID                = data.azurerm_subnet.wacSubnet.id
  ipconfigName1           = "eitukssswac01-nic-01-Ip-Config" #should be static across environments
  ipconfigName2           = "eitukssswac02-nic-01-Ip-Config" #should be static across environments
  lbName                  = "eit-uks-alz-ss-wac-int-lb"      #should be static across environments
  FrontIpAllocationMethod = "static"                         #should be static across environments
  IPaddressforstatic      = local.wacintLbPrivateIpAddress
  resourceGroupName       = module.createTargetRgForLzmanagementSsWac.rgName
  location                = var.lzHubManagementResourceLocation
  lb_Sku                  = "basic"                 #should be static across environments
  healthProbProtocol      = "TCP"                   #should be static across environments
  healthProbProtocolPort  = "443"                   #should be static across environments
  lbRuleName              = "wac-ilb-rule1"         #should be static across environments
  lbRuleProtocol          = "TCP"                   #should be static across environments
  lbRuleFrontPort         = "443"                   #should be static across environments
  lbRuleBackPort          = "443"                   #should be static across environments
  backPoolIPConfigName    = "eit-alz-ss-wac-ilb-be" #should be static across environments
  vm1NicID                = module.createNicForWac01Vm.nicId
  vm2NicID                = module.createNicForWac02Vm.nicId
}

################# ADDS Resources#####################

################# Nic - DC03 ##############
module "createNicForDc03Vm" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest"
  nicName                           = var.dc03vmnicName #should be static
  location                          = var.lzHubManagementResourceLocation
  resourceGroupName                 = var.lzmanagementss_adds_resource_group
  subnetId                          = data.azurerm_subnet.dcSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.dc03vmnicIpConfigName #should be static
  ipAddress                         = local.dc03PrivateIpAddress
}

################## NIC association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "asgdc03" {
  network_interface_id          = module.createNicForDc03Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgdc.id
}

##################### VM - AD DC03 ##############
module "createDc03Vm" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"
  vmName                    = var.dc03vmName #this should be static
  computerName              = var.dc03vmName #should be static across environments
  location                  = var.lzHubManagementResourceLocation
  vmResourceGroup           = var.lzmanagementss_adds_resource_group
  nicIds                    = [module.createNicForDc03Vm.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D2_V3"     #should be static across environments
  osDiskName                = var.dc03vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  storageDiskName           = var.dc03vmstorageDiskName #should be static across environments
  storageDiskType           = "Standard_LRS"
  storageDiskCreateOption   = "Empty"
  storageDiskSizeGb         = "128"
  storageDataDiskCaching    = "None"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["3"]
  additionalTags            = module.dc03VmTags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settingsforAD
  PrepVMsettings            = local.PrepVMsettingsforAD
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsdc03
  InstallIaaSAntiMalwareDC  = true
  IaaSAntiMalwareDC         = local.IaaSAntiMalwareDC
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings

}


################# Nic - DC04 ##############
module "createNicForDc04Vm" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest"
  nicName                           = var.dc04vmnicName #should be static
  location                          = var.lzHubManagementResourceLocation
  resourceGroupName                 = var.lzmanagementss_adds_resource_group
  subnetId                          = data.azurerm_subnet.dcSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.dc04vmnicIpConfigName #should be static
  ipAddress                         = local.dc04PrivateIpAddress
}

################## NIC association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "asgdc04" {
  network_interface_id          = module.createNicForDc04Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgdc.id
}

##################### VM - AD DC04 ##############
module "createDc04Vm" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"
  vmName                    = var.dc04vmName #this should be static
  computerName              = var.dc04vmName #should be static across environments
  location                  = var.lzHubManagementResourceLocation
  vmResourceGroup           = var.lzmanagementss_adds_resource_group
  nicIds                    = [module.createNicForDc04Vm.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D2_V3"     #should be static across environments
  osDiskName                = var.dc04vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  storageDiskName           = var.dc04vmstorageDiskName #should be static across environments
  storageDiskType           = "Standard_LRS"
  storageDiskCreateOption   = "Empty"
  storageDiskSizeGb         = "128"
  storageDataDiskCaching    = "None"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.dc04VmTags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settingsforAD
  PrepVMsettings            = local.PrepVMsettingsforAD
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsdc04
  InstallIaaSAntiMalwareDC  = true
  IaaSAntiMalwareDC         = local.IaaSAntiMalwareDC
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings

}

########### Adding VM's as Additional Domain controll ##########

module "CreateNewADC-Dc03Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-addc-additional-dc"

  additionaladvmId            = local.additionaladvmIdDc03
  urlConfigureADNextDC        = var.urlConfigureADNextDC        // path of ConfigureADNextDC.ps1.zip from storage account
  scriptfileConfigureADNextDC = var.scriptfileConfigureADNextDC // filename of ADNEXTDC PS1
  functionConfigureADNextDC   = var.functionConfigureADNextDC   // function of module (ConfigureADNextDC)
  adDomainName                = data.azurerm_key_vault_secret.adDomainName.value
  rootDcIpAddress             = data.azurerm_key_vault_secret.rootDcIpAddress.value
  AzureDnsForwarder           = data.azurerm_key_vault_secret.AzureDnsForwarder.value    // AzureDnsForwarder PIP
  ADadminUserName             = data.azurerm_key_vault_secret.new-domain-join-user.value //AD Domain user name Ex. abc@adc.com
  ADadminPassword             = data.azurerm_key_vault_secret.new-domain-join-pass.value
  blobSas                     = data.azurerm_storage_account_sas.Blobsas.sas
}


module "CreateNewADC-Dc04Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-addc-additional-dc"

  additionaladvmId            = local.additionaladvmIdDc04
  urlConfigureADNextDC        = var.urlConfigureADNextDC        // path of ConfigureADNextDC.ps1.zip from storage account
  scriptfileConfigureADNextDC = var.scriptfileConfigureADNextDC // filename of ADNEXTDC PS1
  functionConfigureADNextDC   = var.functionConfigureADNextDC   // function of module (ConfigureADNextDC)
  adDomainName                = data.azurerm_key_vault_secret.adDomainName.value
  rootDcIpAddress             = data.azurerm_key_vault_secret.rootDcIpAddress.value
  AzureDnsForwarder           = data.azurerm_key_vault_secret.AzureDnsForwarder.value    // AzureDnsForwarder PIP
  ADadminUserName             = data.azurerm_key_vault_secret.new-domain-join-user.value //AD Domain user name Ex. abc@adc.com
  ADadminPassword             = data.azurerm_key_vault_secret.new-domain-join-pass.value
  blobSas                     = data.azurerm_storage_account_sas.Blobsas.sas
}


###############Enable Backu for Additional DC-03 &DC-04 ############################

module "enable-vm-backup-Additional-DC" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-backup-protection"

  for_each                       = var.vm_name
  recovery_services_vault_name   = each.value.recovery_services_vault_name
  recovery_services_vault_rgname = each.value.recovery_services_vault_rgname
  source_vm_id                   = local.vm_source_id[each.value.vm_id]
  backup_policy_id               = local.vm_source_id[each.value.policy_id]
  #additionalTags                  = module.Tags.tagsResult
}


##Note##

## As per request over user story AZT-3303 [Engg]-Decommissioning of unused VM as per the confirmation by SNOW MID project team
#SNOW MID Project team has informed to decommission eituksalzsmid01 (10.217.1.165) server.
#Definition of Done:
#Destroy the VM and it's associated azure resources (NIC, Disks) from Terraform code####

/*################ Resource Group - WARP Projects  #############
module "createTargetRgForLzmanagementSsWarp" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagementSsWarpRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.warpVmRGTags.tagsResult
}

################ NIC - managementSs WARP #############
module "createNicForWarpsmid01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "eituksalzsmid01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementSsWarp.rgName

  subnetId = data.azurerm_subnet.warpSubnet.id

  nicIpConfigName = "eituksalzsmid01-nic-01-Ip-Config" #should be static
  ipName          = "eituksalzsmid01-nic-01-Ip"        #should be static
  ipAddress       = local.warpsmid01PrivateIpAddress
}

################ VM - managementSs WARP #############
module "createWarpsmid01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eituksalzsmid01" #this should be static
  computerName = "eituksalzsmid01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementSsWarp.rgName

  nicIds = [module.createNicForWarpsmid01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_E2_v3" #should be static across environments

  osDiskName                = "eituksalzsmid01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eituksalzsmid01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.warpsmid01Tags.tagsResult
  IaaSAntiMalware = var.IaaSAntiMalware
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingssmid01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
######################## Domain Join- WARP VMs#######################
module "domainJoinWarpsmid01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWarpsmid01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
}*/
