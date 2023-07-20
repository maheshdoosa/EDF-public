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
}

######### AVD01 AV Virtual Mechine ###################

module "createTargetRgForLzAVDavVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzAVDavVmRgName
  resourceLocation  = var.lzAVDavVmResourceLocation

  additionalTags = module.resourceGroupavTags.tagsResult
}

module "createNicForAVDav01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "cuksprdavmgmt01-nic-01" #should be static
  location          = var.lzAVDavVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDavVm.rgName

  subnetId = data.azurerm_subnet.AVDavSubnetName.id

  nicIpConfigName = "cuksprdavmgmt01-nic-01-Ip-Config" #should be static
  ipName          = "cuksprdavmgmt01-nic-01-Ip"        #should be static
  ipAddress       = local.AVDav01PrivateIpAddress

}

module "createAVDav01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest"

  vmName       = "cuksprdavmgmt01" #this should be static
  computerName = "cuksprdavmgmt01" #should be static across environments

  location        = var.lzAVDavVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDavVm.rgName

  nicIds = [module.createNicForAVDav01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = "cuksprdavmgmt01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"


  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"


  extra_disks = [
    {
      size = var.lzAVDav01Vmdatadisk01size
      name = var.lzAVDav01Vmdatadisk01
      lun  = var.lzAVDav01Vmdatadisk01LunNumber
    },
    {
      size = var.lzAVDav01Vmdatadisk02size
      name = var.lzAVDav01Vmdatadisk02
      lun  = var.lzAVDav01Vmdatadisk02LunNumber
    },
    {
      size = var.lzAVDav01Vmdatadisk03size
      name = var.lzAVDav01Vmdatadisk03
      lun  = var.lzAVDav01Vmdatadisk03LunNumber
    }
  ]


  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags            = module.AVDav01Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDav01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}
################ AVD02 Virtual Mechine #####################

module "createNicForAVDav02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "cuksprdavmgmt02-nic-01" #should be static
  location          = var.lzAVDavVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDavVm.rgName

  subnetId = data.azurerm_subnet.AVDavSubnetName.id

  nicIpConfigName = "cuksprdavmgmt02-nic-01-Ip-Config" #should be static
  ipName          = "cuksprdavmgmt02-nic-01-Ip"        #should be static
  ipAddress       = local.AVD02PrivateIpAddress

}


module "createAVDav02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest"

  vmName       = "cuksprdavmgmt02" #this should be static
  computerName = "cuksprdavmgmt02" #should be static across environments

  location        = var.lzAVDavVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDavVm.rgName

  nicIds = [module.createNicForAVDav02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = "cuksprdavmgmt02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"


  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"


  extra_disks = [
    {
      size = var.lzAVDav02Vmdatadisk01size
      name = var.lzAVDav02Vmdatadisk01
      lun  = var.lzAVDav02Vmdatadisk01LunNumber
    },
    {
      size = var.lzAVDav02Vmdatadisk02size
      name = var.lzAVDav02Vmdatadisk02
      lun  = var.lzAVDav02Vmdatadisk02LunNumber
    },
    {
      size = var.lzAVDav02Vmdatadisk03size
      name = var.lzAVDav02Vmdatadisk03
      lun  = var.lzAVDav02Vmdatadisk03LunNumber
    }
  ]

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags            = module.AVDav02Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDav02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}


######### AVD SCCM01 Virtual Mechine ###################

module "createTargetRgForLzAVDSccmVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzAVDSccmVmRgName
  resourceLocation  = var.lzAVDSccmVmResourceLocation

  additionalTags = module.resourceGroupsccmTags.tagsResult
}

module "createNicForAVDSccm01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "cuksprdsccm01-nic-01" #should be static
  location          = var.lzAVDSccmVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDSccmVm.rgName

  subnetId = data.azurerm_subnet.AVDSccmSubnetName.id

  nicIpConfigName = "cuksprdsccm01-nic-01-Ip-Config" #should be static
  ipName          = "cuksprdsccm01-nic-01-Ip"        #should be static
  ipAddress       = local.AVDSccm01PrivateIpAddress

}

module "createAVDSccm01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest"

  vmName       = "cuksprdsccm01" #this should be static
  computerName = "cuksprdsccm01" #should be static across environments

  location        = var.lzAVDSccmVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDSccmVm.rgName

  nicIds = [module.createNicForAVDSccm01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = "cuksprdsccm01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"


  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"


  extra_disks = [
    {
      size = var.lzAVDSccm01Vmdatadisk01size
      name = var.lzAVDSccm01Vmdatadisk01
      lun  = var.lzAVDSccm01Vmdatadisk01LunNumber
    },
    {
      size = var.lzAVDSccm01Vmdatadisk02size
      name = var.lzAVDSccm01Vmdatadisk02
      lun  = var.lzAVDSccm01Vmdatadisk02LunNumber
    },
    {
      size = var.lzAVDSccm01Vmdatadisk03size
      name = var.lzAVDSccm01Vmdatadisk03
      lun  = var.lzAVDSccm01Vmdatadisk03LunNumber
    }
  ]

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags            = module.AVDSccm01Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDSccm01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

################ AVD SCCM02 Virtual Mechine #####################

module "createNicForAVDSccm02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "cuksprdsccm02-nic-01" #should be static
  location          = var.lzAVDSccmVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDSccmVm.rgName

  subnetId = data.azurerm_subnet.AVDSccmSubnetName.id

  nicIpConfigName = "cuksprdsccm02-nic-01-Ip-Config" #should be static
  ipName          = "cuksprdsccm02-nic-01-Ip"        #should be static
  ipAddress       = local.AVDSccm02PrivateIpAddress

}


