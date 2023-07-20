################ Resource Group - managementHs PKI  #############
module "createTargetRgForLzmanagementHsPki" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsPkiRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "createTargetRgForLzmanagementHsWac" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementHsWacRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

################ NIC - managementHs PKI #############
module "createNicForPkiEaRootVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshsrca01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukshsrca01-nic-01-Ip-Config" #should be static
  ipName          = "eitukshsrca01-nic-01-Ip"        #should be static
  ipAddress       = local.pkiEaRootPrivateIpAddress
}

module "createNicForPkiCa01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshsica01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukshsica01-nic-01-Ip-Config" #should be static
  ipName          = "eitukshsica01-nic-01-Ip"        #should be static
  ipAddress       = local.pkiCa01PrivateIpAddress
}

module "createNicForPkiCa02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshsrca02-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukshsica02-nic-01-Ip-Config" #should be static
  ipName          = "eitukshsica02-nic-01-Ip"        #should be static
  ipAddress       = local.pkiCa02PrivateIpAddress
}

module "createNicForWebPki01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshscaweb01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukshscaweb01-nic-01-Ip-Config" #should be static
  ipName          = "eitukshscaweb01-nic-01-Ip"        #should be static
  ipAddress       = local.pkiWebPki01PrivateIpAddress
}

module "createNicForWebPki02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshscaweb02-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName

  subnetId = data.azurerm_subnet.pkiSubnet.id

  nicIpConfigName = "eitukshscaweb02-nic-01-Ip-Config" #should be static
  ipName          = "eitukshscaweb02-nic-01-Ip"        #should be static
  ipAddress       = local.pkiWebPki02PrivateIpAddress
}

module "createNicForWac01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshswac01-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsWac.rgName

  subnetId = data.azurerm_subnet.wacSubnet.id

  nicIpConfigName = "eitukshswac01-nic-01-Ip-Config" #should be static
  ipName          = "eitukshswac01-nic-01-Ip"        #should be static
  ipAddress       = local.wac01PrivateIpAddress
}

module "createNicForWac02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshscaweb02-nic-01" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsWac.rgName

  subnetId = data.azurerm_subnet.wacSubnet.id

  nicIpConfigName = "eitukshscaweb02-nic-01-Ip-Config" #should be static
  ipName          = "eitukshscaweb02-nic-01-Ip"        #should be static
  ipAddress       = local.wac02PrivateIpAddress
}

################ ASet - managementHs PKI #############
module "createAsetPkiEaRoot" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = "eit-uks-alz-hs-rca-avs" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.pkiEaRootAsetTags.tagsResult
}

module "createAsetPkiCa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = "eit-uks-alz-hs-ica-avs" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.pkiCaVmTags.tagsResult
}

module "createAsetWebPki" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = "eit-uks-alz-hs-caweb-avs" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsPki.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.webPkiVmTags.tagsResult
}

module "createAsetWac" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = "eit-uks-alz-hs-wac-avs" #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsWac.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.wacVmTags.tagsResult
}

################ VM - managementHs Pki #############
# module "createPkiEaRootVm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

#   vmName       = "eitukshsrca01" #this should be static
#   computerName = "eitukshsrca01" #should be static across environments

#   location        = var.lzHubManagementResourceLocation
#   vmResourceGroup = module.createTargetRgForLzmanagementHsPki.rgName

#   nicIds = [module.createNicForPkiEaRootVm.nicId]

#   osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
#   osImageOffer     = "WindowsServer"          #should be static across environments
#   osImageSku       = "2019-Datacenter"        #should be static across environments
#   osImageVersion   = "latest"

#   vmSize = "Standard_D2_V3" #should be static across environments

#   delete_os_disk   = false
#   delete_data_disk = false

#   osDiskName                = "eitukshsrca01-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"

