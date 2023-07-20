environment            = "Test"
apexHsRgName           = "gen-uks-dev-hs-managed-apex-rg-01"
apexHsRgName_tst       = "gen-uks-tst-hs-managed-apex-rg-01"
apexHsResourceLocation = "uksouth"
# Apex HS key vault
apexHsKvName = "avmgentsthsmngdsub01kv"
# managementSsKvRgName = ".security"
#New parameterized variables
apexnic01name   = "gukshsdevapex01-nic-01"
nicIpConfigName = "gukshsdevapex01-nic-01-Ip-Config"
nicipName       = "gukshsdevapex01-nic-01-Ip"
apexvm01Name    = "gukshsdevapex01"
vmosDiskName    = "gukshsdevapex01-osdisk"
# vmstorageDiskName               = "gukshsdevapex01-datadisk"
###### VM02 ######
apexnic02name     = "gukshsdevapex02-nic-01"
nicIpConfigName02 = "gukshsdevapex02-nic-01-Ip-Config"
nicipName02       = "gukshsdevapex02-nic-01-Ip"
apexvm02Name      = "gukshsdevapex02"
vm02osDiskName    = "gukshsdevapex02-osdisk"
# vm02storageDiskName             = "gukshsdevapex02-datadisk"

#Test Apex VM
apexTstnic01name     = "gukshststapex01-nic-01"
nicIpTstConfigName01 = "gukshststapex01-nic-01-Ip-Config"
nicipTstName01       = "gukshststapex01-nic-01-Ip"
apexTstvm01Name      = "gukshststapex01"
vmTstosDiskName      = "gukshststapex01-osdisk"
# vmstorageDiskName               = "gukshststapex01-datadisk"
###### Tst VM02 ######
apexTstnic02name     = "gukshststapex02-nic-01"
nicIpTstConfigName02 = "gukshststapex02-nic-01-Ip-Config"
nicipTstName02       = "gukshststapex02-nic-01-Ip"
apexTstvm02Name      = "gukshststapex02"
vmTstosDiskName02    = "gukshststapex02-osdisk"
# vm02storageDiskName             = "gukshststapex02-datadisk"

apexHsVnetName            = "gen-uks-dev-hs-managed-vnet-01"
apexHsTstVnetName         = "gen-uks-tst-hs-managed-vnet-01"
apexSubnetName            = "gen-uks-dev-hs-apex-snet-01"
apexTstSubnetName         = "gen-uks-tst-hs-apex-snet-01"
apexHsNetworkingRgName    = "gen-uks-dev-hs-managed-vnet-rg-01"
apexHsTstNetworkingRgName = "gen-uks-tst-hs-managed-vnet-rg-01"
storageAccountName        = "eitukshsapexscriptdev"
storageAccountNametst     = "eitukshsapexscripttst"
saContainerName           = "scripts"

bootDiagLogStorageAccountName   = "genuksdevhsvmlogssa02"
bootDiagLogStorageAccountRgName = "gen-uks-dev-hs-vmlogs-rg-01"

bootDiagLogStorageAccountNametst   = "genukststhsvmlogssa01"
bootDiagLogStorageAccountRgNametst = "gen-uks-tst-hs-vmlogs-rg-01"

DomainJoinFilePath    = "https://eitukshsapexscriptdev.blob.core.windows.net/scripts/domainjoin.sh"
DomainJoinFilePathtst = "https://eitukshsapexscripttst.blob.core.windows.net/scripts/domainjoin.sh"

# gbRegionXmlFilePath = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/GBRegion.xml"
# prepVmPs1FilePath = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/PrepareVM.ps1"

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
adAdminGroup = "%sec-HS-APEX-LocalAdmin-SU@EDF-HS.COM" #The security group to be added
#adAdminGroup variable should not contain any spaces and starts with %

######### Azure Disk Encryption ############

apexHsAdeKvName   = "gen-dev-hs-apex-kvt-01"
apexHsAdeKvRgName = "gen-uks-hs-apex-devade-rg-01"

######### Azure Disk Encryption ############

apexHsAdeTstKvName   = "gen-tst-hs-apex-kvt-01"
apexHsAdeTstKvRgName = "gen-uks-hs-apex-tstade-rg-01"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "OS"

rsv_resourceGroupName     = "gen-uks-dev-hs-apex-vmbackup-01"
recovery_vault_name       = "gen-uks-dev-hs-vmbackup-rsv-01"
rsv_resourceGroupName_tst = "gen-uks-tst-hs-apex-vmbackup-01"
recovery_vault_name_tst   = "gen-uks-tst-hs-vmbackup-rsv-01"
infraVM_backup_policy     = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02  = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-dev-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-dev-hs-apex-vmbackup-01"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-dev-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-dev-hs-apex-vmbackup-01"
    vm_id                 = "source_vm2_id"
    policy_id             = "backup_policy_id_02"
  }
}

vm_name_tst = {
  vm1 = {
    recovery_vault_name_tst   = "gen-uks-tst-hs-vmbackup-rsv-01"
    rsv_resourceGroupName_tst = "gen-uks-tst-hs-apex-vmbackup-01"
    vm_id                     = "source_tst_vm_id"
    policy_id                 = "backup_policy_id_tst"
  },
  vm2 = {
    recovery_vault_name_tst   = "gen-uks-tst-hs-vmbackup-rsv-01"
    rsv_resourceGroupName_tst = "gen-uks-tst-hs-apex-vmbackup-01"
    vm_id                     = "source_tst_vm2_id"
    policy_id                 = "backup_policy_id_02_tst"
  }
}

######################### Variables for Dev Disk Creation #######################
vmstorageDiskNameDev01 = "gukshsdevapex01-datadisk"
vmstorageDiskNameDev02 = "gukshsdevapex02-datadisk"
st_disk = {
  sd1 = {
    vmstorageDiskName    = "gukshsdevapex01-datadisk"
    disk_size_gb         = "256"
    storage_account_type = "Premium_LRS"
    create_option        = "Empty"
  },
  sd2 = {
    vmstorageDiskName    = "gukshsdevapex02-datadisk"
    disk_size_gb         = "512"
    storage_account_type = "Premium_LRS"
    create_option        = "Empty"
  }
}

######################### Variables for Tst Disk Creation #######################
vmstorageDiskNameTst01 = "gukshststapex01-datadisk"
vmstorageDiskNameTst02 = "gukshststapex02-datadisk"
tst_disk = {
  sd1 = {
    vmstorageDiskName    = "gukshststapex01-datadisk"
    disk_size_gb         = "256"
    storage_account_type = "Premium_LRS"
    create_option        = "Empty"
  },
  sd2 = {
    vmstorageDiskName    = "gukshststapex02-datadisk"
    disk_size_gb         = "512"
    storage_account_type = "Premium_LRS"
    create_option        = "Empty"
  }
}
diagsettingnic = [
  {
    nicname = "gukshsdevapex01-nic-01",
    rg      = "gen-uks-dev-hs-managed-apex-rg-01"
  },
  {
    nicname = "gukshsdevapex02-nic-01",
    rg      = "gen-uks-dev-hs-managed-apex-rg-01"
  },
  {
    nicname = "gukshststapex01-nic-01",
    rg      = "gen-uks-tst-hs-managed-apex-rg-01"
  },
  {
    nicname = "gukshststapex02-nic-01",
    rg      = "gen-uks-tst-hs-managed-apex-rg-01"
  }
]
