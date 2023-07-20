################ Resource Group - Control M sand #############
module "create-Target-Rg-For-ControlMHs-sand-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.ControlMHssandvmRgName
  resourceLocation  = var.ControlMHsResourceLocation
  additionalTags    = module.ControlMHsvmrgTags.tagsResult
}

################ VM01 NIC - Control M sand #############
module "createNicForControlMHssandvm01" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.ControlMHssandvm01nicname #should be static
  location                          = var.ControlMHsResourceLocation
  resourceGroupName                 = var.ControlMHssandvmRgName
  subnetId                          = data.azurerm_subnet.ControlMHssandSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM01nicIpConfigName #should be static
  ipAddress                         = local.ControlMHssandvm01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-ControlMHs-sand-VM]
}

############### VM01 - Control M sand #############
module "createControlMHssandvm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.25"
  vmName                    = var.ControlMHssandvm01Name #this should be static
  computerName              = var.ControlMHssandvm01Name #should be static across environments
  location                  = var.ControlMHsResourceLocation
  vmResourceGroup           = var.ControlMHssandvmRgName
  nicIds                    = [module.createNicForControlMHssandvm01.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGname
  Imagegalleryname          = var.Imagegalleryname
  Imagename                 = var.Imagename
  ImageVersion              = var.ImageVersion
  vmSize                    = "Standard_D2_V3" #should be static across environments
  identity_type             = var.identity_type
  osDiskName                = var.ControlMHsvm01osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "128"
  osDisktype                = "Standard_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.ControlMHsvm01Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  EncryptDisk               = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsctrlmsandvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createNicForControlMHssandvm01]
}

############### Module to join domain for ControlMHs sand VM01 ##########################
module "DomainjoinControlMHssandvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createControlMHssandvm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createControlMHssandvm01]
}

######################### Backup Recovery Service Vault CtrlM HS sand ############################
resource "azurerm_backup_protected_vm" "ControlMHssandvm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createControlMHssandvm01]
}

############## Creating Data disks ############
module "createdisksForctrlmvm01" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create?ref=v1.1.19"
  for_each             = var.pecvmdisks
  vm_disk_name         = each.value.pecvm01diskname
  vm_location          = var.ControlMHsResourceLocation
  vm_rgname            = each.value.pecvmrgName
  storage_account_type = var.pecvm_storage_account_type
  create_option        = var.create_option
  disk_size_in_gb      = each.value.pecdiskSize
  zone                 = each.value.pecvm01zone
  depends_on           = [module.createNicForControlMHssandvm01]
}

module "attachdisks_CtrlmpecVm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.ctrlmpecvm01_data_disk.id
  vm_id          = data.azurerm_virtual_machine.ctrlmpec_vm01.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createControlMHssandvm01, module.createdisksForctrlmvm01]
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
