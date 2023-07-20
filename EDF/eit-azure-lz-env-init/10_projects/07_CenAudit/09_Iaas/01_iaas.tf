# ################ Resource Group - VM's  #############
# module "createTargetRgForLzcenadtvm" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

#   resourceGroupName = var.lzcenadtRgName
#   resourceLocation  = var.lzcenadtResourceLocation

#   additionalTags = module.CenadtvmTags.tagsResult
# }

################ NIC - VM01 #############
module "createNicForcenadtvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.cenadtvm01nicName #should be static
  location          = var.lzcenadtResourceLocation
  resourceGroupName = var.lzcenadtRgName

  subnetId = data.azurerm_subnet.cenadtSubnetName.id

  nicIpConfigName                   = var.cenadtvm01nicIpConfigName #should be static
  ipAddress                         = local.cenadtvm01PrivateIpAddress
  enable_nic_ip_forwarding          = "false"
  enable_nic_accelerated_networking = "true"
  #depends_on                        = [module.createTargetRgForLzcenadtvm]
  #  additionalTags = module.CenadtvmTags.tagsResult
}

# ################ VM01 #############
module "createCenadtVm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"

  vmName       = var.cenadtvm01name #this should be static
  computerName = var.cenadtvm01name #should be static across environments

  location        = var.lzcenadtResourceLocation
  vmResourceGroup = var.lzcenadtRgName

  nicIds = [module.createNicForcenadtvm01.nicId]

  ImageSubId       = local.ImageSubIds
  ImageRGname      = "eit-uks-alz-hs-imagebuild-rg"
  Imagegalleryname = "eituksalzhsimagebuild01"
  Imagename        = "ubuntu20_04"
  ImageVersion     = "latest"

  # osImagePublisher = "procomputers" #should be static across environments
  # osImageOffer     = "centos-8-3"   #should be static across environments
  # osImageSku       = "centos-8-3"   #should be static across environments
  # osImageVersion   = "latest"

  vmSize = "Standard_D2_V4" #should be static across environments

  osDiskName                = "eitukshscef001-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Standard_LRS"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.CenadtvmTags01.tagsResult

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  EncryptDisk               = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  MSDependencyAgent         = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsvm01
  depends_on                = [module.createNicForcenadtvm01]
}


################ Linux VM (eituksssvscan01) - managementSs WARP #############
# module "createCenadtVm001" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-tenable"

#   vmName       = var.cenadtvm01name #this should be static
#   computerName = var.cenadtvm01name #should be static across environments

#   location        = var.lzcenadtResourceLocation
#   vmResourceGroup = var.lzcenadtRgName

#   nicIds = [module.createNicForcenadtvm01.nicId]

#   osImagePublisher = "center-for-internet-security-inc" #should be static across environments
#   osImageOffer     = "cis-ubuntu-linux-2004-l1"         #should be static across environments
#   osImageSku       = "cis-ubuntu2004-l1"                #should be static across environments
#   osImageVersion   = "latest"

#   vmSize = "Standard_D2_V4" #should be static across environments

#   osDiskName                = "eitukshscef01-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"
#   osdisksize                = "64"
#   osDisktype                = "Standard_LRS"
#   userAdminName             = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value

#   zones = ["1"]

#   additionalTags = module.CenadtvmTags.tagsResult

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
#   MSMonitoringAgent         = false
#   MSNetworkWatcher          = false
#   MSDependencyAgent         = false
#   LAsettings                = local.LAsettings
#   LAprotected_settings      = local.LAprotected_settings
#   EncryptVMsettings         = local.EncryptVMsettingsvm01
#   depends_on                = [module.createNicForcenadtvm01]
# }
# module "createdisksForcenadtvm01" {
#   source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create"
#   for_each             = var.disks
#   vm_disk_name         = each.value.vm01diskname
#   vm_location          = var.lzcenadtResourceLocation
#   vm_rgname            = each.value.vmrgName
#   storage_account_type = var.storage_account_type
#   create_option        = var.create_option
#   disk_size_in_gb      = each.value.diskSize
#   zone                 = var.lzvm01zone
#   depends_on           = [module.createCenadtVm01]
# }

