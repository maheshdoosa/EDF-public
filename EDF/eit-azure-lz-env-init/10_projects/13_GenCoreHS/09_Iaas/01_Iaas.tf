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

######### AVD01 AV Virtual Machine ###################

module "createTargetRgForLzAVDavVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzAVDavVmRgName
  resourceLocation  = var.lzAVDavVmResourceLocation

  additionalTags = module.resourceGroupavTags.tagsResult
}

module "createNicForAVDav01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.av01NicName # "cuksprdavmgmt01-nic-01" #should be static
  location          = var.lzAVDavVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDavVm.rgName

  subnetId = data.azurerm_subnet.AVDavSubnetName.id

  nicIpConfigName = var.nicIpConfigav01 #"cuksprdavmgmt01-nic-01-Ip-Config" #should be static
  ipName          = var.nicipNameav01   #"cuksprdavmgmt01-nic-01-Ip"        #should be static
  ipAddress       = local.AVDav01PrivateIpAddress

}

################## NIC association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "dav01vm" {
  network_interface_id          = module.createNicForAVDav01Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgav.id
}

module "createAVDav01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.lzAVDav01Vm #this should be static
  computerName = var.lzAVDav01Vm #should be static across environments

  location        = var.lzAVDavVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDavVm.rgName

  nicIds = [module.createNicForAVDav01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = var.vmav01osDiskName #should be static across environments
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

  additionalTags = module.AVDav01Tags.tagsResult

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
################ AVD02 Virtual Machine #####################

module "createNicForAVDav02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.av02NicName #should be static
  location          = var.lzAVDavVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDavVm.rgName

  subnetId = data.azurerm_subnet.AVDavSubnetName.id

  nicIpConfigName = var.nicIpConfigav02 #should be static
  ipName          = var.nicipNameav02   #should be static
  ipAddress       = local.AVDav02PrivateIpAddress

}

################## NIC association with ASG ###########

resource "azurerm_network_interface_application_security_group_association" "dav02vm" {
  network_interface_id          = module.createNicForAVDav02Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgav.id
}




module "createAVDav02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.lzAVDav02Vm #this should be static
  computerName = var.lzAVDav02Vm #should be static across environments

  location        = var.lzAVDavVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDavVm.rgName

  nicIds = [module.createNicForAVDav02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = var.vmav02osDiskName #should be static across environments
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

  additionalTags = module.AVDav02Tags.tagsResult

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


######### AVD SCCM01 Virtual Machine ###################

module "createTargetRgForLzAVDSccmVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzAVDSccmVmRgName
  resourceLocation  = var.lzAVDSccmVmResourceLocation

  additionalTags = module.resourceGroupsccmTags.tagsResult
}

module "createNicForAVDSccm01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.sccm01NicName #should be static
  location          = var.lzAVDSccmVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDSccmVm.rgName

  subnetId = data.azurerm_subnet.AVDSccmSubnetName.id

  nicIpConfigName = var.nicIpConfigsccm01 #should be static
  ipName          = var.nicipNamesccm01   #should be static
  ipAddress       = local.AVDSccm01PrivateIpAddress

}

################## NIC association with ASG ###########

resource "azurerm_network_interface_application_security_group_association" "sccm01vm" {
  network_interface_id          = module.createNicForAVDSccm01Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgsccm.id
}


module "createAVDSccm01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.lzAVDSccm01Vm #this should be static
  computerName = var.lzAVDSccm01Vm #should be static across environments

  location        = var.lzAVDSccmVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDSccmVm.rgName

  nicIds = [module.createNicForAVDSccm01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = var.vmsccm01osDiskName #should be static across environments
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

  additionalTags = module.AVDSccm01Tags.tagsResult

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

################ AVD SCCM02 Virtual Machine #####################

module "createNicForAVDSccm02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.sccm02NicName #should be static
  location          = var.lzAVDSccmVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDSccmVm.rgName

  subnetId = data.azurerm_subnet.AVDSccmSubnetName.id

  nicIpConfigName = var.nicIpConfigsccm02 #should be static
  ipName          = var.nicipNamesccm02   #should be static
  ipAddress       = local.AVDSccm02PrivateIpAddress

}

################## NIC association with ASG ###########

resource "azurerm_network_interface_application_security_group_association" "sccm02vm" {
  network_interface_id          = module.createNicForAVDSccm02Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgsccm.id
}

