environment                  = "Production"
lzmanagedHssecgovRgName      = "eit-uks-alz-hs-midprd-rg-01" #"gen-uks-sand-ss-ams-rg-03"
lzHubManagedResourceLocation = "uksouth"
eamnicName                   = "euksalzhmidp01-nic-01"
eamnicName02                 = "euksalzhmidp02-nic-01"
nicIpConfigName              = "eituksalzhhmid01-nic-01-config"
nicipName                    = "eituksalzhhmid01-nic-01-ipname"
nicIpConfigName02            = "eituksalzhhmid02-nic-01-config-02"
nicipName02                  = "eituksalzhhmid02-nic-01-ipname-02"

# #managedHs key vault
managedHsKvName      = "avmeitalzhssecgovsub01kv" #To be validated
managementHsKvRgName = ".security"

SecgovSubnetName            = "eit-alz-hs-midprd-snet-01"
lzmanagedHsVnetName         = "eit-uks-alz-hs-secgovprd-vnet-01"
lzmanagedHsNetworkingRgName = "eit-uks-alz-hs-secgovprd-vnet-rg-01"
avSetname                   = "eit-uks-alz-hs-midprd-avs-01"
storageAccountName          = "eitalzshsgovauxscriptprd" #needs to be checked
saContainerName             = "scripts"
eamvmName                   = "euksalzhmidp01"
eamvmName02                 = "euksalzhmidp02"
vmosDiskName                = "euksalzhmidp01-osdisk"
vmstorageDiskName           = "euksalzhmidp01-datadisk"
vmosDiskName02              = "euksalzhmidp02-osdisk"
vmstorageDiskName02         = "euksalzhmidp02-datadisk"



bootDiagLogStorageAccountName   = "eituksalzhsprdvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-alz-hs-secgov-prdvmlogs-rg-01"
gbRegionXmlFilePath             = "https://eitalzshsgovauxscriptprd.blob.core.windows.net/scripts/GBRegion.xml"  #needs to be updated post the script storage account
prepVmPs1FilePath               = "https://eitalzshsgovauxscriptprd.blob.core.windows.net/scripts/PrepareVM.ps1" #needs to be updated post the script storage account

ouPath       = "OU=Infrastructure,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com" #"OU=PKI,DC=edftest,DC=local"
lapsFilePath = "https://eitalzshsgovauxscriptprd.blob.core.windows.net/scripts/LAPS.x64.msi"

IaaSAntiMalware = <<SETTINGS
            {
                "AntimalwareEnabled": true,
                "RealtimeProtectionEnabled": "true",
                "ScheduledScanSettings": {
                "isEnabled": "false",
                "day": "1",
                "time": "180",
                "scanType": "Full"
                },
                "Exclusions": {
                    "Extensions": "",
                    "Paths": "%allusersprofile%\\NTUser.pol;%systemroot%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb",
                    "Processes": ""
                }
            }
            SETTINGS

# ######### Azure Disk Encryption ############

managedHsAdeKvName   = "eit-alz-hs-sgov-pkvt-01"
managedHsAdeKvRgName = "eit-alz-hs-secgov-prdade-rg-01"

EncryptionOperation      = "EnableEncryption"
KeyEncryptionAlgorithm   = "RSA-OAEP"
VolumeType               = "All"
rsv_resourceGroupName    = "eit-alz-hs-secgov-prdvmbackup-rg-01"
recovery_vault_name      = "eit-alz-hs-secgov-prdvmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "eit-alz-hs-secgov-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-secgov-prdvmbackup-rg-01"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name   = "eit-alz-hs-secgov-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-secgov-prdvmbackup-rg-01"
    vm_id                 = "source_vm2_id"
    policy_id             = "backup_policy_id_02"
  },
  vm3 = {
    recovery_vault_name   = "eit-alz-hs-secgov-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-hs-secgov-prdvmbackup-rg-01"
    vm_id                 = "source_vm3_id"
    policy_id             = "backup_policy_id"
  }
}


tenableSubnetName              = "eit-alz-hs-tenable-snet-01"
tenablenicName                 = "eitukshsvscan01-nic-01"
lzmanagedHssecgovtenableRgName = "eit-uks-alz-hs-tenable-rg-01"
tenablenicIpConfigName         = "eitukshsvscan01-nic-01-ip-Config"

tenablevmname = "eitukshsvscan01"

bootDiagLogtenableStorageAccountName   = "eituksalzhsprdvmlogssa01"
bootDiagLogtenableStorageAccountRgName = "eit-alz-hs-secgov-prdvmlogs-rg-01"


lztenablezone        = ["1"]
create_option        = "Empty"
storage_account_type = "Standard_LRS"
caching              = "None"

disks = {
  "disk01" = {
    diskname = "eitukshsvscan01-datadisk"
    vmrgName = "eit-uks-alz-hs-tenable-rg-01"
    diskSize = "64"
  }
}

Tenable_data_disk = "eitukshsvscan01-datadisk"
disk_lun_01       = "1"

diagsettingnic = [
  {
    nicname = "euksalzhmidp01-nic-01",
    rg      = "eit-uks-alz-hs-midprd-rg-01"
  },
  {
    nicname = "euksalzhmidp02-nic-01",
    rg      = "eit-uks-alz-hs-midprd-rg-01"
  },
  {
    nicname = "eitukshsvscan01-nic-01",
    rg      = "eit-uks-alz-hs-tenable-rg-01"
  }
]