#   storageDiskName         = "eitukshsrca01-datadisk" #should be static across environments
#   storageDiskType         = "Standard_LRS"
#   storageDiskCreateOption = "Empty"
#   storageDiskSizeGb       = "128"
#   storageDataDiskCaching  = "None"

#   userAdminName     = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

#   availabilitySetId = module.createAsetPkiEaRoot.aSetId

#   additionalTags = module.pkiEaRootVmTags.tagsResult

#   PrepVMprotected_settings = local.PrepVMprotected_settings
#   PrepVMsettings           = local.PrepVMsettings

#   IaaSAntiMalware = var.IaaSAntiMalware

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
# }

# module "createPkiCa01Vm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

#   vmName       = "eitukshsica01" #this should be static
#   computerName = "eitukshsica01" #should be static across environments

#   location        = var.lzHubManagementResourceLocation
#   vmResourceGroup = module.createTargetRgForLzmanagementHsPki.rgName

#   nicIds = [module.createNicForPkiCa01Vm.nicId]

#   osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
#   osImageOffer     = "WindowsServer"          #should be static across environments
#   osImageSku       = "2019-Datacenter"        #should be static across environments
#   osImageVersion   = "latest"

#   vmSize = "Standard_D2_V3" #should be static across environments

#   delete_os_disk   = false
#   delete_data_disk = false

#   osDiskName                = "eitukshsica01-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"

#   storageDiskName         = "eitukshsica01-datadisk" #should be static across environments
#   storageDiskType         = "Standard_LRS"
#   storageDiskCreateOption = "Empty"
#   storageDiskSizeGb       = "128"
#   storageDataDiskCaching  = "None"

#   userAdminName     = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

#   availabilitySetId = module.createAsetPkiCa.aSetId

#   additionalTags = module.pkiCaVm01Tags.tagsResult

#   PrepVMprotected_settings = local.PrepVMprotected_settings
#   PrepVMsettings           = local.PrepVMsettings

#   IaaSAntiMalware = var.IaaSAntiMalware

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
# }

# module "createPkiCa02Vm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

#   vmName       = "eitukshsica02" #this should be static
#   computerName = "eitukshsica02" #should be static across environments

#   location        = var.lzHubManagementResourceLocation
#   vmResourceGroup = module.createTargetRgForLzmanagementHsPki.rgName

#   nicIds = [module.createNicForPkiCa02Vm.nicId]

#   osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
#   osImageOffer     = "WindowsServer"          #should be static across environments
#   osImageSku       = "2019-Datacenter"        #should be static across environments
#   osImageVersion   = "latest"

#   vmSize = "Standard_D2_V3" #should be static across environments
#   delete_os_disk   = false
#   delete_data_disk = false

#   osDiskName                = "eitukshsica02-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"

#   storageDiskName         = "eitukshsica02-datadisk" #should be static across environments
#   storageDiskType         = "Standard_LRS"
#   storageDiskCreateOption = "Empty"
#   storageDiskSizeGb       = "128"
#   storageDataDiskCaching  = "None"

#   userAdminName     = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

#   availabilitySetId = module.createAsetPkiCa.aSetId

#   additionalTags = module.pkiCaVm02Tags.tagsResult

#   PrepVMprotected_settings = local.PrepVMprotected_settings
#   PrepVMsettings           = local.PrepVMsettings

#   IaaSAntiMalware = var.IaaSAntiMalware

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
# }

# module "createWebPki01Vm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

#   vmName       = "eitukshscaweb01" #this should be static
#   computerName = "eitukshscaweb01" #should be static across environments

#   location        = var.lzHubManagementResourceLocation
#   vmResourceGroup = module.createTargetRgForLzmanagementHsPki.rgName

#   nicIds = [module.createNicForWebPki01Vm.nicId]

#   osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
#   osImageOffer     = "WindowsServer"          #should be static across environments
#   osImageSku       = "2019-Datacenter"        #should be static across environments
#   osImageVersion   = "latest"

#   vmSize = "Standard_D2_V3" #should be static across environments

