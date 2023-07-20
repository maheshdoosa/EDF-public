environment                  = "Production"
lzmanagedSssecgovRgName      = "eit-uks-alz-ss-midprd-rg-01" #"gen-uks-sand-ss-ams-rg-03"
lzHubManagedResourceLocation = "uksouth"
eamnicName                   = "euksalzsmidp01-nic-01"
eamnicName02                 = "euksalzsmidp02-nic-01"
nicIpConfigName              = "euksalzshmid01-nic-01-config"
nicipName                    = "euksalzshmid01-nic-01-ipname"
nicIpConfigName02            = "euksalzshmid01-nic-01-config-02"
nicipName02                  = "euksalzshmid01-nic-01-ipname-02"

# #managedSs key vault
managedSsKvName      = "avmeitalzsssecgovsub01kv" #To be updated
managementSsKvRgName = ".security"

SecgovSubnetName            = "eit-alz-ss-midprd-snet-01"
lzmanagedSsVnetName         = "eit-uks-alz-ss-secgovprd-vnet-01"
lzmanagedSsNetworkingRgName = "eit-uks-alz-ss-secgovprd-vnet-rg-01"
avSetname                   = "eit-uks-alz-ss-midprd-avs-01"
storageAccountName          = "eitalzsssgovauxscriptprd" #needs to be updated
saContainerName             = "scripts"
eamvmName                   = "euksalzsmidp01"
eamvmName02                 = "euksalzsmidp02"
vmosDiskName                = "euksalzsmidp01-osdisk"
vmstorageDiskName           = "euksalzsmidp01-datadisk"
vmosDiskName02              = "euksalzsmidp02-osdisk"
vmstorageDiskName02         = "euksalzsmidp02-datadisk"



bootDiagLogStorageAccountName   = "eituksalzssprdvmlogssa02"
bootDiagLogStorageAccountRgName = "eit-alz-ss-secgov-prdvmlogs-rg-01"
lapsFilePath                    = "https://eitalzsssgovauxscriptprd.blob.core.windows.net/scripts/LAPS.x64.msi"
gbRegionXmlFilePath             = "https://eitalzsssgovauxscriptprd.blob.core.windows.net/scripts/GBRegion.xml"  #needs to be updated post the script storage account
prepVmPs1FilePath               = "https://eitalzsssgovauxscriptprd.blob.core.windows.net/scripts/PrepareVM.ps1" #needs to be updated post the script storage account

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=EDF Servers,DC=edf-ss,DC=com" #"OU=PKI,DC=edftest,DC=local"

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

managedSsAdeKvName   = "eit-alz-ss-sgov-pkvt-01"
managedSsAdeKvRgName = "eit-alz-ss-secgov-prdade-rg-01"

EncryptionOperation      = "EnableEncryption"
KeyEncryptionAlgorithm   = "RSA-OAEP"
VolumeType               = "All"
rsv_resourceGroupName    = "eit-alz-ss-secgov-prdvmbackup-rg-01"
recovery_vault_name      = "eit-alz-ss-secgov-prdvmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "eit-alz-ss-secgov-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-ss-secgov-prdvmbackup-rg-01"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name   = "eit-alz-ss-secgov-prdvmbackup-rsv-01"
    rsv_resourceGroupName = "eit-alz-ss-secgov-prdvmbackup-rg-01"
    vm_id                 = "source_vm2_id"
    policy_id             = "backup_policy_id_02"
  }
}



tenableSubnetName              = "eit-alz-ss-tenable-snet-01"
tenablenicName                 = "eituksssvscan01-nic-01"
lzmanagedSssecgovtenableRgName = "eit-uks-alz-ss-tenable-rg-01"
tenablenicIpConfigName         = "eituksssvscan01-nic-01-ip-Config"

tenablevmname = "eituksssvscan01"

bootDiagLogtenableStorageAccountName   = "eituksalzssprdvmlogssa02"
bootDiagLogtenableStorageAccountRgName = "eit-alz-ss-secgov-prdvmlogs-rg-01"


lztenablezone        = ["1"]
create_option        = "Empty"
storage_account_type = "Standard_LRS"
caching              = "None"

disks = {
  "disk01" = {
    diskname = "eituksssvscan01-datadisk"
    vmrgName = "eit-uks-alz-ss-tenable-rg-01"
    diskSize = "64"
  }
}

Tenable_data_disk = "eituksssvscan01-datadisk"
disk_lun_01       = "1"
