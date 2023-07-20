################ Resource Group - Emerson Projects  #############
module "createTargetRgForLzmanagedSsEmerson" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagedSsEmersonRgName
  resourceLocation  = var.lzHubManagedResourceLocation

  additionalTags = module.emersonrgTags.tagsResult
}

################ NIC - managedSs Emerson #############
module "createNicForEmersonams01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = var.eamnicName #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagedSsEmerson.rgName

  subnetId = data.azurerm_subnet.emersonSubnet.id

  nicIpConfigName = var.nicIpConfigName #should be static
  ipName          = var.nicipName       #should be static
  ipAddress       = local.emersonams01PrivateIpAddress
}

##########################Aset for emerson VM######################################

module "createAsetAms" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet"

  aSetname          = var.avSetname #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = module.createTargetRgForLzmanagedSsEmerson.rgName
  faultDomainCount  = 2 #static

  additionalTags = module.emersonrgTags.tagsResult
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
}

resource "azurerm_storage_blob" "uploadLAPS" {
  name                   = "LAPS.x64.msi"
  storage_account_name   = var.storageAccountName
  storage_container_name = var.saContainerName
  type                   = "Block"
  source                 = "${path.module}/scripts/LAPS.x64.msi"
}

############### VM - managedSs EMERSON #############
module "createEmersonams01Vm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = var.eamvmName #this should be static
  computerName = var.eamvmName #should be static across environments

  location        = var.lzHubManagedResourceLocation
  vmResourceGroup = module.createTargetRgForLzmanagedSsEmerson.rgName

  nicIds = [module.createNicForEmersonams01Vm.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D4_V4" #should be static across environments

  osDiskName                = var.vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.vmstorageDiskName #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createAsetAms.aSetId

  additionalTags           = module.emersonams01Tags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsams01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
}
######################## Domain Join- EMERSON VMs#######################
module "domainJoinEmersonams01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createEmersonams01Vm.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

  depends_on = [module.createEmersonams01Vm]
}

################   EPONA Resources    ############################################

################ NIC - managedSs EPONA #############
module "createNicForEponaVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest"

  nicName           = var.EponaVM01nicName #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = var.lzmanagedSsEponaRgName

  subnetId = data.azurerm_subnet.EponaSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.EponaVM01nicIpConfigName #should be static
  ipAddress                         = local.EponaVM01PrivateIpAddress

}

##########################AVset for Epona VM  ######################################

module "createEponaAVset" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet"

  aSetname          = var.EponaavSetname #should be static
  location          = var.lzHubManagedResourceLocation
  resourceGroupName = var.lzmanagedSsEponaRgName
  faultDomainCount  = 2 #static

  additionalTags = module.EponaRgTags.tagsResult
}


############### VM - managedSs EPONA #############
module "createEponaVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = var.EponaVM01Name #this should be static
  computerName = var.EponaVM01Name #should be static across environments

  location        = var.lzHubManagedResourceLocation
  vmResourceGroup = var.lzmanagedSsEponaRgName

  nicIds = [module.createNicForEponaVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_D2_V3" #should be static across environments

  osDiskName                = var.EponaVMosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.EponaVMstorageDiskName #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createEponaAVset.aSetId

  additionalTags           = module.EponaVMTags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsEponaVM01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  depends_on = [module.createEponaAVset, module.createNicForEponaVM01]
}
######################## Domain Join- EMERSON VMs#######################
module "domainJoinEponaVM01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createEponaVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.adAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.adAdminPassword.value

  depends_on = [module.createEponaVM01]
}


################   Cominod Resources    ############################################

################ NIC for managedSs Cominod VM #############
module "createNicForCominodVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic-latest"

  nicName           = var.CominodVM01nicName #should be static
  location          = var.CominodResourceLocation
  resourceGroupName = var.CominodvmRgName

  subnetId = data.azurerm_subnet.CominodSubnet.id

  enable_nic_ip_forwarding          = var.enable_nic_ip_forwarding
  enable_nic_accelerated_networking = var.enable_nic_accelerated_networking
  nicIpConfigName                   = var.CominodVM01nicIpConfigName #should be static
  ipAddress                         = local.CominodVM01PrivateIpAddress

}

##########################AVset for Cominod VM  ######################################

module "createCominodAVset" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet"

  aSetname          = var.CominodavSetname #should be static
  location          = var.CominodResourceLocation
  resourceGroupName = var.CominodvmRgName
  faultDomainCount  = 2 #static

  additionalTags = module.CominodAVsetTags.tagsResult
}


############### VM - managedSs Cominod #############
module "createCominodVM01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm"

  vmName       = var.CominodVM01Name #this should be static
  computerName = var.CominodVM01Name #should be static across environments

  location        = var.CominodResourceLocation
  vmResourceGroup = var.CominodvmRgName

  nicIds = [module.createNicForCominodVM01.nicId]

  osImagePublisher = "MicrosoftWindowsServer" #should be static across environments
  osImageOffer     = "WindowsServer"          #should be static across environments
  osImageSku       = "2019-Datacenter"        #should be static across environments
  osImageVersion   = "latest"

  vmSize = "Standard_F4s_V2" #should be static across environments

  osDiskName                = var.CominodVMosDiskName #should be static across environments
  storageOsDiskCreateOption = "FromImage"
  storageOsDiskCaching      = "ReadWrite"

  storageDiskName         = var.CominodVMstorageDiskName #should be static across environments
  storageDiskType         = "Standard_LRS"
  storageDiskCreateOption = "Empty"
  storageDiskSizeGb       = "256"
  storageDataDiskCaching  = "None"

  userAdminName     = data.azurerm_key_vault_secret.adminUser.value
  userAdminPassword = data.azurerm_key_vault_secret.adminPassword.value

  availabilitySetId = module.createCominodAVset.aSetId

  additionalTags           = module.CominodVMTags.tagsResult
  IaaSAntiMalware          = var.IaaSAntiMalware
  MSDependencyAgent        = true
  MSMonitoringAgent        = true
  MSNetworkWatcher         = true
  LAsettings               = local.LAsettings
  LAprotected_settings     = local.LAprotected_settings
  PrepVMprotected_settings = local.PrepVMprotected_settings
  PrepVMsettings           = local.PrepVMsettings
  InstallIaaSAntiMalwareDC = false
  EncryptDisk              = true
  EncryptVMsettings        = local.EncryptVMsettingsCominodVM01

  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint

  depends_on = [module.createCominodAVset, module.createNicForCominodVM01]
}
######################## Domain Join- Cominod VMs#######################
module "domainJoinCominodVM01" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-domain-join"

  vmId               = module.createCominodVM01.vmId
  domainName         = data.azurerm_key_vault_secret.adDomainName.value
  ouPath             = var.ouPath
  userDomainJoin     = data.azurerm_key_vault_secret.newadAdminUser.value
  passwordDomainJoin = data.azurerm_key_vault_secret.newadAdminPassword.value

  depends_on = [module.createCominodVM01]
}

########## VM Backup #########

resource "azurerm_backup_protected_vm" "EPONA-VM-Backup" {
  for_each            = var.vm_name
  recovery_vault_name = each.value.recovery_vault_name
  resource_group_name = each.value.rsv_resourceGroupName
  source_vm_id        = local.vm_source_id[each.value.vm_id]
  backup_policy_id    = local.vm_source_id[each.value.policy_id]
  depends_on          = [module.createEponaVM01, module.createCominodVM01, ]
}
