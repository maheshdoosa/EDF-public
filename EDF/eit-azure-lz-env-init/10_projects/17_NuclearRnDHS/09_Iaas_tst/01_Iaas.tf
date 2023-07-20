######################## Upload Djoin file for VM extensions #########################
resource "azurerm_storage_blob" "uploadDomainJoinScript" {
  name                   = "ubuntu_domainjoin_updated.sh"
  storage_account_name   = var.scripthstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/ubuntu_domainjoin_updated.sh"
}

###############################  gukststhshdw01  ##############################################################

################ Resource Group - NuclearRnD HS - web #############
module "create-Target-Rg-For-NuclearRnDHS-dev-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.NuclearRnDHSdevvmRgName
  resourceLocation  = var.NuclearRnDHSResourceLocation
  additionalTags    = module.NuclearRnDHSvmwebTags.tagsResult
}

################ VM01 NIC - NuclearRnD HS #############
module "createNicForNuclearRnDHSdevvm01" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.NuclearRnDHSdevvm01nicname #should be static
  location                          = var.NuclearRnDHSResourceLocation
  resourceGroupName                 = var.NuclearRnDHSdevvmRgName
  subnetId                          = data.azurerm_subnet.NuclearRnDHSdevSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM01nicIpConfigName #should be static
  ipAddress                         = local.NuclearRnDHSdevvm01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-NuclearRnDHS-dev-VM]
}

############### VM01 - NuclearRnD HS #############
module "createNuclearRnDHSdevvm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.NuclearRnDHSdevvm01Name #this should be static
  computerName              = var.NuclearRnDHSdevvm01Name #should be static across environments
  location                  = var.NuclearRnDHSResourceLocation
  vmResourceGroup           = var.NuclearRnDHSdevvmRgName
  nicIds                    = [module.createNicForNuclearRnDHSdevvm01.nicId]
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
  MSMonitoringAgent         = false
  MSNetworkWatcher          = true
  EncryptDisk               = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsNucleardevvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createNicForNuclearRnDHSdevvm01]
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
  depends_on = [module.createNicForNuclearRnDHSdevvm01]
}


module "attachdisks_NuclearpecVm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.Nuclearpecvm01_data_disk.id
  vm_id          = data.azurerm_virtual_machine.Nuclearpec_vm01.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createNuclearRnDHSdevvm01, module.createdisksForNuclearvm01]
}

# ############## Module to join domain for NuclearRnDHS dev VM01 ##########################
module "DomainjoinNuclearRnDHSdevvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createNuclearRnDHSdevvm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createNuclearRnDHSdevvm01, module.attachdisks_NuclearpecVm01]
}

###############################  gukststhshda01  ###############################################################

################ Resource Group - NuclearRnD HS - APP #############
module "create-Target-Rg-For-NuclearRnDHS-dev-VM-app" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.NuclearRnDHSdevvmappRgName
  resourceLocation  = var.NuclearRnDHSResourceLocation
  additionalTags    = module.NuclearRnDHSvmappTags.tagsResult
}

################ VM02 NIC - NuclearRnD HS #############
module "createNicForNuclearRnDHSdevvm02" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.NuclearRnDHSdevvm02nicname #should be static
  location                          = var.NuclearRnDHSResourceLocation
  resourceGroupName                 = var.NuclearRnDHSdevvmappRgName
  subnetId                          = data.azurerm_subnet.NuclearRnDHSdevSubnetapp.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM02nicIpConfigName #should be static
  ipAddress                         = local.NuclearRnDHSdevvm02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-NuclearRnDHS-dev-VM-app]
}

############### VM02 - NuclearRnD HS #############
module "createNuclearRnDHSdevvm02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.NuclearRnDHSdevvm02Name #this should be static
  computerName              = var.NuclearRnDHSdevvm02Name #should be static across environments
  location                  = var.NuclearRnDHSResourceLocation
  vmResourceGroup           = var.NuclearRnDHSdevvmappRgName
  nicIds                    = [module.createNicForNuclearRnDHSdevvm02.nicId]
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
  MSMonitoringAgent         = false
  MSNetworkWatcher          = true
  EncryptDisk               = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsNucleardevvm02
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
  depends_on = [module.createNicForNuclearRnDHSdevvm02]
}

module "attachdisks_NuclearpecVm02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.Nuclearpecvm02_data_disk.id
  vm_id          = data.azurerm_virtual_machine.Nuclearpec_vm02.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createNuclearRnDHSdevvm02, module.createdisksForNuclearvm02]
}

############### Module to join domain for NuclearRnDHS dev VM02 ##########################

module "DomainjoinNuclearRnDHSdevvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createNuclearRnDHSdevvm02.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings02
  depends_on         = [module.createNuclearRnDHSdevvm02, module.attachdisks_NuclearpecVm02]
}

######################### Backup Recovery Service Vault Nuclear Ss dev ############################
resource "azurerm_backup_protected_vm" "NuclearRnDHSdevvm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createNuclearRnDHSdevvm01, module.createNuclearRnDHSdevvm02, module.attachdisks_NuclearpecVm01, module.attachdisks_NuclearpecVm02]
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