module "createAVDSccm02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.lzAVDSccm02Vm #this should be static
  computerName = var.lzAVDSccm02Vm #should be static across environments

  location        = var.lzAVDSccmVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDSccmVm.rgName

  nicIds = [module.createNicForAVDSccm02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = var.vmsccm02osDiskName #should be static across environments
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

  additionalTags = module.AVDSccm02Tags.tagsResult

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
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzAVDaddsVmRgName
  resourceLocation  = var.lzAVDaddsVmResourceLocation

  additionalTags = module.resourceGroupaddsTags.tagsResult
}

module "createNicForAVDadds01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.adds01NicName #should be static
  location          = var.lzAVDaddsVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDaddsVm.rgName

  subnetId = data.azurerm_subnet.AVDaddsSubnetName.id

  nicIpConfigName = var.nicIpConfigadds01 #should be static
  ipName          = var.nicipNameadds01   #should be static
  ipAddress       = local.AVDadds01PrivateIpAddress

}
################## NIC association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "adds01vm" {
  network_interface_id          = module.createNicForAVDadds01Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgadds.id
}

module "createAVDadds01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.lzAVDadds01Vm #this should be static
  computerName = var.lzAVDadds01Vm #should be static across environments

  location        = var.lzAVDaddsVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDaddsVm.rgName

  nicIds = [module.createNicForAVDadds01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2012-R2-Datacenter"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2s_v4" #should be static across environments

  osDiskName                = var.vmadds01osDiskName #should be static across environments
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

  additionalTags = module.AVDadds01Tags.tagsResult

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
  isDC                      = true
}

################ AVD adds02 Virtual Mechine #####################

module "createNicForAVDadds02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.adds02NicName #should be static
  location          = var.lzAVDaddsVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDaddsVm.rgName

  subnetId = data.azurerm_subnet.AVDaddsSubnetName.id

  nicIpConfigName = var.nicIpConfigadds02 #should be static
  ipName          = var.nicipNameadds02   #should be static
  ipAddress       = local.AVDadds02PrivateIpAddress

}

################## NIC association with ASG ###########
resource "azurerm_network_interface_application_security_group_association" "adds02vm" {
  network_interface_id          = module.createNicForAVDadds02Vm.nicId
  application_security_group_id = data.azurerm_application_security_group.asgadds.id
}


module "createAVDadds02Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-latest?ref=v1.1.19"

  vmName       = var.lzAVDadds02Vm #this should be static
  computerName = var.lzAVDadds02Vm #should be static across environments

  location        = var.lzAVDaddsVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDaddsVm.rgName

  nicIds = [module.createNicForAVDadds02Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2012-R2-Datacenter"     #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2s_v4" #should be static across environments

  osDiskName                = var.vmadds02osDiskName #should be static across environments
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

  additionalTags = module.AVDadds02Tags.tagsResult

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
  isDC                      = true
}

######### AVD WSUS Virtual Machine ###################

module "createTargetRgForLzAVDwsusVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lzAVDwsusVmRgName
  resourceLocation  = var.lzAVDwsusVmResourceLocation

  additionalTags = module.resourceGroupwsusTags.tagsResult
}

module "createNicForAVDwsus01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic?ref=v1.1.19"

  nicName           = var.wsus01NicName #should be static
  location          = var.lzAVDwsusVmResourceLocation
  resourceGroupName = module.createTargetRgForLzAVDwsusVm.rgName

  subnetId = data.azurerm_subnet.AVDwsusSubnetName.id

  nicIpConfigName = var.nicIpConfigwsus01 #should be static
  ipName          = var.nicipNamewsus01   #should be static
  ipAddress       = local.AVDwsus01PrivateIpAddress

}

module "createAVDwsus01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm?ref=v1.1.19"

  vmName       = var.wsus01vmName #this should be static
  computerName = var.wsus01vmName #should be static across environments

  location        = var.lzAVDwsusVmResourceLocation
  vmResourceGroup = module.createTargetRgForLzAVDwsusVm.rgName

  nicIds = [module.createNicForAVDwsus01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2S_V3" #should be static across environments

  osDiskName                = var.vmwsus01osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.vmstorageDiskName #"eituksssafs01-datadisk" #should be static across environments
  storageDiskType         = "StandardSSD_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "512"
  storageDataDiskCaching  = "None"



  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  zones = ["1"]

  additionalTags = module.AVDwsus01Tags.tagsResult

  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingsAVDwsus01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}