module "createAVDSccm02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest"

  vmName       = "cuksprdsccm02" #this should be static
  computerName = "cuksprdsccm02" #should be static across environments

  location        = var.lzAVDSccmVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDSccmVm.rgName

  nicIds = [module.createNicForAVDSccm02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = "cuksprdsccm02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"


  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"

  extra_disks = [
    {
      size = var.lzAVDSccm02Vmdatadisk01size
      name = var.lzAVDSccm02Vmdatadisk01
      lun  = var.lzAVDSccm02Vmdatadisk01LunNumber
    },
    {
      size = var.lzAVDSccm02Vmdatadisk02size
      name = var.lzAVDSccm02Vmdatadisk02
      lun  = var.lzAVDSccm02Vmdatadisk02LunNumber
    },
    {
      size = var.lzAVDSccm02Vmdatadisk03size
      name = var.lzAVDSccm02Vmdatadisk03
      lun  = var.lzAVDSccm02Vmdatadisk03LunNumber
    }
  ]


  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags            = module.AVDSccm02Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDSccm02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

######### AVD adds01 Virtual Machine ###################

module "createTargetRgForLzAVDaddsVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzAVDaddsVmRgName
  resourceLocation  = var.lzAVDaddsVmResourceLocation

  additionalTags = module.resourceGroupaddsTags.tagsResult
}

module "createNicForAVDadds01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "cuksprdadds01-nic-01" #should be static
  location          = var.lzAVDaddsVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDaddsVm.rgName

  subnetId = data.azurerm_subnet.AVDaddsSubnetName.id

  nicIpConfigName = "cuksprdadds01-nic-01-Ip-Config" #should be static
  ipName          = "cuksprdadds01-nic-01-Ip"        #should be static
  ipAddress       = local.AVDadds01PrivateIpAddress

}

module "createAVDadds01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest"

  vmName       = "cuksprdadds01" #this should be static
  computerName = "cuksprdadds01" #should be static across environments

  location        = var.lzAVDaddsVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDaddsVm.rgName

  nicIds = [module.createNicForAVDadds01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = "cuksprdadds01-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"

  extra_disks = [
    {
      size = var.lzAVDadds01Vmdatadisk01size
      name = var.lzAVDadds01Vmdatadisk01
      lun  = var.lzAVDadds01Vmdatadisk01LunNumber
    },
    {
      size = var.lzAVDadds01Vmdatadisk02size
      name = var.lzAVDadds01Vmdatadisk02
      lun  = var.lzAVDadds01Vmdatadisk02LunNumber
    },
    {
      size = var.lzAVDadds01Vmdatadisk03size
      name = var.lzAVDadds01Vmdatadisk03
      lun  = var.lzAVDadds01Vmdatadisk03LunNumber
    }
  ]


  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags            = module.AVDadds01Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDadds01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

################ AVD adds02 Virtual Mechine #####################

module "createNicForAVDadds02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = "cuksprdadds02-nic-01" #should be static
  location          = var.lzAVDaddsVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDaddsVm.rgName

  subnetId = data.azurerm_subnet.AVDaddsSubnetName.id

  nicIpConfigName = "cuksprdadds02-nic-01-Ip-Config" #should be static
  ipName          = "cuksprdadds02-nic-01-Ip"        #should be static
  ipAddress       = local.AVDadds02PrivateIpAddress

}


module "createAVDadds02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest"

  vmName       = "cuksprdadds02" #this should be static
  computerName = "cuksprdadds02" #should be static across environments

  location        = var.lzAVDaddsVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDaddsVm.rgName

  nicIds = [module.createNicForAVDadds02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = "cuksprdadds02-osdisk" #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDataDiskCaching  = "ReadWrite"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "StandardSSD_LRS"

  extra_disks = [
    {
      size = var.lzAVDadds02Vmdatadisk01size
      name = var.lzAVDadds02Vmdatadisk01
      lun  = var.lzAVDadds02Vmdatadisk01LunNumber
    },
    {
      size = var.lzAVDadds02Vmdatadisk02size
      name = var.lzAVDadds02Vmdatadisk02
      lun  = var.lzAVDadds02Vmdatadisk02LunNumber
    },
    {
      size = var.lzAVDadds02Vmdatadisk03size
      name = var.lzAVDadds02Vmdatadisk03
      lun  = var.lzAVDadds02Vmdatadisk03LunNumber
    }
  ]

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["2"]

  additionalTags            = module.AVDadds02Tags.tagsResult
  IaaSAntiMalware           = var.IaaSAntiMalware
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDadds02
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}

###################### Backup ##############################################


resource "azurerm_backup_protected_vm" "vm" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createAVDav02Vm, module.createAVDav01Vm, module.createAVDSccm01Vm, module.createAVDSccm02Vm, module.createAVDadds01Vm, module.createAVDadds02Vm]
}
