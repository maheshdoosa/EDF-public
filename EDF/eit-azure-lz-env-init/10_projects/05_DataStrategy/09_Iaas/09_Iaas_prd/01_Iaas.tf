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

############### Production Resources  ######################

################ Resource Group - MDWHs Prd VM  #############
module "create-Target-Rg-MDWHs-Prd-VM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"


  resourceGroupName = var.MDWHsPrdVmRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Prd-resourceGroupTags.tagsResult //
}

################ NIC - MDWHs Prd VM's #############

module "create-Nic-MDWHsPrdWebVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsPrdWebVM01nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Prd-VM.rgName

  subnetId = data.azurerm_subnet.MDWHsPrdVmSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsPrdWebVM01nicIpConfigName #should be static
  ipAddress                         = local.MDWHsPrdWebVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Prd-VM]
}

module "create-Nic-MDWHsPrdAppVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsPrdAppVM01nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Prd-VM.rgName

  subnetId = data.azurerm_subnet.MDWHsPrdVmSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsPrdAppVM01nicIpConfigName
  ipAddress                         = local.MDWHsPrdAppVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Prd-VM]
}

module "create-Nic-MDWHsPrdAppVM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsPrdAppVM02nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Prd-VM.rgName

  subnetId                          = data.azurerm_subnet.MDWHsPrdVmSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsPrdAppVM02nicIpConfigName #should be static
  ipAddress                         = local.MDWHsPrdAppVM02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Prd-VM]
}

############### MDWHs Prod Web01 VM  #############

module "create-MDWHs-Prod-WebVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsPrdWebVM01 #this should be static
  computerName = var.MDWHsPrdWebVM01 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Prd-VM.rgName

  nicIds = [module.create-Nic-MDWHsPrdWebVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F8s_v2" #should be static across environments

  osDiskName                = var.WebVM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.Webvm01storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.MDWHs-Prd-WebVM-Tags.tagsResult

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
  EncryptVMsettings        = local.EncryptVMsettingsgenuksstgbosw01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsprdbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsPrdWebVM01]
}

######################## Domain Join- WebVM01 #######################
module "domainJoinmdwhsprdwebvm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Prod-WebVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Prod-WebVM01]
}

############### MDWHs Prod App01 VM  #############

module "create-MDWHs-Prod-AppVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsPrdAppVM01 #this should be static
  computerName = var.MDWHsPrdAppVM01 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Prd-VM.rgName

  nicIds = [module.create-Nic-MDWHsPrdAppVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F48s_v2" #should be static across environments

  osDiskName                = var.AppVM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.Appvm01storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.MDWHs-Prd-AppVM-Tags.tagsResult

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
  EncryptVMsettings        = local.EncryptVMsettingsguksprdhmdboa01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsprdbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsPrdAppVM01]
}

######################## Domain Join- AppVM01 #######################
module "domainJoinmdwhsprdAppvm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Prod-AppVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Prod-AppVM01]
}

############### MDWHs Prod App02 VM  #############

module "create-MDWHs-Prod-AppVM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsPrdAppVM02 #this should be static
  computerName = var.MDWHsPrdAppVM02 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Prd-VM.rgName

  nicIds = [module.create-Nic-MDWHsPrdAppVM02.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F48s_v2" #should be static across environments

  osDiskName                = var.AppVM02OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.Appvm02storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags = module.MDWHs-Prd-AppVM-Tags.tagsResult

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
  EncryptVMsettings        = local.EncryptVMsettingsguksprdhmdboa02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsprdbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsPrdAppVM02]
}

######################## Domain Join- AppVM02 #######################
module "domainJoinmdwhsprdAppvm02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Prod-AppVM02.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Prod-AppVM02]
}

############### UAT Resources  ######################

################ Resource Group - MDWHs UAT VM  #############
module "create-Target-Rg-MDWHs-Uat-VM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"


  resourceGroupName = var.MDWHsUatVmRgName
  resourceLocation  = var.MDWHsResourceLocation

  additionalTags = module.MDWHs-Uat-resourceGroupTags.tagsResult //
}

################ NIC - MDWHs Uat VM's #############

module "create-Nic-MDWHsUatWebVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsUatWebVM01nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Uat-VM.rgName

  subnetId = data.azurerm_subnet.MDWHsUatVmSubnet.id

  enable_nic_ip_forwarding          = var.Uat_enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.Uat_enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsUatWebVM01nicIpConfigName #should be static
  ipAddress                         = local.MDWHsUatWebVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Uat-VM]
}