#   delete_os_disk   = false
#   delete_data_disk = false

#   osDiskName                = "eitukshscaweb01-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"

#   storageDiskName         = "eitukshscaweb01-datadisk" #should be static across environments
#   storageDiskType         = "Standard_LRS"
#   storageDiskCreateOption = "Empty"
#   storageDiskSizeGb       = "128"
#   storageDataDiskCaching  = "None"

#   userAdminName     = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

#   availabilitySetId = module.createAsetWebPki.aSetId

#   additionalTags = module.webPkiVm01Tags.tagsResult

#   PrepVMprotected_settings = local.PrepVMprotected_settings
#   PrepVMsettings           = local.PrepVMsettings

#   IaaSAntiMalware = var.IaaSAntiMalware

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
# }
/*
module "createWebPki02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eitukshscaweb02" #this should be static
  computerName = "eitukshscaweb02" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementHsPki.rgName

  nicIds = [module.createNicForWebPki02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments
  delete_os_disk   = false
  delete_data_disk = false

  osDiskName                = "eitukshscaweb02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukshscaweb02-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetWebPki.aSetId

  additionalTags = module.webPkiVm02Tags.tagsResult

  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings

  IaaSAntiMalware = var.IaaSAntiMalware

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
} */
/*
###################### Internal Load Balancer for PKI Web Service ####################

module "createInternalLoadBalancer" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-internal-load-balancer"

  vNetName                = var.lzmanagementHsVnetName
  subnetName              = var.pkiSubnetName
  subnetID                = data.azurerm_subnet.pkiSubnet.id
  ipconfigName1           = "ipconfig1"                   #should be static across environments
  ipconfigName2           = "ipconfig1"                   #should be static across environments
  lbName                  = "eit-uks-alz-hs-caweb-int-lb" #should be static across environments
  FrontIpAllocationMethod = "Static"                      #should be static across environments
  resourceGroupName       = module.createTargetRgForLzmanagementHsPki.rgName
  location                = var.lzHubManagementResourceLocation
  lb_Sku                  = "Basic"                    #should be static across environments
  healthProbProtocol      = "TCP"                      #should be static across environments
  healthProbProtocolPort  = "443"                      #should be static across environments
  lbRuleName              = "pkiweb-ilb-rule1"         #should be static across environments
  lbRuleProtocol          = "TCP"                      #should be static across environments
  lbRuleFrontPort         = "443"                      #should be static across environments
  lbRuleBackPort          = "443"                      #should be static across environments
  backPoolIPConfigName    = "eit-uks-alz-caweb-ilb-be" #should be static across environments
  vm1NicID                = module.createNicForWebPki01Vm.nicId
  vm2NicID                = module.createNicForWebPki02Vm.nicId

}
*/
###################### VM Windows Admin center ############################
/*
module "createWac01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = "eitukshswac01" #this should be static
  computerName = "eitukshswac01" #should be static across environments

  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagementHsWac.rgName

  nicIds = [module.createNicForWac01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_E4_V3" #should be static across environments
  delete_os_disk   = false
  delete_data_disk = false
  osDiskName                = "eitukshswac01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukshswac01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "128"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetWac.aSetId

  additionalTags = module.wacVm01Tags.tagsResult

  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings

  IaaSAntiMalware = var.IaaSAntiMalware

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSMonitoringAgent         = true
  MSDependencyAgent         = false
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}
*/
# ###################################### Wac 02 VM ##########################################################

# module "createWac02Vm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

#   vmName       = "eitukshswac02" #this should be static
#   computerName = "eitukshswac02" #should be static across environments

#   location        = var.lzHubManagementResourceLocation
#   vmResourceGroup = module.createTargetRgForLzmanagementHsWac.rgName

#   delete_os_disk   = false
#   delete_data_disk = false

#   nicIds = [module.createNicForWac02Vm.nicId]

