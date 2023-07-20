###############################  guksprdhshpw01  ##############################################################

################ Resource Group - NuclearRnD HS - web #############
module "create-Target-Rg-For-NuclearRnDHS-prd-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.NuclearRnDHSprdvmRgName
  resourceLocation  = var.NuclearRnDHSResourceLocation
  additionalTags    = module.NuclearRnDHSvmwebTags.tagsResult
}

################ VM01 NIC - NuclearRnD HS #############
module "createNicForNuclearRnDHSprdvm01" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.NuclearRnDHSprdvm01nicname #should be static
  location                          = var.NuclearRnDHSResourceLocation
  resourceGroupName                 = var.NuclearRnDHSprdvmRgName
  subnetId                          = data.azurerm_subnet.NuclearRnDHSprdSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM01nicIpConfigName #should be static
  ipAddress                         = local.NuclearRnDHSprdvm01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-NuclearRnDHS-prd-VM]
}

############### VM01 - NuclearRnD HS #############
module "createNuclearRnDHSprdvm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.NuclearRnDHSprdvm01Name #this should be static
  computerName              = var.NuclearRnDHSprdvm01Name #should be static across environments
  location                  = var.NuclearRnDHSResourceLocation
  vmResourceGroup           = var.NuclearRnDHSprdvmRgName
  nicIds                    = [module.createNicForNuclearRnDHSprdvm01.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGname
  Imagegalleryname          = var.Imagegalleryname
  Imagename                 = var.Imagename
  ImageVersion              = var.ImageVersion
  vmSize                    = "Standard_D2_V3"               #should be static across environments
  osDiskName                = var.NuclearRnDHSvm01osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "128"
  osDisktype                = "Standard_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.NuclearRnDHSvmwebTags.tagsResult
  MSDependencyAgent         = false
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  EncryptDisk               = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsNuclearprdvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createNicForNuclearRnDHSprdvm01]
}

############## Creating Data disks ############
module "createdisksForNuclearvm01" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create?ref=v1.1.19"
  for_each             = var.pecvmdisks01
  vm_disk_name         = each.value.pecvm01diskname
  vm_location          = var.NuclearRnDHSResourceLocation
  vm_rgname            = each.value.pecvmrgName
  storage_account_type = var.pecvm_storage_account_type
  create_option        = var.create_option
  disk_size_in_gb      = each.value.pecdiskSize
  zone                 = each.value.pecvm01zone
  # zone                             = var.pecvm01zone
  depends_on = [module.createNicForNuclearRnDHSprdvm01]
}


module "attachdisks_NuclearpecVm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.Nuclearpecvm01_data_disk.id
  vm_id          = data.azurerm_virtual_machine.Nuclearpec_vm01.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createNuclearRnDHSprdvm01, module.createdisksForNuclearvm01]
}

############## Module to join domain for NuclearRnDHS prd VM01 ##########################
module "DomainjoinNuclearRnDHSprdvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createNuclearRnDHSprdvm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createNuclearRnDHSprdvm01, module.attachdisks_NuclearpecVm01]
}

###############################  gukststhshda01  ###############################################################

################ Resource Group - NuclearRnD HS - APP #############
module "create-Target-Rg-For-NuclearRnDHS-prd-VM-app" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.NuclearRnDHSprdvmappRgName
  resourceLocation  = var.NuclearRnDHSResourceLocation
  additionalTags    = module.NuclearRnDHSvmappTags.tagsResult
}

################ VM02 NIC - NuclearRnD HS #############
module "createNicForNuclearRnDHSprdvm02" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.NuclearRnDHSprdvm02nicname #should be static
  location                          = var.NuclearRnDHSResourceLocation
  resourceGroupName                 = var.NuclearRnDHSprdvmappRgName
  subnetId                          = data.azurerm_subnet.NuclearRnDHSprdSubnetapp.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM02nicIpConfigName #should be static
  ipAddress                         = local.NuclearRnDHSprdvm02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-NuclearRnDHS-prd-VM-app]
}

############### VM02 - NuclearRnD HS #############
module "createNuclearRnDHSprdvm02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.NuclearRnDHSprdvm02Name #this should be static
  computerName              = var.NuclearRnDHSprdvm02Name #should be static across environments
  location                  = var.NuclearRnDHSResourceLocation
  vmResourceGroup           = var.NuclearRnDHSprdvmappRgName
  nicIds                    = [module.createNicForNuclearRnDHSprdvm02.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGname
  Imagegalleryname          = var.Imagegalleryname
  Imagename                 = var.Imagename
  ImageVersion              = var.ImageVersion
  vmSize                    = "Standard_D2_V3"               #should be static across environments
  osDiskName                = var.NuclearRnDHSvm02osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "128"
  osDisktype                = "Standard_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.NuclearRnDHSvmappTags.tagsResult
  MSDependencyAgent         = false
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  EncryptDisk               = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsNuclearprdvm02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}

############## Creating Data disks ############
module "createdisksForNuclearvm02" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create?ref=v1.1.19"
  for_each             = var.pecvmdisks02
  vm_disk_name         = each.value.pecvm01diskname
  vm_location          = var.NuclearRnDHSResourceLocation
  vm_rgname            = each.value.pecvmrgName
  storage_account_type = var.pecvm_storage_account_type
  create_option        = var.create_option
  disk_size_in_gb      = each.value.pecdiskSize
  zone                 = each.value.pecvm01zone
  # zone                             = var.pecvm01zone
  depends_on = [module.createNicForNuclearRnDHSprdvm02]
}

module "attachdisks_NuclearpecVm02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.Nuclearpecvm02_data_disk.id
  vm_id          = data.azurerm_virtual_machine.Nuclearpec_vm02.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createNuclearRnDHSprdvm02, module.createdisksForNuclearvm02]
}

############### Module to join domain for NuclearRnDHS prd VM02 ##########################

module "DomainjoinNuclearRnDHSprdvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createNuclearRnDHSprdvm02.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings02
  depends_on         = [module.createNuclearRnDHSprdvm02, module.attachdisks_NuclearpecVm02]
}

######################### Backup Recovery Service Vault Nuclear Ss prd ############################
resource "azurerm_backup_protected_vm" "NuclearRnDHSprdvm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createNuclearRnDHSprdvm01, module.createNuclearRnDHSprdvm02, module.attachdisks_NuclearpecVm01, module.attachdisks_NuclearpecVm02]
}

################################### Diagnostic Setting configuration to all the VM's NIC ############################

module "diagsettings-hslaw-nic" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.nic_id
  resource_id                = each.key
  diag_settings_name         = "nic-hs-law"
  log_analytics_workspace_id = local.diag_settings_nic["nic-hs-law"]["law_workspace_id"]
  diagnostic_logs            = local.diag_settings_nic["nic-hs-law"]["diagnostic_log"]
  diagnostic_metrics         = local.diag_settings_nic["nic-hs-law"]["diagnostic_metrics"]
}
