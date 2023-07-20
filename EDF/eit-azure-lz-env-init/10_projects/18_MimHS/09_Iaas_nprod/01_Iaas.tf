
################ Resource Group for MIM DB VM's #############
module "create-Rg-For-MIM-DB-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.mimdbvmRgName
  resourceLocation  = var.eitmngdhsResourceLocation
  additionalTags    = module.MIMHsvmrgTags.tagsResult
}

################ Resource Group for MIM APP VM's #############
module "create-Rg-For-MIM-APP-VM" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.mimappvmRgName
  resourceLocation  = var.eitmngdhsResourceLocation
  additionalTags    = module.MIMHsvmrgTags.tagsResult
}


######################## Upload PrepVM PS1 file for VM extensions#############

resource "azurerm_storage_blob" "uploadPrepAdScript" {
  name                   = "PrepareVM.ps1"
  storage_account_name   = var.scriptsstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/PrepareVM.ps1"
}

resource "azurerm_storage_blob" "uploaddotnet" {
  name                   = "dotnet"
  storage_account_name   = var.scriptsstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/NET.zip"
}

resource "azurerm_storage_blob" "uploadGBRegion" {
  name                   = "GBRegion.xml"
  storage_account_name   = var.scriptsstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/GBRegion.xml"
  depends_on             = [azurerm_storage_blob.uploadPrepAdScript]
}

resource "azurerm_storage_blob" "uploadLAPS" {
  name                   = "LAPS.x64.msi"
  storage_account_name   = var.scriptsstorageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/LAPS.x64.msi"
  depends_on             = [azurerm_storage_blob.uploadGBRegion]
}


################ NIC for MIM- DBVM01 #############
module "createnicformimdbvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName                           = var.mimdbvm01nicName #should be static
  location                          = var.eitmngdhsResourceLocation
  resourceGroupName                 = var.mimdbvmRgName
  subnetId                          = data.azurerm_subnet.MIMHsdbSubnet.id
  nicIpConfigName                   = var.mimdbvm01nicIpConfigName #should be static
  ipAddress                         = local.mimhsnpdbvm01PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  depends_on                        = [module.create-Rg-For-MIM-DB-VM]
}

################ NIC for MIM- APPVM01 #############
module "createnicformimappvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName                           = var.mimappvm01nicName #should be static
  location                          = var.eitmngdhsResourceLocation
  resourceGroupName                 = var.mimappvmRgName
  subnetId                          = data.azurerm_subnet.MIMHsappSubnet.id
  nicIpConfigName                   = var.mimappvm01nicIpConfigName #should be static
  ipAddress                         = local.mimhsnpappvm01PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  depends_on                        = [module.create-Rg-For-MIM-APP-VM]
}

################ NIC for MIM- APPVM02 #############
module "createnicformimappvm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName                           = var.mimappvm02nicName #should be static
  location                          = var.eitmngdhsResourceLocation
  resourceGroupName                 = var.mimappvmRgName
  subnetId                          = data.azurerm_subnet.MIMHsappSubnet.id
  nicIpConfigName                   = var.mimappvm02nicIpConfigName #should be static
  ipAddress                         = local.mimhsnpappvm02PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  depends_on                        = [module.create-Rg-For-MIM-APP-VM]
}

################# MIM- DBVM01 #############
module "createmimdbVm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-goldenimage?ref=v1.0.4"
  vmName                    = var.mimdbvm01name #this should be static
  computerName              = var.mimdbvm01name #should be static across environments
  location                  = var.eitmngdhsResourceLocation
  vmResourceGroup           = var.mimdbvmRgName
  nicIds                    = [module.createnicformimdbvm01.nicId]
  ImageSubId                = local.ImageSubIds
  ImageRGname               = var.eitmngdhs_ImageRGname
  Imagegalleryname          = var.eitmngdhs_Imagegalleryname
  Imagename                 = var.eitmngdhs_Imagename
  ImageVersion              = var.eitmngdhs_ImageVersion
  vmSize                    = var.mimdbvm01size
  osDiskName                = var.mimdbvm01osdiskname
  storageOsDiskCreateOption = var.storageOsDiskCreateOption
  storageOsDiskCaching      = var.storageOsDiskCaching

  storageDataDiskCaching  = var.storagedataDiskCaching
  storageDiskCreateOption = var.storagedataDiskCreateOption
  storageDiskType         = var.storagedataDiskType

  extra_disks = [
    {
      size = var.mimdbvm01_storagedataDisk1size
      name = var.mimdbvm01_storagedataDisk1Name
      lun  = var.mimdbvm01_storagedataDisk1lun
    },
    {
      size = var.mimdbvm01_storagedataDisk2size
      name = var.mimdbvm01_storagedataDisk2Name
      lun  = var.mimdbvm01_storagedataDisk2lun
    },
    {
      size = var.mimdbvm01_storagedataDisk3size
      name = var.mimdbvm01_storagedataDisk3Name
      lun  = var.mimdbvm01_storagedataDisk3lun
    }
  ]
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.MIMHsDBvm01Tags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsMIMdbvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  depends_on                = [azurerm_storage_blob.uploadGBRegion, azurerm_storage_blob.uploadPrepAdScript, azurerm_storage_blob.uploadLAPS]
}