#   osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
#   osImageOffer     = "WindowsServer"          #should be static across environments
#   osImageSku       = "2019-Datacenter"        #should be static across environments
#   osImageVersion   = "latest"

#   vmSize = "Standard_B2S" #should be static across environments

#   osDiskName                = "eitukshswac02-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"

#   storageDiskName         = "eitukshswac02-datadisk" #should be static across environments
#   storageDiskType         = "Standard_LRS"
#   storageDiskCreateOption = "Empty"
#   storageDiskSizeGb       = "128"
#   storageDataDiskCaching  = "None"

#   userAdminName     = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

#   availabilitySetId = module.createAsetWac.aSetId

#   additionalTags = module.wacVm02Tags.tagsResult

#   PrepVMprotected_settings = local.PrepVMprotected_settings
#   PrepVMsettings           = local.PrepVMsettings

#   IaaSAntiMalware = var.IaaSAntiMalware

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
# }

# ######################## snapshot of both disks ##########################################
# resource "azurerm_snapshot" "exampleos" {
#   name                = "eitukshswac02-osdisk-snapshot"
#   location            = var.lzHubManagementResourceLocation
#   resource_group_name = module.createTargetRgForLzmanagementHsWac.rgName
#   create_option       = "Copy"
#   source_uri          = "/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-wac-rg/providers/Microsoft.Compute/disks/eitukshswac02-osdisk"
# }

# ########################### Snapshot of data disk ############################################
# resource "azurerm_snapshot" "exampledata" {
#   name                = "eitukshswac02-datadisk-snapshot"
#   location            = var.lzHubManagementResourceLocation
#   resource_group_name = module.createTargetRgForLzmanagementHsWac.rgName
#   create_option       = "Copy"
#   source_uri          = "/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-wac-rg/providers/Microsoft.Compute/disks/eitukshswac02-datadisk"
# }

######################### Managed disk creation ##########################################

# resource "azurerm_managed_disk" "copyos" {
#   name                       = "eitukshswac02-osdisk1"
#   location                   = var.lzHubManagementResourceLocation
#   resource_group_name        = module.createTargetRgForLzmanagementHsWac.rgName
#   storage_account_type       = "Standard_LRS"
#   create_option              = "Copy"
#   source_resource_id         = "/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-wac-rg/providers/Microsoft.Compute/snapshots/eitukshswac02-osdisk-snapshot"
#   os_type                    = "Windows"
#   zones                      = ["2"]
#   hyper_v_generation         = "V1"
#   on_demand_bursting_enabled = false
#   trusted_launch_enabled     = false
#   encryption_settings {
#     enabled = true

#     disk_encryption_key {
#       secret_url      = "https://eit-uks-alz-hs-ade-kvt.vault.azure.net/secrets/FC25AF99-0D1C-4403-9C6B-92FB7DF5B4AD/be94e849705b4f4ea77cb00af98d67e0"
#       source_vault_id = data.azurerm_key_vault.HsAdeKeyVault.id #"/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-ade-rg-01/providers/Microsoft.KeyVault/vaults/eit-uks-alz-hs-ade-kvt"
#     }

#     key_encryption_key {
#       key_url         = data.azurerm_key_vault_key.wacvm.id     #"https://eit-uks-alz-hs-ade-kvt.vault.azure.net/keys/eitukshswac01-ade-01/c505e71e6df64e19b9fd1d1bce671a48"
#       source_vault_id = data.azurerm_key_vault.HsAdeKeyVault.id #"/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-ade-rg-01/providers/Microsoft.KeyVault/vaults/eit-uks-alz-hs-ade-kvt"
#     }
#   }
#   tags = module.wacVm02Tags.tagsResult
# }

# resource "azurerm_managed_disk" "copydata" {
#   name                 = "eitukshswac02-datadisk1"
#   location             = var.lzHubManagementResourceLocation
#   resource_group_name  = module.createTargetRgForLzmanagementHsWac.rgName
#   storage_account_type = "Standard_LRS"
#   create_option        = "Copy"
#   source_resource_id   = "/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-wac-rg/providers/Microsoft.Compute/snapshots/eitukshswac02-datadisk-snapshot"
#   os_type              = "Windows"
#   zones                = ["2"]
#   encryption_settings {
#     enabled = true