# module "attachdisks" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach"
#   ##    for_each                = local.diskattach01
#   manged_disk_id = data.azurerm_managed_disk.cenadvm01_data_disk.id
#   vm_id          = data.azurerm_virtual_machine.cenadt_vm01.id
#   lun_number     = var.disk_lun_01
#   caching        = var.caching
#   depends_on     = [module.createdisksForcenadtvm01]
# }

##############################################################################################

################ NIC - VM02 #############
module "createNicForcenadtvm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.cenadtvm02nicName #should be static
  location          = var.lzcenadtResourceLocation
  resourceGroupName = var.lzcenadtRgName

  subnetId = data.azurerm_subnet.cenadtSubnetName.id

  nicIpConfigName                   = var.cenadtvm02nicIpConfigName #should be static
  ipAddress                         = local.cenadtvm02PrivateIpAddress
  enable_nic_ip_forwarding          = "false"
  enable_nic_accelerated_networking = "true"
  #depends_on                        = [module.createTargetRgForLzcenadtvm]
  #  additionalTags = module.CenadtvmTags.tagsResult
}

# ################ VM02 #############
# module "createCenadtVm02" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder"

#   vmName       = var.cenadtvm02name #this should be static
#   computerName = var.cenadtvm02name #should be static across environments

#   location        = var.lzcenadtResourceLocation
#   vmResourceGroup = var.lzcenadtRgName

#   nicIds = [module.createNicForcenadtvm02.nicId]

#   ImageSubId       = local.ImageSubIds
#   ImageRGname      = "eit-uks-alz-hs-imagebuild-rg"
#   Imagegalleryname = "eituksalzhsimagebuild01"
#   Imagename        = "RedHat"
#   ImageVersion     = "0.0.2"


#   # osImagePublisher = "procomputers" #should be static across environments
#   # osImageOffer     = "centos-8-3"   #should be static across environments
#   # osImageSku       = "centos-8-3"   #should be static across environments
#   # osImageVersion   = "latest"

#   vmSize = "Standard_D2_V4" #should be static across environments

#   osDiskName                = "eitukshscef02-osdisk" #should be static across environments
#   storageOsDiskCreateOption = "FromImage"
#   storageOsDiskCaching      = "ReadWrite"
#   osdisksize                = "64"
#   osDisktype                = "Standard_LRS"

#   userAdminName     = data.azurerm_key_vault_secret.adminUser.value
#   userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

#   zones = ["2"]

#   additionalTags = module.CenadtvmTags.tagsResult

#   enableBootDiagnostics     = "true" #should be static across environments
#   bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
#   EncryptDisk               = true
#   MSMonitoringAgent         = true
#   MSNetworkWatcher          = true
#   MSDependencyAgent         = true
#   LAsettings                = local.LAsettings
#   LAprotected_settings      = local.LAprotected_settings
#   EncryptVMsettings         = local.EncryptVMsettingsvm02
#   depends_on                = [module.createNicForcenadtvm02]
# }

module "createCenadtVm002" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-tenable?ref=v1.1.19"

  vmName       = var.cenadtvm02name #this should be static
  computerName = var.cenadtvm02name #should be static across environments

  location        = var.lzcenadtResourceLocation
  vmResourceGroup = var.lzcenadtRgName

  nicIds = [module.createNicForcenadtvm02.nicId]

  osImagePublisher = "center-for-internet-security-inc" #should be static across environments
  osImageOffer     = "cis-ubuntu-linux-2004-l1"         #should be static across environments
  osImageSku       = "cis-ubuntu2004-l1"                #should be static across environments
  osImageVersion   = "latest"


  #   # osImagePublisher = "procomputers" #should be static across environments
  #   # osImageOffer     = "centos-8-3"   #should be static across environments
  #   # osImageSku       = "centos-8-3"   #should be static across environments
  #   # osImageVersion   = "latest"

  vmSize = "Standard_D2_V4" #should be static across environments

  osDiskName                = "eitukshscef02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  osdisksize                = "64"
  osDisktype                = "Standard_LRS"
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags = module.CenadtvmTags.tagsResult

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  EncryptDisk               = false
  MSMonitoringAgent         = false
  MSNetworkWatcher          = false
  MSDependencyAgent         = false
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingsvm02
  depends_on                = [module.createNicForcenadtvm02]
}

