######################## Upload Djoin file for VM extensions #########################
resource "azurerm_storage_blob" "uploadDomainJoinScript" {
  name                   = "updated_domainjoin_rhel.sh"
  storage_account_name   = var.scriptsstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/updated_domainjoin_rhel.sh"
}

################ Resource Group - Control M Prd #############
module "create-Target-Rg-For-ControlMHs-prd-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.ControlMHsprdvmRgName
  resourceLocation  = var.ControlMHsResourceLocation
  additionalTags    = module.ControlMHsvmrgTags.tagsResult
}

################ VM01 NIC - Control M Prd #############
module "createNicForControlMHsprdvm01" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.ControlMHsprdvm01nicname #should be static
  location                          = var.ControlMHsResourceLocation
  resourceGroupName                 = var.ControlMHsprdvmRgName
  subnetId                          = data.azurerm_subnet.ControlMHsprdSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM01nicIpConfigName #should be static
  ipAddress                         = local.ControlMHsprdvm01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-ControlMHs-prd-VM]
}

################ VM02 NIC - Control M Prd #############
module "createNicForControlMHsprdvm02" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.ControlMHsprdvm02nicname #should be static
  location                          = var.ControlMHsResourceLocation
  resourceGroupName                 = var.ControlMHsprdvmRgName
  subnetId                          = data.azurerm_subnet.ControlMHsprdSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM02nicIpConfigName #should be static
  ipAddress                         = local.ControlMHsprdvm02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-ControlMHs-prd-VM]
}

############### VM01 - Control M Prd #############
module "createControlMHsprdvm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.25"
  vmName                    = var.ControlMHsprdvm01Name #this should be static
  computerName              = var.ControlMHsprdvm01Name #should be static across environments
  location                  = var.ControlMHsResourceLocation
  vmResourceGroup           = var.ControlMHsprdvmRgName
  nicIds                    = [module.createNicForControlMHsprdvm01.nicId]
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
  EncryptVMsettings         = local.EncryptVMsettingsctrlmprdvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createNicForControlMHsprdvm01]
}

############### VM02 - Control M Prd #############
module "createControlMHsprdvm02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.25"
  vmName                    = var.ControlMHsprdvm02Name #this should be static
  computerName              = var.ControlMHsprdvm02Name #should be static across environments
  location                  = var.ControlMHsResourceLocation
  vmResourceGroup           = var.ControlMHsprdvmRgName
  nicIds                    = [module.createNicForControlMHsprdvm02.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGname
  Imagegalleryname          = var.Imagegalleryname
  Imagename                 = var.Imagename
  ImageVersion              = var.ImageVersion
  vmSize                    = "Standard_D2_V3"             #should be static across environments
  osDiskName                = var.ControlMHsvm02osDiskName #should be static across environments
  identity_type             = var.identity_type
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "128"
  osDisktype                = "Standard_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["2"]
  additionalTags            = module.ControlMHsvm02Tags.tagsResult
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  EncryptDisk               = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsctrlmprdvm02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

############### Module to join domain for ControlMHs Prd VM01 ##########################
module "DomainjoinControlMHsprdvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createControlMHsprdvm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createControlMHsprdvm01]
}

############### Module to join domain for ControlMHs Prd VM02 ##########################

module "DomainjoinControlMHsprdvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createControlMHsprdvm02.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings02
  depends_on         = [module.createControlMHsprdvm02]
}

######################### Backup Recovery Service Vault CtrlM HS Prd ############################
resource "azurerm_backup_protected_vm" "ControlMHsprdvm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createControlMHsprdvm01, module.createControlMHsprdvm02]
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
  # zone                             = var.pecvm01zone
  depends_on = [module.createNicForControlMHsprdvm01]
}

module "attachdisks_CtrlmpecVm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.ctrlmpecvm01_data_disk.id
  vm_id          = data.azurerm_virtual_machine.ctrlmpec_vm01.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createControlMHsprdvm01, module.createdisksForctrlmvm01]
}
module "attachdisks_CtrlmpecVm02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.ctrlmpecvm02_data_disk.id
  vm_id          = data.azurerm_virtual_machine.ctrlmpec_vm02.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createControlMHsprdvm02, module.createdisksForctrlmvm01]
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

####################### Below is Testing VM Only and will be deleted post testing ################

################ Test VM NIC - Control M Prd #############
module "createNicForControlMHsprdTestVM" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.ControlMHsprdTestvmnicname #should be static
  location                          = var.ControlMHsResourceLocation
  resourceGroupName                 = var.ControlMHsprdvmRgName
  subnetId                          = data.azurerm_subnet.ControlMHsprdSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.TestvmnicIpConfigName #should be static
  ipAddress                         = local.ControlMHsprdTestvmPrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-ControlMHs-prd-VM]
}

############### TestVM - Control M Prd #############
module "createControlMHsprdTestVM" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.ControlMHsprdTestVMName #this should be static
  computerName              = var.ControlMHsprdTestVMName #should be static across environments
  location                  = var.ControlMHsResourceLocation
  vmResourceGroup           = var.ControlMHsprdvmRgName
  nicIds                    = [module.createNicForControlMHsprdTestVM.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGname
  Imagegalleryname          = var.Imagegalleryname
  Imagename                 = var.Imagename
  ImageVersion              = var.ImageVersion
  vmSize                    = "Standard_D2_V3"               #should be static across environments
  osDiskName                = var.ControlMHsTestVMosDiskName #should be static across environments
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
  EncryptDisk               = false
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsctrlmprdvm03
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createNicForControlMHsprdTestVM]
}

############### Module to join domain for ControlMHs Prd TestVM ##########################
module "DomainjoinControlMHsprdTestVM" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createControlMHsprdTestVM.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings03
  depends_on         = [module.createControlMHsprdTestVM]
}