#     disk_encryption_key {
#       secret_url      = "https://eit-uks-alz-hs-ade-kvt.vault.azure.net/secrets/02E9980C-76B9-424C-9B91-3AF6779C49E6/e73bfe07f2f849d78499b95c60c6b653"
#       source_vault_id = data.azurerm_key_vault.HsAdeKeyVault.id #"/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-ade-rg-01/providers/Microsoft.KeyVault/vaults/eit-uks-alz-hs-ade-kvt"
#     }

#     key_encryption_key {
#       key_url         = data.azurerm_key_vault_key.wacvm.id     #"https://eit-uks-alz-hs-ade-kvt.vault.azure.net/keys/eitukshswac01-ade-01/c505e71e6df64e19b9fd1d1bce671a48"
#       source_vault_id = data.azurerm_key_vault.HsAdeKeyVault.id #"/subscriptions/0a62fb3b-5480-482c-9ddd-0c65b86b030c/resourceGroups/eit-uks-alz-hs-ade-rg-01/providers/Microsoft.KeyVault/vaults/eit-uks-alz-hs-ade-kvt"
#     }
#   }
#   tags = module.wacVm02Tags.tagsResult
# }
##################### Create a VM Wac 01 with Azone #########################################################

module "createWac01Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshswac01"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsWac.rgName
  nicIds                   = [module.createNicForWac01Vm.nicId]
  zones                    = ["1"]
  #availabilitySetId        = azurerm_availability_set.example.id
  delete_os_disk   = false
  delete_data_disk = false

  vmSize = "Standard_E4_V3"

  osDiskName                = "eitukshswac01-osdisk01"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.wac01osdiskid.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshswac01-datadisk01"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.wac01datadiskid.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.wacVm01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
################################# Wac 01 VM End ############################################

##################### Create a VM Wac 02 with Azone #########################################################

module "createWac02Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshswac02"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsWac.rgName
  nicIds                   = [module.createNicForWac02Vm.nicId]
  zones                    = ["2"]
  #availabilitySetId        = azurerm_availability_set.example.id
  delete_os_disk   = true
  delete_data_disk = true

  vmSize = "Standard_B2S"

  osDiskName                = "eitukshswac02-osdisk1"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.eitukshswac02-osdisk1.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshswac02-datadisk1"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.eitukshswac02-datadisk1.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.wacVm02Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
################################# Wac 02 VM End ############################################
##################### Create a VM Web 01 with Azone #########################################################

module "createWab01Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshscaweb01"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsPki.rgName
  nicIds                   = [module.createNicForWebPki01Vm.nicId]
  zones                    = ["1"]
  #availabilitySetId        = azurerm_availability_set.example.id
  delete_os_disk   = false
  delete_data_disk = false

  vmSize = "Standard_D2_V3"

  osDiskName                = "eitukshscaweb01-osdisk01"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.web01osdiskid.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshscaweb01-datadisk01"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.web01datadiskid.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.webPkiVm01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
################################# Web 01 VM End ############################################

##################### Create a VM Web 02 with Azone #########################################################

module "createWab02Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshscaweb02"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsPki.rgName
  nicIds                   = [module.createNicForWebPki02Vm.nicId]
  zones                    = ["2"]
  #availabilitySetId        = azurerm_availability_set.example.id
  delete_os_disk   = false
  delete_data_disk = false

  vmSize = "Standard_D2_V3"

  osDiskName                = "eitukshscaweb02-osdisk01"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.web02osdiskid.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshscaweb02-datadisk01"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.web02datadiskid.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.webPkiVm02Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
##################### Create a VM ica 01 with Azone #########################################################

