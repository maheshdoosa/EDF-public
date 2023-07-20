######################## Upload PrepVM PS1 file for VM extensions#############

resource "azurerm_storage_blob" "uploadPrepAdScript" {
  name                   = "PrepareVM.ps1"
  storage_account_name   = var.ComsyHSPrdAuxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVM.ps1"
}

resource "azurerm_storage_blob" "uploadGBRegion" {
  name                   = "GBRegion.xml"
  storage_account_name   = var.ComsyHSPrdAuxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/GBRegion.xml"
}

resource "azurerm_storage_blob" "uploadLAPS" {
  name                   = "LAPS.x64.msi"
  storage_account_name   = var.ComsyHSPrdAuxScriptsSA
  storage_container_name = var.auxContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/LAPS.x64.msi"
}

############### Production Resources  ######################

################ Resource Group - ComsyHS Prd VM  #############
module "create-Target-Rg-ComsyHS-Prd-VM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"


  resourceGroupName = var.ComsyHSPrdVmRgName
  resourceLocation  = var.ComsyHSResourceLocation

  additionalTags = module.ComsyHS-Prd-resourceGroupTags.tagsResult //
}

################ NIC - ComsyHS Prd VM's #############

module "create-Nic-ComsyHSPrdVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.ComsyHSPrdVM01nicName
  location          = var.ComsyHSResourceLocation
  resourceGroupName = module.create-Target-Rg-ComsyHS-Prd-VM.rgName

  subnetId = data.azurerm_subnet.ComsyHSPrdVmSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.ComsyHSPrdVM01nicIpConfigName
  ipAddress                         = local.ComsyHSPrdVM01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-ComsyHS-Prd-VM]
}


############### ComsyHS Prod VM01  #############

module "create-ComsyHS-Prod-VM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.ComsyHSPrdVM01 #this should be static
  computerName = var.ComsyHSPrdVM01 #should be static across environments

  location        = var.ComsyHSResourceLocation
  vmResourceGroup = module.create-Target-Rg-ComsyHS-Prd-VM.rgName

  nicIds = [module.create-Nic-ComsyHSPrdVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = var.VM01OSDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.VM01storageDiskName #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.ComsyHS-Prd-VM01-Tags.tagsResult

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
  bootDiagnosticsStorageUri = data.azurerm_storage_account.ComsyHSprdbootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.create-Nic-ComsyHSPrdVM01]
}

######################## Domain Join- WebVM01 #######################
module "domainJoinComsyHSprdwebvm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.create-ComsyHS-Prod-VM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.create-ComsyHS-Prod-VM01]
}


#################### Enable Backu ComsyHS Prod VM ############################

resource "azurerm_backup_protected_vm" "ComsyHS-Prd-VM-Backup" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.create-ComsyHS-Prod-VM01]
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