module "create-Nic-MDWHsUatAppVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsUatAppVM01nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Uat-VM.rgName

  subnetId = data.azurerm_subnet.MDWHsUatVmSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsUatAppVM01nicIpConfigName
  ipAddress                         = local.MDWHsUatAppVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Uat-VM]
}

module "create-Nic-MDWHsUatAppVM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.MDWHsUatAppVM02nicName #should be static
  location          = var.MDWHsResourceLocation
  resourceGroupName = module.create-Target-Rg-MDWHs-Uat-VM.rgName

  subnetId                          = data.azurerm_subnet.MDWHsUatVmSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.MDWHsUatAppVM02nicIpConfigName #should be static
  ipAddress                         = local.MDWHsUatAppVM02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Uat-VM]
}

############### MDWHs UAT Web01 VM  #############

module "create-MDWHs-Uat-WebVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsUatWebVM01 #this should be static
  computerName = var.MDWHsUatWebVM01 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Uat-VM.rgName

  nicIds = [module.create-Nic-MDWHsUatWebVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F8s_v2" #should be static across environments

  osDiskName                = var.UatWebVM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.UatWebvm01storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.MDWHs-Uat-WebVM-Tags.tagsResult

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
  EncryptVMsettings        = local.EncryptVMsettingsguksuathmdbow01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsUatbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsUatWebVM01]
}

######################## Domain Join- WebVM01 #######################
module "domainJoinmdwhsUatwebvm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Uat-WebVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Uat-WebVM01]
}

############### MDWHs UAT App01 VM  #############

module "create-MDWHs-Uat-AppVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsUatAppVM01 #this should be static
  computerName = var.MDWHsUatAppVM01 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Uat-VM.rgName

  nicIds = [module.create-Nic-MDWHsUatAppVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F48s_v2" #should be static across environments

  osDiskName                = var.UatAppVM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.UatAppvm01storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.MDWHs-Uat-AppVM-Tags.tagsResult

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
  EncryptVMsettings        = local.EncryptVMsettingsguksuathmdboa01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsUatbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsUatAppVM01]
}

######################## Domain Join- AppVM01 #######################
module "domainJoinmdwhsUatAppvm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Uat-AppVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Uat-AppVM01]
}

############### MDWHs UAT App02 VM  #############

module "create-MDWHs-Uat-AppVM02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.MDWHsUatAppVM02 #this should be static
  computerName = var.MDWHsUatAppVM02 #should be static across environments

  location        = var.MDWHsResourceLocation
  vmResourceGroup = module.create-Target-Rg-MDWHs-Uat-VM.rgName

  nicIds = [module.create-Nic-MDWHsUatAppVM02.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F48s_v2" #should be static across environments

  osDiskName                = var.UatAppVM02OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.UatAppvm02storageDiskName #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags = module.MDWHs-Uat-AppVM02-Tags.tagsResult

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
  EncryptVMsettings        = local.EncryptVMsettingsguksuathmdboa02

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsUatbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsUatAppVM02]
}

######################## Domain Join- AppVM02 #######################
module "domainJoinmdwhsUatAppvm02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-MDWHs-Uat-AppVM02.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-MDWHs-Uat-AppVM02]
}


#################### Enable Backu MDWHs Prod VM ############################

resource "azurerm_backup_protected_vm" "MDWHs-Prd-VM-Backup" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.create-MDWHs-Prod-WebVM01, module.create-MDWHs-Prod-AppVM01, module.create-MDWHs-Prod-AppVM02, module.create-MDWHs-Uat-WebVM01, module.create-MDWHs-Uat-AppVM01, module.create-MDWHs-Uat-AppVM02, ]
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

################# MDW Prd &UAT VM Import ###########################

######################## Upload PrepVM PS1 file for VM extensions#############

resource "azurerm_storage_blob" "uploadPrepvm01Script" {
  name                   = "PrepareVM-01.ps1"
  storage_account_name   = var.auxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVM-01.ps1"
}

############### Resource Group - MDWHs Uat VM04  #############

module "create-Target-Rg-MDWHs-Uat-VM04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.MDWHsUatVm04RgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Uat-resourceGroupTags.tagsResult //
}

################ Resource Group - MDWHs Prd VM04  #############

module "create-Target-Rg-MDWHs-Prd-VM04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.MDWHsPrdVm04RgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Prd-resourceGroupTags.tagsResult //
}

############### NIC for Uat VM-04 ##############

