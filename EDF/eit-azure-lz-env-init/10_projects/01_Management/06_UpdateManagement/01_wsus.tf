################ Resource Group - managementHs Wsus #############
module "createTargetRgForWsus" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.wsusRgName
  resourceLocation  = var.wsusLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

################ NIC - managementHs Wsus #############
module "createNicForWsusVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = "eitukshswus01-nic-01" #should be static
  location          = var.wsusLocation
  resourceGroupName = module.createTargetRgForWsus.rgName

  subnetId = data.azurerm_subnet.wsusSubnet.id

  nicIpConfigName = "eitukshswus01-nic-01-Ip-Config" #should be static
  ipName          = "eitukshswus01-nic-01-Ip"        #should be static
  ipAddress       = local.privateStaticIpAddress
}

################ ASet - managementHs Wsus #############
module "createAsetWsus" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet?ref=v1.1.19"

  aSetname          = "eit-uks-alz-hs-wsus-avs" #should be static
  location          = var.wsusLocation
  resourceGroupName = module.createTargetRgForWsus.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.wsusVmTags.tagsResult
}

################ VM - managementHs Wsus #############
module "createWsusVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName          = "eitukshswus01" #this should be static
  location        = var.wsusLocation
  vmResourceGroup = module.createTargetRgForWsus.rgName

  nicIds = [module.createNicForWsusVm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = "eitukshswus01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = "eitukshswus01-datadisk" #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "1024"
  storageDataDiskCaching  = "None"


  computerName      = "eitukshswus01" #should be static across environments
  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetWsus.aSetId

  additionalTags = module.wsusVmTags.tagsResult

  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  IaaSAntiMalware          = var.IaaSAntiMalware

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

#################Domain Join WSUS VM #############
module "domainJoinWsus" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createWsusVm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
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