module "createica01Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshsica01"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsPki.rgName
  nicIds                   = [module.createNicForPkiCa01Vm.nicId]
  zones                    = ["1"]
  #availabilitySetId        = azurerm_availability_set.example.id

  vmSize = "Standard_D2_V3"

  delete_os_disk   = false
  delete_data_disk = false

  osDiskName                = "eitukshsica01-osdisk01"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.ica01osdiskid.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshsica01-datadisk01"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.ica01datadiskid.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.pkiCaVm01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
################################# ica 01 VM End ############################################

##################### Create a VM ica 02 with Azone #########################################################

module "createica02Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshsica02"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsPki.rgName
  nicIds                   = [module.createNicForPkiCa02Vm.nicId]
  zones                    = ["2"]
  #availabilitySetId        = azurerm_availability_set.example.id

  vmSize = "Standard_D2_V3"

  delete_os_disk   = false
  delete_data_disk = false

  osDiskName                = "eitukshsica02-osdisk01"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.ica02osdiskid.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshsica02-datadisk01"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.ica02datadiskid.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.pkiCaVm02Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
################################# ica 02 VM End ############################################
##################### Create a VM rca 01 with Azone #########################################################

module "createrca01Vm" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk-os-data?ref=v1.1.19"

  InstallIaaSAntiMalwareDC = false
  isDC                     = false
  prepvm                   = false
  MSMonitoringAgent        = true
  MSDependencyAgent        = true
  MSNetworkWatcher         = false
  vmName                   = "eitukshsrca01"
  location                 = var.lzHubManagementResourceLocation
  vmResourceGroup          = module.createTargetRgForLzmanagementHsPki.rgName
  nicIds                   = [module.createNicForPkiEaRootVm.nicId]
  zones                    = ["1"]
  #availabilitySetId        = azurerm_availability_set.example.id

  vmSize = "Standard_D2_V3"

  delete_os_disk   = false
  delete_data_disk = false

  osDiskName                = "eitukshsrca01-osdisk01"
  storageosDiskCreateOption = "Attach"
  storageosDiskCaching      = "ReadWrite"
  managed_os_disk_id        = data.azurerm_key_vault_secret.rca01osdiskid.value
  os_type                   = "Windows"
  managed_os_disk_type      = "Standard_LRS"

  dataDiskName                = "eitukshsrca01-datadisk01"
  managed_data_disk_type      = "Standard_LRS"
  storagedataDiskCreateOption = "Attach"
  lun                         = 0
  data_disk_size              = "128"
  managed_data_disk_id        = data.azurerm_key_vault_secret.rca01datadiskid.value

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  additionalTags           = module.pkiEaRootVmTags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  PrepVMsettings           = local.PrepVMsettings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
}
################################# rca 01 VM End ############################################

######################## Domain Join- Windows Admin Center #######################
/*
module "domainJoinWac1" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWac01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}
*/
# module "domainJoinWac2" {

#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

#   vmId               = module.createWac02Vm.vmId
#   domainName         = data.azurerm_key_vault_secret.adDomainName.value
#   ouPath             = var.ouPath
#   userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
#   passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

# }

######################## Domain Join- PKI VMs excluded root CA VM as per design #######################
# module "domainJoinPkiCa01" {

#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

#   vmId               = module.createPkiCa01Vm.vmId
#   domainName         = data.azurerm_key_vault_secret.adDomainName.value
#   ouPath             = var.ouPath
#   userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
#   passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

# }

# module "domainJoinPkiCa02" {

#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

#   vmId               = module.createPkiCa02Vm.vmId
#   domainName         = data.azurerm_key_vault_secret.adDomainName.value
#   ouPath             = var.ouPath
#   userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
#   passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

# }

# module "domainJoinPkiweb01" {

#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

#   vmId               = module.createWebPki01Vm.vmId
#   domainName         = data.azurerm_key_vault_secret.adDomainName.value
#   ouPath             = var.ouPath
#   userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
#   passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

