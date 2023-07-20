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
module "create-Target-Rg-For-NuclearRnDHS-npd-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.NuclearRnDHSnpdvmRgName
  resourceLocation  = var.NuclearRnDHSResourceLocation
  additionalTags    = module.NuclearRnDHSvmwebTags.tagsResult
}

################ VM01 NIC - NuclearRnD HS #############
module "createNicForNuclearRnDHSnpdvm01" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.NuclearRnDHSnpdvm01nicname #should be static
  location                          = var.NuclearRnDHSResourceLocation
  resourceGroupName                 = var.NuclearRnDHSnpdvmRgName
  subnetId                          = data.azurerm_subnet.NuclearRnDHSnpdSubnet.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM01nicIpConfigName #should be static
  ipAddress                         = local.NuclearRnDHSnpdvm01PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-NuclearRnDHS-npd-VM]
}

############### VM01 - NuclearRnD HS #############
module "createNuclearRnDHSnpdvm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.NuclearRnDHSnpdvm01Name #this should be static
  computerName              = var.NuclearRnDHSnpdvm01Name #should be static across environments
  location                  = var.NuclearRnDHSResourceLocation
  vmResourceGroup           = var.NuclearRnDHSnpdvmRgName
  nicIds                    = [module.createNicForNuclearRnDHSnpdvm01.nicId]
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
  EncryptVMsettings         = local.EncryptVMsettingsNuclearnpdvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createNicForNuclearRnDHSnpdvm01]
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
  depends_on = [module.createNicForNuclearRnDHSnpdvm01]
}


module "attachdisks_NuclearpecVm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.Nuclearpecvm01_data_disk.id
  vm_id          = data.azurerm_virtual_machine.Nuclearpec_vm01.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createNuclearRnDHSnpdvm01, module.createdisksForNuclearvm01]
}

############## Module to join domain for NuclearRnDHS npd VM01 ##########################
module "DomainjoinNuclearRnDHSnpdvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createNuclearRnDHSnpdvm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [module.createNuclearRnDHSnpdvm01, module.attachdisks_NuclearpecVm01]
}

###############################  gukststhshda01  ###############################################################

################ Resource Group - NuclearRnD HS - APP #############
module "create-Target-Rg-For-NuclearRnDHS-npd-VM-app" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.NuclearRnDHSnpdvmappRgName
  resourceLocation  = var.NuclearRnDHSResourceLocation
  additionalTags    = module.NuclearRnDHSvmappTags.tagsResult
}

################ VM02 NIC - NuclearRnD HS #############
module "createNicForNuclearRnDHSnpdvm02" {
  source                            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"
  nicName                           = var.NuclearRnDHSnpdvm02nicname #should be static
  location                          = var.NuclearRnDHSResourceLocation
  resourceGroupName                 = var.NuclearRnDHSnpdvmappRgName
  subnetId                          = data.azurerm_subnet.NuclearRnDHSnpdSubnetapp.id
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.VM02nicIpConfigName #should be static
  ipAddress                         = local.NuclearRnDHSnpdvm02PrivateIpAddress
  depends_on                        = [module.create-Target-Rg-For-NuclearRnDHS-npd-VM-app]
}

############### VM02 - NuclearRnD HS #############
module "createNuclearRnDHSnpdvm02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"
  vmName                    = var.NuclearRnDHSnpdvm02Name #this should be static
  computerName              = var.NuclearRnDHSnpdvm02Name #should be static across environments
  location                  = var.NuclearRnDHSResourceLocation
  vmResourceGroup           = var.NuclearRnDHSnpdvmappRgName
  nicIds                    = [module.createNicForNuclearRnDHSnpdvm02.nicId]
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
  EncryptVMsettings         = local.EncryptVMsettingsNuclearnpdvm02
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
  depends_on = [module.createNicForNuclearRnDHSnpdvm02]
}

module "attachdisks_NuclearpecVm02" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.Nuclearpecvm02_data_disk.id
  vm_id          = data.azurerm_virtual_machine.Nuclearpec_vm02.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createNuclearRnDHSnpdvm02, module.createdisksForNuclearvm02]
}

############### Module to join domain for NuclearRnDHS npd VM02 ##########################

module "DomainjoinNuclearRnDHSnpdvm02" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createNuclearRnDHSnpdvm02.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings02
  depends_on         = [module.createNuclearRnDHSnpdvm02, module.attachdisks_NuclearpecVm02]
}

######################### Backup Recovery Service Vault Nuclear Ss npd ############################
resource "azurerm_backup_protected_vm" "NuclearRnDHSnpdvm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createNuclearRnDHSnpdvm01, module.createNuclearRnDHSnpdvm02, module.attachdisks_NuclearpecVm01, module.attachdisks_NuclearpecVm02]
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