module "createdisksForcenadtvm02" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create?ref=v1.1.19"
  for_each             = var.disks
  vm_disk_name         = each.value.vm02diskname
  vm_location          = var.lzcenadtResourceLocation
  vm_rgname            = each.value.vmrgName
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_in_gb      = each.value.diskSize
  zone                 = var.lzvm02zone
  depends_on           = [module.createCenadtVm002]
}

module "attachvm02disks" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  ##    for_each                = local.diskattach01
  manged_disk_id = data.azurerm_managed_disk.cenadvm02_data_disk.id
  vm_id          = data.azurerm_virtual_machine.cenadt_vm02.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createdisksForcenadtvm02]
}



######################## Upload Djoin file for VM extensions for Dev #########################
resource "azurerm_storage_blob" "uploadDomainJoinScript" {
  name                   = "ubuntu_domainjoin_updated.sh"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/ubuntu_domainjoin_updated.sh"
}

# # # ############### Module to join domain for Cent Audit Linux VMs ##########################

# manually installed domainjoin on the VM001, hence disabling the code

module "domainjoinhscenadtvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createCenadtVm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings
  depends_on         = [azurerm_storage_blob.uploadDomainJoinScript]
}

#  module "domainjoinhscenadtvm02" {
#    source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension"
#    name               = "Domainjoin"
#    publisher          = "Microsoft.Azure.Extensions"
#    type               = "CustomScript"
#    handler_version    = "2.1"
#    vmId               = module.createCenadtVm02.vmId
#    settings           = local.PrepLinuxVMsettings
#    protected_settings = local.PrepLinuxVMprotected_settings
#  }

################# Event Collector ##############

#### RG for centadt event collector- VM's  #############
module "createTargetRgForeventcollectorvm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzcenadtpecRgName
  resourceLocation  = var.lzcenadtResourceLocation
  additionalTags    = module.CenadtpecvmrgTags.tagsResult
}


################ NIC for centadt event collector  - VM01 #############
module "createNicForcenadpectvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName                           = var.cenadtpecvm01nicName #should be static
  location                          = var.lzcenadtResourceLocation
  resourceGroupName                 = var.lzcenadtpecRgName
  subnetId                          = data.azurerm_subnet.cenadtpecSubnetName.id
  nicIpConfigName                   = var.cenadtpecvm01nicIpConfigName #should be static
  ipAddress                         = local.cenadtecvm01PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  depends_on                        = [module.createTargetRgForeventcollectorvm]
}

# ################ centadt event collector VM01 #############
module "createCenadtpecVm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-rhel-imagebuilder?ref=v1.1.19"

  vmName                    = var.cenadtpecvm01name #this should be static
  computerName              = var.cenadtpecvm01name #should be static across environments
  location                  = var.lzcenadtResourceLocation
  vmResourceGroup           = var.lzcenadtpecRgName
  nicIds                    = [module.createNicForcenadpectvm01.nicId]
  ImageSubId                = local.ImageSubIds
  ImageRGname               = var.pecvm01_ImageRGname
  Imagegalleryname          = var.pecvm01_Imagegalleryname
  Imagename                 = var.pecvm01_Imagename
  ImageVersion              = var.pecvm01_ImageVersion
  vmSize                    = var.cenadtpecvm01size
  osDiskName                = var.cenadtpecvm01osdiskname
  storageOsDiskCreateOption = var.storageOsDiskCreateOption
  storageOsDiskCaching      = var.storageOsDiskCaching
  osdisksize                = var.osdisksize
  osDisktype                = var.osDisktype
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.Cenadtpecvm01Tags.tagsResult
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  EncryptDisk               = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  MSDependencyAgent         = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  EncryptVMsettings         = local.EncryptVMsettingspecvm01
  depends_on                = [module.createNicForcenadpectvm01]
}