# }
/*
module "domainJoinPkiweb02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createWebPki02Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

}
*/
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

resource "azurerm_storage_blob" "MARS" {
  name                   = "MARS.exe"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/MARS.exe"
}

################ Resource Group - managementHs AFS  #############
module "createTargetRgForLzmanagementHsAFS" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.lzmanagementHsAFSVmRgName
  resourceLocation  = var.lzHubManagementResourceLocation
  additionalTags    = module.resourceGroupTagsAfs.tagsResult
}
module "createNicForHsAFS01Vm" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"
  nicName           = var.afshsnic01name #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagementHsAFS.rgName
  subnetId          = data.azurerm_subnet.AFSSubnetName.id
  nicIpConfigName   = var.nicIpConfigName #"eitukshsafs01-nic-01-Ip-Config" #should be static
  ipName            = var.nicipName       #"eitukshsafs01-nic-01-Ip"        #should be static
  ipAddress         = local.AFS01PrivateIpAddress
}
module "createAFS01Vm" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"
  vmName                    = var.afshsvm01Name #"eituksssafs01" #this should be static
  computerName              = var.afshsvm01Name #"eituksssafs01" #should be static across environments
  location                  = var.lzHubManagementResourceLocation
  vmResourceGroup           = module.createTargetRgForLzmanagementHsAFS.rgName
  nicIds                    = [module.createNicForHsAFS01Vm.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D2_V4" #should be static across environments
  osDiskName                = var.vmosDiskName #"eituksssafs01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  storageDiskName           = var.vmstorageDiskName #"eituksssafs01-datadisk" #should be static across environments
  storageDiskType           = "StandardSSD_LRS"
  storageDiskCreateOption   = "Empty"
  storageDiskSizeGb         = "512"
  storageDataDiskCaching    = "None"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.AFSVm01Tags.tagsResult
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

###################################### Module Domain Join AFS ###########################
module "domainJoinAFS01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"
  vmId               = module.createAFS01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
}
######################### Backup Recovery Service Vault AFS HS VM############################
resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createAFS01Vm]
}

########################## Resource Group - VM DC03 & DC04 ##############
# module "createTargetRgForLzmanagementHsDc03" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
#   resourceGroupName = var.lzmanagementHsDc03RgName
#   resourceLocation  = var.lzHubManagementResourceLocation
#   additionalTags    = module.dcresourceGroupTags.tagsResult
# }

################# Nic - DC03 ##############
module "createNicForDc03Vm" {
  source   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"
  nicName  = var.dc03vmnicName #should be static
  location = var.lzHubManagementResourceLocation
  # resourceGroupName = module.createTargetRgForLzmanagementHsDc03.rgName
  resourceGroupName = data.azurerm_resource_group.dcRg.name
  subnetId          = data.azurerm_subnet.dcSubnet.id
  nicIpConfigName   = var.dc03vmnicIpConfigName #should be static
  ipName            = var.dc03vmnicipName       #should be static
  ipAddress         = local.dc03PrivateIpAddress
}

################## NIC association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "asgdc03" {
  network_interface_id          = module.createNicForDc03Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgdc.id
}

##################### VM - AD DC03 ##############
module "createDc03Vm" {
  source          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"
  vmName          = var.dc03vmName #this should be static
  computerName    = var.dc03vmName #should be static across environments
  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = data.azurerm_resource_group.dcRg.name
  # vmResourceGroup  = module.createTargetRgForLzmanagementHsDc03.rgName
  nicIds                    = [module.createNicForDc03Vm.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D2_V3"     #should be static across environments
  osDiskName                = var.do03vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  storageDiskName           = var.dc03vmstorageDiskName #should be static across environments
  storageDiskType           = "Standard_LRS"
  storageDiskCreateOption   = "Empty"
  storageDiskSizeGb         = "128"
  storageDataDiskCaching    = "None"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.dc03VmTags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settingsDC
  PrepVMsettings            = local.PrepVMsettingsDC
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

###################################### Module Domain Join DC03 ###########################
module "domainJoinDc03" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"
  vmId               = module.createDc03Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPathDc
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
}

################# Nic - DC04 ##############
module "createNicForDc04Vm" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"
  nicName           = var.dc04vmnicName #should be static
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = data.azurerm_resource_group.dcRg.name
  # resourceGroupName = module.createTargetRgForLzmanagementHsDc03.rgName
  subnetId        = data.azurerm_subnet.dcSubnet.id
  nicIpConfigName = var.dc04vmnicIpConfigName #should be static
  ipName          = var.dc04vmnicipName       #should be static
  ipAddress       = local.dc04PrivateIpAddress
}