########### Domain Join- MIM DBVM01 #######################
module "domainJoinmimdbVm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createmimdbVm01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath_windows
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.createmimdbVm01]
}

################# MIM- APPVM01 #############
module "createmimappVm01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-goldenimage?ref=v1.0.4"
  vmName                    = var.mimappvm01name #this should be static
  computerName              = var.mimappvm01name #should be static across environments
  location                  = var.eitmngdhsResourceLocation
  vmResourceGroup           = var.mimappvmRgName
  nicIds                    = [module.createnicformimappvm01.nicId]
  ImageSubId                = local.ImageSubIds
  ImageRGname               = var.eitmngdhs_ImageRGname
  Imagegalleryname          = var.eitmngdhs_Imagegalleryname
  Imagename                 = var.eitmngdhs_Imagename
  ImageVersion              = var.eitmngdhs_ImageVersion
  vmSize                    = var.mimappvm01size
  osDiskName                = var.mimappvm01osdiskname
  storageOsDiskCreateOption = var.storageOsDiskCreateOption
  storageOsDiskCaching      = var.storageOsDiskCaching

  storageDataDiskCaching  = var.storagedataDiskCaching
  storageDiskCreateOption = var.storagedataDiskCreateOption
  storageDiskType         = var.storagedataDiskType

  extra_disks = [
    {
      size = var.mimappvm01_storagedataDisksize
      name = var.mimappvm01_storagedataDiskName
      lun  = var.mimappvm01_storagedataDisklun
    }
  ]
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.MIMHsAppvm01Tags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsMIMappvm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  depends_on                = [module.createmimdbVm01, module.domainJoinmimdbVm01]
}

########### Domain Join- MIM APPVM01 #######################
module "domainJoinmimappVm01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createmimappVm01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath_windows
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.createmimappVm01]
}

################# MIM- APPVM02 #############
module "createmimappVm02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-goldenimage?ref=v1.0.4"
  vmName                    = var.mimappvm02name #this should be static
  computerName              = var.mimappvm02name #should be static across environments
  location                  = var.eitmngdhsResourceLocation
  vmResourceGroup           = var.mimappvmRgName
  nicIds                    = [module.createnicformimappvm02.nicId]
  ImageSubId                = local.ImageSubIds
  ImageRGname               = var.eitmngdhs_ImageRGname
  Imagegalleryname          = var.eitmngdhs_Imagegalleryname
  Imagename                 = var.eitmngdhs_Imagename
  ImageVersion              = var.eitmngdhs_ImageVersion
  vmSize                    = var.mimappvm02size
  osDiskName                = var.mimappvm02osdiskname
  storageOsDiskCreateOption = var.storageOsDiskCreateOption
  storageOsDiskCaching      = var.storageOsDiskCaching

  storageDataDiskCaching  = var.storagedataDiskCaching
  storageDiskCreateOption = var.storagedataDiskCreateOption
  storageDiskType         = var.storagedataDiskType

  extra_disks = [
    {
      size = var.mimappvm02_storagedataDisksize
      name = var.mimappvm02_storagedataDiskName
      lun  = var.mimappvm02_storagedataDisklun
    }
  ]
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.MIMHsAppvm02Tags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = null
  IaaSAntiMalware           = local.IaaSAntiMalware
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsMIMappvm02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorageAccountName.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
  depends_on                = [module.createmimappVm01, module.domainJoinmimappVm01]
}

########### Domain Join- MIM APPVM02 #######################
module "domainJoinmimappVm02" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join?ref=v1.1.19"

  vmId               = module.createmimappVm02.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath_windows
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value
  depends_on         = [module.createmimappVm02]
}

##################### Backup ##############################################

module "enable-vm-backup-MIM-VM" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-backup-protection?ref=v1.1.19"

  for_each                       = var.vm_name
  recovery_services_vault_name   = each.value.recovery_services_vault_name
  recovery_services_vault_rgname = each.value.recovery_services_vault_rgname
  source_vm_id                   = local.vm_source_id[each.value.vm_id]
  backup_policy_id               = local.vm_source_id[each.value.policy_id]
}
