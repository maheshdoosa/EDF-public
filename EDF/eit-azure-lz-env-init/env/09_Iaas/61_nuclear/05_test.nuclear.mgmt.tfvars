# NuclearRnD HS  key vault
NuclearRnDHSKvName = "avmgentsthsmngdsub01kv"

scripthstorageAccountName = "genuksuathsauxscript"
saContainerName           = "scripts"

NuclearRnDHSdevvmRgName      = "gen-uks-dev-hs-managed-hpb-dvweb-rg-01"
NuclearRnDHSResourceLocation = "uksouth"

NuclearRnDHSdevvm01nicname = "gukststhshdw01-nic-01"
VM01nicIpConfigName        = "gukststhshdw01-nic-01-Ip-Config"
NuclearRnDHSdevvm01Name    = "gukststhshdw01"
NuclearRnDHSvm01osDiskName = "gukststhshdw01-osdisk"
hostname                   = "gukststhshdw01.edf-hs.com"

NuclearRnDHSdevvmappRgName = "gen-uks-dev-hs-managed-hpb-dvapp-rg-01"

NuclearRnDHSdevvm02nicname = "gukststhshda01-nic-01"
VM02nicIpConfigName        = "gukststhshda01-nic-01-Ip-Config"
NuclearRnDHSdevvm02Name    = "gukststhshda01"
NuclearRnDHSvm02osDiskName = "gukststhshda01-osdisk"
hostname2                  = "gukststhshda01.edf-hs.com"

NuclearRnDHSdevSubnetName       = "gen-uks-dev-hs-hpb-dvweb-snet-01"
NuclearRnDHSdevSubnetNameapp    = "gen-uks-dev-hs-hpb-dvapp-snet-01"
NuclearRnDHSdevVnetName         = "gen-uks-dev-hs-managed-vnet-01"
NuclearRnDHSdevNetworkingRgName = "gen-uks-dev-hs-managed-vnet-rg-01"

enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

bootDiagLogStorageAccountName   = "genuksuathsvmlogssa04"
bootDiagLogStorageAccountRgName = "gen-uks-uat-hs-vmlogs-rg-01"
storageAccountName              = "genuksuathsauxscript"
DomainJoinFilePath              = "https://genuksuathsauxscript.blob.core.windows.net/scripts/ubuntu_domainjoin_updated.sh"

ouPath = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"

#adAdminGroup variable should not contain any spaces and starts with %
adAdminGroup  = "%Domain^Admins@edf-hs.com" #The security group to be added
adAdminGroup2 = "%devops_temp_admins@edf-hs.com"


######## Golden image #########
ImageRGname      = "eit-uks-alz-hs-imagebuild-rg"
Imagegalleryname = "eituksalzhsimagebuild01"
Imagename        = "ubuntu20_04"
ImageVersion     = "latest"

## RSV and Backup #############

rsv_resourceGroupName    = "gen-uks-tst-ss-vmbackup-rg-01"
recovery_vault_name      = "gen-uks-tst-ss-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

######## Disk Encryption #####
EncryptionOperation    = "EnableEncryption"
VolumeType             = "All"
KeyEncryptionAlgorithm = "RSA-OAEP"
NuclearSsAdeKvName     = "gen-uks-dev-hs-ade-kv-01"
NuclearSsAdeKvRgName   = "gen-uks-dev-hs-ade-rg-01"

######### Data Disks #######
# pecvm01zone           = ["1"]
create_option              = "Empty"
pecvm_storage_account_type = "StandardSSD_LRS"
caching                    = "None"
disk_lun_01                = "1"
Nuclearpecvm01_data_disk   = "gukststhshdw01-datadisk1"
Nuclearpecvm02_data_disk   = "gukststhshda01-datadisk1"
pecvmdisks01 = {
  "disk01" = {
    pecvm01diskname = "gukststhshdw01-datadisk1"
    pecvmrgName     = "gen-uks-dev-hs-managed-hpb-dvweb-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["1"]
  }
}

pecvmdisks02 = {
  "disk01" = {
    pecvm01diskname = "gukststhshda01-datadisk1"
    pecvmrgName     = "gen-uks-dev-hs-managed-hpb-dvapp-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["1"]
  }
}

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-uat-hs-apex-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-uat-uat-apex-vmbackup-rg-01"
    vm_id                 = "source_vm01_id"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-uat-hs-apex-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-uat-uat-apex-vmbackup-rg-01"
    vm_id                 = "source_vm02_id"
    policy_id             = "backup_policy_id_02"
  }
}

############################################################################################################################
#                                 Diagnostic setting log and metrics configuration to VM NIC                                                       #
############################################################################################################################
diagsettingnic = [
  {
    nicname = "gukststhshdw01-nic-01",
    rg      = "gen-uks-dev-hs-managed-hpb-dvweb-rg-01"
  },
  {
    nicname = "gukststhshda01-nic-01",
    rg      = "gen-uks-dev-hs-managed-hpb-dvapp-rg-01"
}]
