# Control-M HS key vault
controlMHsKvName = "avmeitnphsmngdsub01kv"

scriptsstorageAccountName = "eitnpmngdauxscript"
saContainerName           = "scripts"

ControlMHsnpvmRgName              = "eit-uks-np-hs-ctrlm-rg-01"
ControlMHsResourceLocation        = "uksouth"
ControlMHsnpvm01nicname           = "eitukhsnpcagt1-nic-01"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
VM01nicIpConfigName               = "eitukhsnpcagt1-nic-01-Ip-Config"
ControlMHsnpvm01Name              = "eitukhsnpcagt1"
ControlMHsvm01osDiskName          = "eitukhsnpcagt1-osdisk"
identity_type                     = "SystemAssigned"
######## Golden image #########
ImageRGname      = "eit-uks-alz-hs-imagebuild-rg"
Imagegalleryname = "eituksalzhsimagebuild01"
Imagename        = "RedHat"
ImageVersion     = "Latest"
#####
ControlMHsnpSubnetName       = "eit-uks-np-hs-ctrlm-snet-01"
ControlMHsnpVnetName         = "eit-uks-np-hs-mngd-vnet-01"
ControlMHsnpNetworkingRgName = "eit-uks-np-hs-mngd-vnet-rg-01"

bootDiagLogStorageAccountName   = "eituksnpmngdvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-np-hs-vmlogs-rg-01"
storageAccountName              = "eitnpmngdauxscript"
DomainJoinFilePath              = "https://eitnpmngdauxscript.blob.core.windows.net/scripts/updated_domainjoin_rhel.sh"

ouPath        = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"
adAdminGroup  = "%Domain^Admins@edf-hs.com" #The security group to be added
adAdminGroup2 = "%devops_temp_admins@edf-hs.com"
#adAdminGroup variable should not contain any spaces and starts with %
hostname = "eitukhsnpcagt1.edf-hs.com"
## RSV and Backup #############
rsv_resourceGroupName    = "eit-uks-np-hs-vmbackup-rg"
recovery_vault_name      = "eit-uks-np-hs-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "eit-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-uks-np-hs-vmbackup-rg"
    vm_id                 = "source_vm01_id"
    policy_id             = "backup_policy_id_01"
  }
}

######## Disk Encryption #####
EncryptionOperation    = "EnableEncryption"
VolumeType             = "All"
KeyEncryptionAlgorithm = "RSA-OAEP"
ctrlmHsAdeKvName       = "eit-uks-np-hs-ade-kv-01"
ctrlmHsAdeKvRgName     = "eit-uks-np-hs-ade-rg-01"

######### Data Disks #######
create_option              = "Empty"
pecvm_storage_account_type = "Standard_LRS"
caching                    = "None"
disk_lun_01                = "1"
ctrlmpecvm01_data_disk     = "eitukhsnpcagt1-datadisk1"
pecvmdisks = {
  "disk01" = {
    pecvm01diskname = "eitukhsnpcagt1-datadisk1"
    pecvmrgName     = "eit-uks-np-hs-ctrlm-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["1"]
  }
}
diagsettingnic = [
  {
    nicname = "eitukhsnpcagt1-nic-01",
    rg      = "eit-uks-np-hs-ctrlm-rg-01"
  }
]
