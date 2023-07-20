################ Resource Group - for restore VM disks from backup  #############
module "createRgForVMrestore" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagedSsEmerson_vmrestoreRgName
  resourceLocation  = var.lzmanagedSsEmerson_resourceLocation

  additionalTags = module.emersonams01Tags.tagsResult
}

################ Resource Group - for restore backup disk to target rg (with name change) #############
module "createTargetRgForVMrestore" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.lzmanagedSsEmerson_vmrestoretargetRgName
  resourceLocation  = var.lzmanagedSsEmerson_resourceLocation

  additionalTags = module.emersonams01Tags.tagsResult
}

############## Restore VM backup from Azure RSV ##########

module "restorevmfrombackup" {

  source                   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-restore"
  RecoveryServiceVaultName = var.lzmanagedSsEmerson_rsvName
  RSVRGname                = var.lzmanagedSsEmerson_rsvrgname
  vmName                   = var.lzmanagedSsEmerson_vmname             //restoring VM name
  resourceGroupName        = var.lzmanagedSsEmerson_vmrestoreRgName    //destination rg of backup restore disk
  storageAccountName       = var.lzmanagedSsEmerson_storageAccountName // to store the json file by azure service
  spApplicationId          = data.azurerm_key_vault_secret.spApplicationId.value
  spSecret                 = data.azurerm_key_vault_secret.spSecret.value
  tenantId                 = data.azurerm_key_vault_secret.tenantId.value
  subscriptionId           = data.azurerm_key_vault_secret.subscriptionId.value
  sourceResourceGroupName  = var.lzmanagedSsEmerson_vmrestoreRgName       //rg of restored vm disk source for copy the disk
  targetResourceGroupName  = var.lzmanagedSsEmerson_vmrestoretargetRgName //target rg of restored disk (copy and rename the disk)
  newDiskname              = var.lzmanagedSsEmerson_newdiskName           // should be the same name of new VM
  depends_on               = [module.createTargetRgForVMrestore]
}

########## Creating VM From Restore Disk #############

################ VM - NIC ###################################
module "createNicForvm" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet/nic"

  nicName           = var.eamnicName #should be static #should be static
  location          = var.lzmanagedSsEmerson_resourceLocation
  resourceGroupName = var.lzmanagedSsEmerson_vmrestoretargetRgName

  subnetId = data.azurerm_subnet.emersonSubnet.id

  nicIpConfigName = var.nicIpConfigName #should be static
  ipName          = var.nicipName       #should be static
  ipAddress       = local.emersonams01PrivateIpAddress
  depends_on      = [module.restorevmfrombackup]
}

##########################Avset for VM ######################################

module "createAVset" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-availabilitySet"

  aSetname          = var.avSetname #should be static
  location          = var.lzmanagedSsEmerson_resourceLocation
  resourceGroupName = var.lzmanagedSsEmerson_vmrestoretargetRgName
  faultDomainCount  = 2 #static
  additionalTags    = module.emersonams01Tags.tagsResult
  depends_on        = [module.createNicForvm]

}

########################## VM creation form existing os disk ######################################

module "create-vm-from-restored-osdisk" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-creation-existingdisk"

  vmName                    = var.eamvmName #this should be static
  location                  = var.lzmanagedSsEmerson_resourceLocation
  vmResourceGroup           = var.lzmanagedSsEmerson_vmrestoretargetRgName
  nicIds                    = [module.createNicForvm.nicId]
  vmSize                    = "Standard_D4_V4" #should be static across environments
  osDiskName                = var.vmosDiskName #should be static across environments
  storageOsDiskCreateOption = "Attach"
  managed_disk_id           = local.os_disk_id
  storageOsDiskCaching      = "ReadWrite"
  os_type                   = "windows"
  additionalTags            = module.emersonams01Tags.tagsResult

  availabilitySetId         = module.createAVset.aSetId
  enableBootDiagnostics     = "true" #should be static across environments
  bootDiagnosticsStorageUri = data.azurerm_storage_account.bootDiagLogStorage.primary_blob_endpoint
  depends_on                = [module.createAVset]
}


############## Attaching restored data disk to newly created VM##############

module "attach-restoed-datadisk" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach"

  manged_disk_id = local.data_disk_id
  vm_id          = local.vm_id
  lun_number     = "1"
  caching        = "ReadWrite"
  depends_on     = [module.create-vm-from-restored-osdisk]

}


######## Restore Disk and Attaching to Existing VM ###############

############## Restore VM backup from Azure RSV ##########

module "restorevm-frombackup-to-attach-disk" {

  source                   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-restore"
  RecoveryServiceVaultName = var.lzmanagedSsEmerson_rsvName
  RSVRGname                = var.lzmanagedSsEmerson_rsvrgname
  vmName                   = var.lzmanagedSsEmerson_vmname             //restoring VM name
  resourceGroupName        = var.lzmanagedSsEmerson_vmrestoreRgName    //destination rg of backup restore disk
  storageAccountName       = var.lzmanagedSsEmerson_storageAccountName // to store the json file by azure service
  spApplicationId          = data.azurerm_key_vault_secret.spApplicationId.value
  spSecret                 = data.azurerm_key_vault_secret.spSecret.value
  tenantId                 = data.azurerm_key_vault_secret.tenantId.value
  subscriptionId           = data.azurerm_key_vault_secret.subscriptionId.value
  sourceResourceGroupName  = var.lzmanagedSsEmerson_vmrestoreRgName       //rg of restored vm disk source for copy the disk
  targetResourceGroupName  = var.lzmanagedSsEmerson_vmrestoretargetRgName //target rg of restored disk (copy and rename the disk)
  newDiskname              = var.lzmanagedSsEmerson_newdiskName_r         // should be the same name of new VM
}


############## Attaching restored data disk to Existing  VM ##############

module "attach-restoed-datadisk-existing-VM" {

  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vm-disk-attach"

  manged_disk_id = local.data_disk_id_r
  vm_id          = local.vm_id
  lun_number     = "2"
  caching        = "ReadWrite"
  depends_on     = [module.restorevm-frombackup-to-attach-disk]

}
