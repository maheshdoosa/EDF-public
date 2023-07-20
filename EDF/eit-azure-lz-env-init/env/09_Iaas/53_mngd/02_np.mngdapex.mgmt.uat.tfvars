

# Apex HS key vault
apexHsKvName         = "avmgentsthsmngdsub01kv"
managementSsKvRgName = ".security"

ApexHsprdvmRgName                 = "gen-uks-uat-hs-managed-apex-rg-01"
ApexHsResourceLocation            = "uksouth"
scriptsstorageAccountName         = "genuksuathsauxscript"
saContainerName                   = "scripts"
ApexHsprdvm01nicname              = "gukshsuatapex01-nic-01"
VM01nicIpConfigName               = "gukshsuatapex01-nic-01-Ip-Config"
ApexHsprdvm02nicname              = "gukshsuatapex02-nic-01"
VM02nicIpConfigName               = "gukshsuatapex02-nic-01-Ip-Config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

ApexHsprdvm01Name    = "gukshsuatapex01"
ApexHsprdvm02Name    = "gukshsuatapex02"
ApexHsvm01osDiskName = "gukshsuatapex01-osdisk"
ApexHsvm02osDiskName = "gukshsuatapex02-osdisk"

ApexHsprdSubnetName       = "gen-uks-uat-hs-apex-snet-01"
ApexHsprdVnetName         = "gen-uks-uat-hs-managed-vnet-01"
ApexHsprdNetworkingRgName = "gen-uks-uat-hs-managed-vnet-rg-01"


bootDiagLogStorageAccountName   = "genuksuathsvmlogssa04"
bootDiagLogStorageAccountRgName = "gen-uks-uat-hs-vmlogs-rg-01"
### /// need to check
DomainJoinFilePath = "https://genuksuathsauxscript.blob.core.windows.net/scripts/domainjoin.sh"

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
adAdminGroup = "%sec-HS-APEX-LocalAdmin-SU@EDF-HS.COM" #The security group to be added
#adAdminGroup variable should not contain any spaces and starts with %

######################### Variables for prd managed Disk Creation #######################

ApexHsprdmanageddiskvm01 = "gukshsuatapex01-datadisk"
ApexHsprdmanageddiskvm02 = "gukshsuatapex02-datadisk"
managed_disk = {
  sd1 = {
    vmstorageDiskName    = "gukshsuatapex01-datadisk"
    disk_size_gb         = "256"
    storage_account_type = "Premium_LRS" # StandardSSD_LRS
    create_option        = "Empty"
    zone                 = "1"
  },
  sd2 = {
    vmstorageDiskName    = "gukshsuatapex02-datadisk"
    disk_size_gb         = "256"
    storage_account_type = "Premium_LRS" # StandardSSD_LRS
    create_option        = "Empty"
    zone                 = "2"
  }
}

## Backup for ApexHs Prd VM's #############

rsv_resourceGroupName    = "gen-uks-uat-uat-apex-vmbackup-rg-01"
recovery_vault_name      = "gen-uks-uat-hs-apex-vmbackup-rsv-01"
infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

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
diagsettingnic = [
  {
    nicname = "gukshsuatapex01-nic-01",
    rg      = "gen-uks-uat-hs-managed-apex-rg-01"
  },
  {
    nicname = "gukshsuatapex02-nic-01",
    rg      = "gen-uks-uat-hs-managed-apex-rg-01"
  }
]