module "createdisksForcenadpectvm01" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-create?ref=v1.1.19"
  for_each             = var.pecvmdisks
  vm_disk_name         = each.value.pecvm01diskname
  vm_location          = var.lzcenadtResourceLocation
  vm_rgname            = each.value.pecvmrgName
  storage_account_type = var.pecvm_storage_account_type
  create_option        = var.create_option
  disk_size_in_gb      = each.value.pecdiskSize
  zone                 = var.pecvm01zone
  depends_on           = [module.createNicForcenadpectvm01]
}

module "attachdisks_CenadtpecVm01" {
  source         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach?ref=v1.1.19"
  manged_disk_id = data.azurerm_managed_disk.cenadpecvm01_data_disk.id
  vm_id          = data.azurerm_virtual_machine.cenadtpec_vm01.id
  lun_number     = var.disk_lun_01
  caching        = var.caching
  depends_on     = [module.createCenadtpecVm01]
}


module "domainjoinhscenadtpecvm01" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-extension?ref=v1.1.19"
  name               = "Domainjoin"
  publisher          = "Microsoft.Azure.Extensions"
  type               = "CustomScript"
  handler_version    = "2.1"
  vmId               = module.createCenadtpecVm01.vmId
  settings           = local.PrepLinuxVMsettings
  protected_settings = local.PrepLinuxVMprotected_settings_epcvm01
}

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
  depends_on             = [azurerm_storage_blob.uploadDomainJoinScript]
}

resource "azurerm_storage_blob" "uploadLAPS" {
  name                   = "LAPS.x64.msi"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/LAPS.x64.msi"
  depends_on             = [azurerm_storage_blob.uploadGBRegion]
}


################ NIC for centadt event collector  - VM02 #############
module "createNicForcenadpectvm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName                           = var.cenadtpecvm02nicName #should be static
  location                          = var.lzcenadtResourceLocation
  resourceGroupName                 = var.lzcenadtpecRgName
  subnetId                          = data.azurerm_subnet.cenadtpecSubnetName.id
  nicIpConfigName                   = var.cenadtpecvm02nicIpConfigName #should be static
  ipAddress                         = local.cenadtecvm02PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
}

# ################ centadt event collector VM02 #############
module "createCenadtpecVm02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-goldenimage?ref=v1.0.4"
  vmName                    = var.cenadtpecvm02name #this should be static
  computerName              = var.cenadtpecvm02name #should be static across environments
  location                  = var.lzcenadtResourceLocation
  vmResourceGroup           = var.lzcenadtpecRgName
  nicIds                    = [module.createNicForcenadpectvm02.nicId]
  ImageSubId                = local.ImageSubIds
  ImageRGname               = var.pecvm02_ImageRGname
  Imagegalleryname          = var.pecvm02_Imagegalleryname
  Imagename                 = var.pecvm02_Imagename
  ImageVersion              = var.pecvm02_ImageVersion
  vmSize                    = var.cenadtpecvm02size
  osDiskName                = var.cenadtpecvm02osdiskname
  storageOsDiskCreateOption = var.storageOsDiskCreateOption
  storageOsDiskCaching      = var.storageOsDiskCaching

  storageDataDiskCaching  = var.storagedataDiskCaching
  storageDiskCreateOption = var.storagedataDiskCreateOption
  storageDiskType         = var.storagedataDiskType

  extra_disks = [
    {
      size = var.storagedataDisksize
      name = var.storagedataDiskName
      lun  = var.storagedataDisklun
    }
  ]
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.Cenadtpecvm02Tags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingspecvm02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  depends_on                = [azurerm_storage_blob.uploadGBRegion, azurerm_storage_blob.uploadPrepAdScript, azurerm_storage_blob.uploadLAPS]
}

########### Domain Join- centadt event collector VM02 #######################
module "domainJoinCenadtpecVm02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createCenadtpecVm02.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath_windows
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.createCenadtpecVm02]
}

##################### Backup ##############################################

resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createCenadtpecVm02]
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
