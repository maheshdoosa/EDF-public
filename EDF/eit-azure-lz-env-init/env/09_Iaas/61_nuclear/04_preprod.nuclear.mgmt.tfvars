# NuclearRnD HS  key vault
NuclearRnDHSKvName = "avmgenprdhsmngdsub01kv"

scripthstorageAccountName = "genuksprdhsvmscrtsa01"
saContainerName           = "scripts"

NuclearRnDHSnpdvmRgName      = "gen-uks-prd-hs-managed-hpb-npdweb-rg-01"
NuclearRnDHSResourceLocation = "uksouth"

NuclearRnDHSnpdvm01nicname = "guksprdhshnw01-nic-01"
VM01nicIpConfigName        = "guksprdhshnw01-nic-01-Ip-Config"
NuclearRnDHSnpdvm01Name    = "guksprdhshnw01"
NuclearRnDHSvm01osDiskName = "guksprdhshnw01-osdisk"
hostname                   = "guksprdhshnw01.edf-hs.com"

NuclearRnDHSnpdvmappRgName = "gen-uks-prd-hs-managed-hpb-npdapp-rg-01"

NuclearRnDHSnpdvm02nicname = "guksprdhshna01-nic-01"
VM02nicIpConfigName        = "guksprdhshna01-nic-01-Ip-Config"
NuclearRnDHSnpdvm02Name    = "guksprdhshna01"
NuclearRnDHSvm02osDiskName = "guksprdhshna01-osdisk"
hostname2                  = "guksprdhshna01.edf-hs.com"

NuclearRnDHSnpdSubnetName       = "gen-uks-prd-hs-hpb-npdweb-snet-01"
NuclearRnDHSnpdSubnetNameapp    = "gen-uks-prd-hs-hpb-npdapp-snet-01"
NuclearRnDHSnpdVnetName         = "gen-uks-prd-hs-managed-vnet-01"
NuclearRnDHSnpdNetworkingRgName = "gen-uks-prd-hs-managed-vnet-rg-01"

enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

bootDiagLogStorageAccountName   = "genuksprdhsvmlogssa01"
bootDiagLogStorageAccountRgName = "gen-uks-prd-hs-vmlogs-rg-01"
storageAccountName              = "genuksprdhsvmscrtsa01"
DomainJoinFilePath              = "https://genuksprdhsvmscrtsa01.blob.core.windows.net/scripts/ubuntu_domainjoin_updated.sh"

ouPath = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"

#adAdminGroup variable should not contain any spaces and starts with %
adAdminGroup  = "%Domain^Admins@edf-hs.com" #The security group to be added
adAdminGroup2 = "%npdops_temp_admins@edf-hs.com"


######## Golden image #########
ImageRGname      = "eit-uks-alz-hs-imagebuild-rg"
Imagegalleryname = "eituksalzhsimagebuild01"
Imagename        = "ubuntu20_04"
ImageVersion     = "latest"

## RSV and Backup #############

rsv_resourceGroupName    = "gen-uks-hs-prd-apex-vmbackup-rg-01"
recovery_vault_name      = "gen-uks-prd-hs-apex-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

######## Disk Encryption #####
EncryptionOperation    = "EnableEncryption"
VolumeType             = "All"
KeyEncryptionAlgorithm = "RSA-OAEP"
NuclearSsAdeKvName     = "g-uks-prd-hs-apex-ade-kv"
NuclearSsAdeKvRgName   = "gen-uks-prd-hs-apex-ade-rg-01"

######### Data Disks #######
# pecvm01zone           = ["1"]
create_option              = "Empty"
pecvm_storage_account_type = "StandardSSD_LRS"
caching                    = "None"
disk_lun_01                = "1"
Nuclearpecvm01_data_disk   = "guksprdhshnw01-datadisk1"
Nuclearpecvm02_data_disk   = "guksprdhshna01-datadisk1"
pecvmdisks01 = {
  "disk01" = {
    pecvm01diskname = "guksprdhshnw01-datadisk1"
    pecvmrgName     = "gen-uks-prd-hs-managed-hpb-npdweb-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["1"]
  }
}

pecvmdisks02 = {
  "disk01" = {
    pecvm01diskname = "guksprdhshna01-datadisk1"
    pecvmrgName     = "gen-uks-prd-hs-managed-hpb-npdapp-rg-01"
    pecdiskSize     = "256"
    pecvm01zone     = ["1"]
  }
}

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-prd-hs-apex-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-prd-apex-vmbackup-rg-01"
    vm_id                 = "source_vm01_id"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-prd-hs-apex-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-prd-apex-vmbackup-rg-01"
    vm_id                 = "source_vm02_id"
    policy_id             = "backup_policy_id_02"
  }
}

############################################################################################################################
#                                 Diagnostic setting log and metrics configuration to VM NIC                                                       #
############################################################################################################################
diagsettingnic = [
  {
    nicname = "guksprdhshnw01-nic-01",
    rg      = "gen-uks-prd-hs-managed-hpb-npdweb-rg-01"
  },
  {
    nicname = "guksprdhshna01-nic-01",
    rg      = "gen-uks-prd-hs-managed-hpb-npdapp-rg-01"
}]
