
######################## Upload Djoin file for VM extensions for Prd #########################
resource "azurerm_storage_blob" "uploadDomainJoinScript" {
  name                   = "domainjoin.sh"
  storage_account_name   = var.scriptsstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/domainjoin.sh"
}

################ Resource Group - Apex HS Prd #############
module "create-Target-Rg-For-ApexHs-prd-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.ApexHsprdvmRgName
  resourceLocation  = var.ApexHsResourceLocation
  additionalTags    = module.ApexHsvmrgTags.tagsResult
}

################ VM01 NIC - ApexHS Prd #############
module "createNicForApexHsprdvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.ApexHsprdvm01nicname #should be static
  location          = var.ApexHsResourceLocation
  resourceGroupName = var.ApexHsprdvmRgName

  subnetId = data.azurerm_subnet.ApexHsprdSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM01nicIpConfigName #should be static
  ipAddress                         = local.ApexHsprdvm01PrivateIpAddress
  #additionalTags            = module.ApexHsvmrgTags.tagsResult
  depends_on = [module.create-Target-Rg-For-ApexHs-prd-VM]
}

################ VM02 NIC - ApexHS Prd #############
module "createNicForApexHsprdvm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.ApexHsprdvm02nicname #should be static
  location          = var.ApexHsResourceLocation
  resourceGroupName = var.ApexHsprdvmRgName

  subnetId = data.azurerm_subnet.ApexHsprdSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM02nicIpConfigName #should be static
  ipAddress                         = local.ApexHsprdvm02PrivateIpAddress
  #additionalTags            = module.ApexHsvmrgTags.tagsResult
  depends_on = [module.create-Target-Rg-For-ApexHs-prd-VM]
}


############### VM01 - ApexHS Prd #############
module "createApexHsprdvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel?ref=v1.1.19"

  vmName       = var.ApexHsprdvm01Name #this should be static
  computerName = var.ApexHsprdvm01Name #should be static across environments

  location        = var.ApexHsResourceLocation
  vmResourceGroup = var.ApexHsprdvmRgName

  nicIds = [module.createNicForApexHsprdvm01.nicId]

  osImagePublisher = "Oracle"       #should be static across environments
  osImageOffer     = "Oracle-Linux" #should be static across environments
  osImageSku       = "ol83-lvm"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F16s" #should be static across environments

  osDiskName                = var.ApexHsvm01osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Premium_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.ApexHsvm01Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

############### VM02 - ApexHS Prd #############
module "createApexHsprdvm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel?ref=v1.1.19"

  vmName       = var.ApexHsprdvm02Name #this should be static
  computerName = var.ApexHsprdvm02Name #should be static across environments

  location        = var.ApexHsResourceLocation
  vmResourceGroup = var.ApexHsprdvmRgName

  nicIds = [module.createNicForApexHsprdvm02.nicId]

  osImagePublisher = "Oracle"       #should be static across environments
  osImageOffer     = "Oracle-Linux" #should be static across environments
  osImageSku       = "ol83-lvm"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F16s" #should be static across environments

  osDiskName                = var.ApexHsvm02osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Premium_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["2"]
  additionalTags            = module.ApexHsvm02Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}


############## Creating Manged Disk And Attaching to VM #######################
resource "azurerm_managed_disk" "ApexHsmanaged" {
  for_each             = var.managed_disk
  name                 = each.value.vmstorageDiskName
  location             = var.ApexHsResourceLocation
  resource_group_name  = var.ApexHsprdvmRgName #module.createTargetRgForApexhs.rgName
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
  zones                = [each.value.zone] #["1"]
  depends_on           = [module.createApexHsprdvm01]
}

module "vmdiskattachApexprdvm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.ApexHsprdmanageddiskvm01.id
  vm_id          = module.createApexHsprdvm01.vmId
  lun_number     = "1"
  caching        = "ReadWrite"
  depends_on     = [module.createApexHsprdvm01, azurerm_managed_disk.ApexHsmanaged]
}

module "vmdiskattachApexprdvm02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.ApexHsprdmanageddiskvm02.id
  vm_id          = module.createApexHsprdvm02.vmId
  lun_number     = "1"
  caching        = "ReadWrite"
  depends_on     = [module.createApexHsprdvm02, azurerm_managed_disk.ApexHsmanaged]
}



############### Module to join domain for ApexHs Prd VM01 ##########################

module "DomainjoinApexHsprdvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createApexHsprdvm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createApexHsprdvm01]
}

############### Module to join domain for ApexHs Prd VM02 ##########################

module "DomainjoinApexHsprdvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createApexHsprdvm02.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createApexHsprdvm02]
}

######################### Backup Recovery Service Vault Apex HS Prd ############################

resource "azurerm_backup_protected_vm" "ApexHsprdvm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createApexHsprdvm01, module.createApexHsprdvm02]
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
