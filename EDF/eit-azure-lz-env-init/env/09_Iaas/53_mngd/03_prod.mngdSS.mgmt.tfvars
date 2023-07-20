environment                  = "Production"
lzmanagedSsEmersonRgName     = "gen-uks-prd-ss-ams-rg-01"
lzHubManagedResourceLocation = "uksouth"
#managedSs key vault
managedSsKvName      = "avmgenprdssmngdsub01kv"
managementSsKvRgName = ".security"
#New parameterized variables
eamnicName        = "genuksprdams01-nic-01"
nicIpConfigName   = "genuksprdams01-nic-01-Ip-Config"
nicipName         = "genuksprdams01-nic-01-Ip"
avSetname         = "eit-uks-alz-ss-ams-avs"
eamvmName         = "genuksprdams01"
vmosDiskName      = "genuksprdams01-osdisk"
vmstorageDiskName = "genuksprdams01-datadisk"

lzmanagedSsVnetName         = "gen-uks-prd-ss-managed-vnet-01"
emersonSubnetName           = "gen-uks-prd-ss-ams-snet-01"
lzmanagedSsNetworkingRgName = "gen-uks-prd-ss-managed-vnet-rg-01"
storageAccountName          = "eituksgenssauxscriptprd"
saContainerName             = "scripts"

bootDiagLogStorageAccountName   = "genuksprdssvmlogssa01"
bootDiagLogStorageAccountRgName = "gen-uks-prd-ss-vmlogs-rg-01"

lapsFilePath        = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/LAPS.x64.msi"
gbRegionXmlFilePath = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/PrepareVM.ps1"

ouPath = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-ss,DC=com"

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

######### Azure Disk Encryption ############

managedSsAdeKvName   = "gen-uks-prd-ss-ade-kv-02"
managedSsAdeKvRgName = "gen-uks-prd-ss-ade-rg-01"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"


########### EPONA #################

lzmanagedSsEponaRgName            = "gen-uks-prd-ss-epn-rg-01"
EponaSubnetName                   = "gen-uks-prd-ss-epn-snet-01"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
EponaVM01Name                     = "guksprdssepn01"
EponaVM01nicIpConfigName          = "guksprdssepn01-nic-01-Ip-Config"
EponaavSetname                    = "gen-uks-prd-ss-epn-avs-01"
EponaVM01nicName                  = "guksprdssepn01-nic-01"
EponaVMosDiskName                 = "guksprdssepn01-osdisk"
EponaVMstorageDiskName            = "guksprdssepn01-datadisk"

########### COMINOD #################

CominodResourceLocation               = "uk south"
CominodvmRgName                       = "gen-uks-prd-ss-com-rg-01"
CominodVM01nicName                    = "guksprdsscom01-nic-01"
CominodVM01nicIpConfigName            = "guksprdsscom01-nic-01-Ip-Config"
enable_nic_ip_forwarding_com          = "false"
enable_nic_accelerated_networking_com = "true"
CominodavSetname                      = "gen-uks-prd-ss-com-avs-01"
CominodVM01Name                       = "guksprdsscom01"
CominodVMosDiskName                   = "guksprdsscom01-osdisk"
CominodVMstorageDiskName              = "guksprdsscom01-datadisk"
CominodSubnetName                     = "gen-uks-prd-ss-com-snet-01"

########## Backup for VM ################

RSVName               = "gen-uks-prd-ss-vmbackup-rsv-01"
RSVRgName             = "gen-uks-prd-ss-vmbackup-rg-01"
infraVM_backup_policy = "Daily-2200-52W-AppVMs"
vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_vm_id_01"
    policy_id             = "backup_policy_id"
  }
}