module "create-Nic-MDWHsUatVM04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest"

  nicName                           = var.MDWHsUatVM04nicName #should be static
  location                          = var.MDWHsResourceLocation
  resourceGroupName                 = var.MDWHsUatVm04RgName
  subnetId                          = data.azurerm_subnet.MDWHsUatVm04Subnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forward
  enable_nic_accelerated_networking = var.enable_nic_accelerate_networking
  nicIpConfigName                   = var.MDWHsUatVM04nicIpConfigName
  ipAddress                         = local.MDWHsUatVM04PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Uat-VM04]
}

############### NIC for Prd VM-04 ##############

module "create-Nic-MDWHsPrdVM04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest"

  nicName                           = var.MDWHsPrdVM04nicName #should be static
  location                          = var.MDWHsResourceLocation
  resourceGroupName                 = var.MDWHsPrdVm04RgName
  subnetId                          = data.azurerm_subnet.MDWHsPrdVm04Subnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forward
  enable_nic_accelerated_networking = var.enable_nic_accelerate_networking
  nicIpConfigName                   = var.MDWHsPrdVM04nicIpConfigName
  ipAddress                         = local.MDWHsPrdVM04PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-MDWHs-Prd-VM04]
}

############### MDWHs UAT VM-01 #############

module "create-MDWHs-UAT-VM04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v2.0.4"

  vmName                    = var.MDWHsUatVM04 #this should be static
  computerName              = var.MDWHsUatVM04 #should be static across environments
  location                  = var.MDWHsResourceLocation
  vmResourceGroup           = var.MDWHsUatVm04RgName
  nicIds                    = [module.create-Nic-MDWHsUatVM04.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D4s_v3"     #should be static across environments
  osDiskName                = var.UatVM04OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  userAdminName             = data.azurerm_key_vault_secret.adminUser1.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  additionalTags            = module.MDWHs-Uat-WebVM-Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  PrepVMprotected_settings  = local.MDWHsUatPrdVM04_PrepVMprotected_settings
  PrepVMsettings            = local.MDWHsUatPrdVM04_PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsguksuthmdwirt01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsUatbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsUatVM04]
}

######################## Domain Join- MDWHs-Uat-VM04 #######################

resource "azurerm_virtual_machine_extension" "MDWHs-Uat-VM04-domjoin" {
  name                 = "join-domain"
  virtual_machine_id   = module.create-MDWHs-UAT-VM04.vmId
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

######## importing backup for imported VM #################

### MDWHs-UAT-VM-04-Backup #########

resource "azurerm_backup_protected_vm" "MDWHs-Uat-VM-04-Backup" {
  recovery_vault_name = var.MDWHsUatPrdrsv_name
  resource_group_name = var.MDWHsUatPrdrsv_rg_name
  source_vm_id        = module.create-MDWHs-UAT-VM04.vmId
  backup_policy_id    = data.azurerm_backup_policy_vm.Daily-2200-52W-InfraVM.id
}

############### MDWHs PRD VM-04 #############

module "create-MDWHs-PRD-VM04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v2.0.4"

  vmName                    = var.MDWHsPrdVM04 #this should be static
  computerName              = var.MDWHsPrdVM04 #should be static across environments
  location                  = var.MDWHsResourceLocation
  vmResourceGroup           = var.MDWHsPrdVm04RgName
  nicIds                    = [module.create-Nic-MDWHsPrdVM04.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D4s_v3"     #should be static across environments
  osDiskName                = var.PrdVM04OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  userAdminName             = data.azurerm_key_vault_secret.adminUser1.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  additionalTags            = module.MDWHs-Prd-AppVM-Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  PrepVMprotected_settings  = local.MDWHsUatPrdVM04_PrepVMprotected_settings
  PrepVMsettings            = local.MDWHsUatPrdVM04_PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsguksprhmdwirt01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.mdwhsUatbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-MDWHsPrdVM04]
}

######################## Domain Join- MDWHs-Prd-VM04 #######################

resource "azurerm_virtual_machine_extension" "MDWHs-Prd-VM04-domjoin" {
  name                 = "join-domain"
  virtual_machine_id   = module.create-MDWHs-PRD-VM04.vmId
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

#### MDWHs-Prd-VM-04-Backup #########

resource "azurerm_backup_protected_vm" "MDWHs-Prd-VM-04-Backup" {
  recovery_vault_name = var.MDWHsUatPrdrsv_name
  resource_group_name = var.MDWHsUatPrdrsv_rg_name
  source_vm_id        = module.create-MDWHs-PRD-VM04.vmId
  backup_policy_id    = data.azurerm_backup_policy_vm.Daily-2200-52W-InfraVM.id
}
