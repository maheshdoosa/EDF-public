

# Apex HS key vault
apexHsKvName = "avmgenprdhsmngdsub01kv"
# managementSsKvRgName = ".security"

ApexHsprdvmRgName                 = "gen-uks-prd-hs-managed-apex-rg-01"
ApexHsResourceLocation            = "uksouth"
scriptsstorageAccountName         = "genuksprdhsvmscrtsa01"
saContainerName                   = "scripts"
ApexHsprdvm01nicname              = "gukshsprdapex01-nic-01"
VM01nicIpConfigName               = "gukshsprdapex01-nic-01-Ip-Config"
ApexHsprdvm02nicname              = "gukshsprdapex02-nic-01"
VM02nicIpConfigName               = "gukshsprdapex02-nic-01-Ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

ApexHsprdvm01Name    = "gukshsprdapex01"
ApexHsprdvm02Name    = "gukshsprdapex02"
ApexHsvm01osDiskName = "gukshsprdapex01-osdisk"
ApexHsvm02osDiskName = "gukshsprdapex02-osdisk"

ApexHsprdSubnetName       = "gen-uks-prd-hs-apex-snet-01"
ApexHsprdVnetName         = "gen-uks-prd-hs-managed-vnet-01"
ApexHsprdNetworkingRgName = "gen-uks-prd-hs-managed-vnet-rg-01"


bootDiagLogStorageAccountName   = "genuksprdhsvmlogssa01"
bootDiagLogStorageAccountRgName = "gen-uks-prd-hs-vmlogs-rg-01"

DomainJoinFilePath = "https://genuksprdhsvmscrtsa01.blob.core.windows.net/scripts/domainjoin.sh"

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
adAdminGroup = "%sec-HS-APEX-LocalAdmin-SU@EDF-HS.COM" #The security group to be added
#adAdminGroup variable should not contain any spaces and starts with %

######################### Variables for prd managed Disk Creation #######################

ApexHsprdmanageddiskvm01 = "gukshsprdapex01-datadisk"
ApexHsprdmanageddiskvm02 = "gukshsprdapex02-datadisk"
managed_disk = {
  sd1 = {
    vmstorageDiskName    = "gukshsprdapex01-datadisk"
    disk_size_gb         = "256"
    storage_account_type = "StandardSSD_LRS"
    create_option        = "Empty"
    zone                 = "1"
  },
  sd2 = {
    vmstorageDiskName    = "gukshsprdapex02-datadisk"
    disk_size_gb         = "256"
    storage_account_type = "StandardSSD_LRS"
    create_option        = "Empty"
    zone                 = "2"
  }
}

## Backup for ApexHs Prd VM's #############

rsv_resourceGroupName    = "gen-uks-hs-prd-apex-vmbackup-rg-01"
recovery_vault_name      = "gen-uks-prd-hs-apex-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

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
diagsettingnic = [
  {
    nicname = "gukshsprdapex01-nic-01",
    rg      = "gen-uks-prd-hs-managed-apex-rg-01"
  },
  {
    nicname = "gukshsprdapex02-nic-01",
    rg      = "gen-uks-prd-hs-managed-apex-rg-01"
  }
]

ApexHsUATvmRgName = "gen-uks-uat-hs-managed-apex-rg-01"
ApexHsuatSubnetName = "gen-uks-uat-hs-apex-snet-01"
UATVM01nicIpConfigName = "gukshsuatapex01-nic-01-Ip-Config"
UATVM02nicIpConfigName = "gukshsuatapex02-nic-01-Ip-Config"
ApexHsuatvm01nicname = "gukshsuatapex01-nic-01"
ApexHsuatvm02nicname = "gukshsuatapex02-nic-01"