######### AVD tmr 1 Virtual Machine ###################

module "createTargetRgForLztmrVm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lztmrVmRgName
  resourceLocation  = var.lztmrVmResourceLocation

  additionalTags = module.resourceGroupavTags.tagsResult
}

module "createNicForcenadtvm01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.tmr01NicName #should be static
  location          = var.lztmrVmResourceLocation
  resourceGroupName = var.lztmrVmRgName

  subnetId = data.azurerm_subnet.tmrSubnetName.id

  nicIpConfigName                   = var.nicIpConfigtmr01 #should be static
  ipAddress                         = local.tmr01PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  depends_on                        = [module.createTargetRgForLztmrVm]
}

module "createtmr01Vm" {
  source          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-goldenimage?ref=v1.0.4"
  vmName          = var.tmr01vmName #this should be static
  computerName    = var.tmr01vmName #should be static across environments
  location        = var.lztmrVmResourceLocation
  vmResourceGroup = module.createTargetRgForLztmrVm.rgName
  nicIds          = [module.createNicForcenadtvm01.nicId]


  ImageSubId       = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname      = var.ImageRGname
  Imagegalleryname = var.Imagegalleryname
  Imagename        = var.Imagename
  ImageVersion     = var.ImageVersion

  vmSize                    = var.tmr01vmsize
  osDiskName                = var.vmtmr01osDiskName
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDataDiskCaching  = "None"
  storageDiskCreateOption = "Empty"
  storageDiskType         = "Standard_LRS"

  extra_disks = [
    {
      size = "128"
      name = var.tmrstorageDiskName1
      lun  = "1"
    }
  ]
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["1"]
  additionalTags            = module.tmrTags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingstmr01
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  MSDependencyAgent         = true
  MSMonitoringAgent         = true
  MSNetworkWatcher          = true
  LAsettings                = local.LAsettings
  LAprotected_settings      = local.LAprotected_settings
}


######### AVD tmr 2 Virtual Machine ###################

module "createNicForcenadtvm02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest?ref=v1.1.19"

  nicName           = var.tmr02NicName #should be static
  location          = var.lztmrVmResourceLocation
  resourceGroupName = var.lztmrVmRgName

  subnetId = data.azurerm_subnet.tmrSubnetName.id

  nicIpConfigName                   = var.nicIpConfigtmr02 #should be static
  ipAddress                         = local.tmr02PrivateIpAddress
  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  depends_on                        = [module.createTargetRgForLztmrVm]
}


module "createtmr02Vm" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-goldenimage?ref=v1.0.4"
  vmName                    = var.tmr02vmName #this should be static
  computerName              = var.tmr02vmName #should be static across environments
  location                  = var.lztmrVmResourceLocation
  vmResourceGroup           = module.createTargetRgForLztmrVm.rgName
  nicIds                    = [module.createNicForcenadtvm02.nicId]
  ImageSubId                = data.azurerm_key_vault_secret.ImageSubIds.value
  ImageRGname               = var.ImageRGnamevm2
  Imagegalleryname          = var.Imagegallerynamevm2
  Imagename                 = var.Imagenamevm2
  ImageVersion              = var.ImageVersionvm2
  vmSize                    = var.tmr02vmsize       #"Standard_D2_V3" #should be static across environments
  osDiskName                = var.vmtmr02osDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"
  storageDataDiskCaching    = "None"
  storageDiskCreateOption   = "Empty"
  storageDiskType           = "Standard_LRS"
  extra_disks = [
    {
      size = "128"
      name = var.tmrstorageDiskName2
      lun  = "1"
    }
  ]
  userAdminName             = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword         = data.azurerm_key_vault_secret.adminPassword.value
  zones                     = ["2"]
  additionalTags            = module.tmrTags.tagsResult
  PrepVMprotected_settings  = local.PrepVMprotected_settings
  PrepVMsettings            = local.PrepVMsettings
  InstallIaaSAntiMalwareDC  = false
  EncryptDisk               = true
  EncryptVMsettings         = local.EncryptVMsettingstmr02
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