################## NICDC04 association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "asgdc04" {
  network_interface_id          = module.createNicForDc04Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgdc.id
}

##################### VM - AD DC04 ##############
module "createDc04Vm" {
  source          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"
  vmName          = var.dc04vmName #this should be static
  computerName    = var.dc04vmName #should be static across environments
  location        = var.lzHubManagementResourceLocation
  vmResourceGroup = data.azurerm_resource_group.dcRg.name
  # vmResourceGroup  = module.createTargetRgForLzmanagementHsDc03.rgName
  nicIds                    = [module.createNicForDc04Vm.nicId]
  osImagePublisher          = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer              = "WindowsServer"          #should be static across environments
  osImageSku                = "2019-Datacenter"        #should be static across environments
  osImageVersion            = "latest"
  vmSize                    = "Standard_D2_V3"     #should be static across environments
  osDiskName                = var.do04vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  storageDiskName           = var.dc04vmstorageDiskName #should be static across environments
  storageDiskType           = "Standard_LRS"
  storageDiskCreateOption   = "Empty"
  storageDiskSizeGb         = "128"
  storageDataDiskCaching    = "None"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["2"]
  additionalTags            = module.dc04VmTags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settingsDC
  PrepVMsettings            = local.PrepVMsettingsDC
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

###################################### Module Domain Join DC03 ###########################
module "domainJoinDc04" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"
  vmId               = module.createDc04Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPathDc
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
}



############## Ansible Patching VM ###################


##########################RG for Ansible Patching VM ##################################################

module "createTargetRgForLzmanagementhsAns" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzmanagementhsAnsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.AnsVmRGTags.tagsResult
}

###########NIC for  Ansible Patching VM###########################################################

module "createNicForAnsVm" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.ansvmnicName #should be static
  location                          = var.lzHubManagementResourceLocation
  resourceGroupName                 = module.createTargetRgForLzmanagementhsAns.rgName
  subnetId                          = data.azurerm_subnet.wacSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.AnsvmnicIpConfigName #should be static
  ipAddress                         = local.AnsPrivateIpAddress
}


# ################ VM01 #############
module "createAnsVm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.ansvm01name #this should be static
  computerName              = var.ansvm01name #should be static across environments
  location                  = var.lzHubManagementResourceLocation
  vmResourceGroup           = module.createTargetRgForLzmanagementhsAns.rgName
  nicIds                    = [module.createNicForAnsVm.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGname
  Imagegalleryname          = var.Imagegalleryname
  Imagename                 = var.Imagename
  ImageVersion              = var.ImageVersion
  vmSize                    = "Standard_D2_V3"  #should be static across environments
  osDiskName                = var.ansosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Standard_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.AnsVmRGTags.tagsResult
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  EncryptDisk               = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  MSDependencyAgent         = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsansvm01
  depends_on                = [module.createNicForAnsVm]
}

####################### Upload Djoin file for VM extensions for Dev #########################
resource "azurerm_storage_blob" "uploadDomainJoinScript" {
  name                   = "ubuntu_domainjoin.sh"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName-dj
  type                   = "Block"
  source                 = "${path.module}/scripts/ubuntu_domainjoin.sh"
}

module "domainjoinansvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createAnsVm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
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
