# Control-M HS key vault
controlMHsKvName = "avmeitprdhsmngdsub01kv"

scriptsstorageAccountName = "eitprdmngdauxscript"
saContainerName           = "scripts"

ControlMHsprdvmRgName      = "eit-uks-prd-hs-ctrlm-rg-01"
ControlMHsResourceLocation = "uksouth"

ControlMHsprdvm01nicname          = "eitukhsprdcagt1-nic-01"
VM01nicIpConfigName               = "eitukhsprdcagt1-nic-01-Ip-Config"
ControlMHsprdvm02nicname          = "eitukhsprdcagt2-nic-01"
VM02nicIpConfigName               = "eitukhsprdcagt2-nic-01-Ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

ControlMHsprdvm01Name    = "eitukhsprdcagt1"
ControlMHsprdvm02Name    = "eitukhsprdcagt2"
ControlMHsvm01osDiskName = "eitukhsprdcagt1-osdisk"
ControlMHsvm02osDiskName = "eitukhsprdcagt2-osdisk"

ControlMHsprdSubnetName       = "eit-uks-prd-hs-ctrlm-snet-01"
ControlMHsprdVnetName         = "eit-uks-prd-hs-mngd-vnet-01"
ControlMHsprdNetworkingRgName = "eit-uks-prd-hs-mngd-vnet-rg-01"

identity_type = "SystemAssigned"

bootDiagLogStorageAccountName   = "eituksprdmngdvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-prd-hs-vmlogs-rg-01"
storageAccountName              = "eitprdmngdauxscript"
DomainJoinFilePath              = "https://eitprdmngdauxscript.blob.core.windows.net/scripts/updated_domainjoin_rhel.sh"

ouPath        = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"
adAdminGroup  = "%Domain^Admins@edf-hs.com" #The security group to be added
adAdminGroup2 = "%devops_temp_admins@edf-hs.com"
#adAdminGroup variable should not contain any spaces and starts with %
hostname  = "eitukhsprdcagt1.edf-hs.com"
hostname2 = "eitukhsprdcagt2.edf-hs.com"

######## Golden image #########
ImageRGname      = "eit-uks-alz-hs-imagebuild-rg"
Imagegalleryname = "eituksalzhsimagebuild01"
Imagename        = "RedHat"
ImageVersion     = "Latest"

## RSV and Backup #############

rsv_resourceGroupName    = "eit-uks-prd-hs-vmbackup-rg"
recovery_vault_name      = "eit-uks-prd-hs-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "eit-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-uks-prd-hs-vmbackup-rg"
    vm_id                 = "source_vm01_id"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "eit-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "eit-uks-prd-hs-vmbackup-rg"
    vm_id                 = "source_vm02_id"
    policy_id             = "backup_policy_id_02"
  }
}

######## Disk Encryption #####
EncryptionOperation    = "EnableEncryption"
VolumeType             = "All"
KeyEncryptionAlgorithm = "RSA-OAEP"
ctrlmHsAdeKvName       = "eit-uks-prd-hs-ade-kv-01"
ctrlmHsAdeKvRgName     = "eit-uks-prd-hs-ade-kv-01"

######### Data Disks #######
# pecvm01zone           = ["1"]
create_option              = "Empty"
pecvm_storage_account_type = "Standard_LRS"
caching                    = "None"
disk_lun_01                = "1"
ctrlmpecvm01_data_disk     = "eitukhsprdcagt1-datadisk1"
ctrlmpecvm02_data_disk     = "eitukhsprdcagt2-datadisk1"
pecvmdisks = {
  "disk01" = {
    pecvm01diskname = "eitukhsprdcagt1-datadisk1"
    pecvmrgName     = "eit-uks-prd-hs-ctrlm-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["1"]
  },
  "disk02" = {
    pecvm01diskname = "eitukhsprdcagt2-datadisk1"
    pecvmrgName     = "eit-uks-prd-hs-ctrlm-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["2"]
  }
}
diagsettingnic = [
  {
    nicname = "eitukhsprdcagt1-nic-01",
    rg      = "eit-uks-prd-hs-ctrlm-rg-01"
  },
  {
    nicname = "eitukhsprdcagt2-nic-01",
    rg      = "eit-uks-prd-hs-ctrlm-rg-01"
  }
]

############ Testing ###############

ControlMHsprdTestvmnicname = "eitukhssanctest-nic-01"
TestvmnicIpConfigName      = "eitukhssanctest-nic-01-Ip-Config"
ControlMHsprdTestVMName    = "eitukhssanctest"
ControlMHsTestVMosDiskName = "eitukhssanctest-osdisk"
hostname3                  = "eitukhssanctest.edf-hs.com"
