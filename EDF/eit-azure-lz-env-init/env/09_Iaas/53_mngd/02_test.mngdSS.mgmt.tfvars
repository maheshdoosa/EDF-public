environment                  = "Test"
lzmanagedSsEmersonRgName     = "gen-uks-tst-ss-ams-rg-01"
lzHubManagedResourceLocation = "uksouth"
#managedSs key vault
managedSsKvName      = "avmgentstssmngdsub01kv"
managementSsKvRgName = ".security"
#New parameterized variables
eamnicName        = "genukststams01-nic-01"
nicIpConfigName   = "genukststams01-nic-01-Ip-Config"
nicipName         = "genukststams01-nic-01-Ip"
avSetname         = "gen-uks-tst-ss-ams-avs-01"
eamvmName         = "genukststams01"
vmosDiskName      = "genukststams01-osdisk"
vmstorageDiskName = "genukststams01-datadisk"

lzmanagedSsVnetName         = "gen-uks-tst-ss-managed-vnet-01"
emersonSubnetName           = "gen-uks-tst-ss-ams-snet-01"
lzmanagedSsNetworkingRgName = "gen-uks-tst-ss-managed-vnet-rg-01"
storageAccountName          = "genukststssauxscripts"
saContainerName             = "scripts"

bootDiagLogStorageAccountName   = "genukststssvmlogssa02"
bootDiagLogStorageAccountRgName = "gen-uks-tst-ss-vmlogs-rg-01"

lapsFilePath        = "https://genukststssauxscripts.blob.core.windows.net/scripts/LAPS.x64.msi"
gbRegionXmlFilePath = "https://genukststssauxscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://genukststssauxscripts.blob.core.windows.net/scripts/PrepareVM.ps1"

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

managedSsAdeKvName   = "gen-uks-tst-ss-ade-kv-01"
managedSsAdeKvRgName = "gen-uks-tst-ss-ade-rg-01"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"

########### EPONA #################

lzmanagedSsEponaRgName            = "gen-uks-tst-ss-epn-rg-01"
EponaSubnetName                   = "gen-uks-tst-ss-epn-snet-01"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
EponaVM01Name                     = "gukststssepn01"
EponaVM01nicIpConfigName          = "gukststssepn01-nic-01-Ip-Config"
EponaavSetname                    = "gen-uks-tst-ss-epn-avs-01"
EponaVM01nicName                  = "gukststssepn01-nic-01"
EponaVMosDiskName                 = "gukststssepn01-osdisk"
EponaVMstorageDiskName            = "gukststssepn01-datadisk"

########### COMINOD #################

CominodResourceLocation               = "uk south"
CominodvmRgName                       = "gen-uks-tst-ss-com-rg-01"
CominodVM01nicName                    = "gukststsscom01-nic-01"
CominodVM01nicIpConfigName            = "gukststsscom01-nic-01-Ip-Config"
enable_nic_ip_forwarding_com          = "false"
enable_nic_accelerated_networking_com = "true"
CominodavSetname                      = "gen-uks-tst-ss-com-avs-01"
CominodVM01Name                       = "gukststsscom01"
CominodVMosDiskName                   = "gukststsscom01-osdisk"
CominodVMstorageDiskName              = "gukststsscom01-datadisk"
CominodSubnetName                     = "gen-uks-tst-ss-com-snet-01"

########## Backup for VM ################

RSVName               = "gen-uks-tst-ss-vmbackup-rsv-01"
RSVRgName             = "gen-uks-tst-ss-vmbackup-rg-01"
infraVM_backup_policy = "Daily-2200-52W-AppVMs"
vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-tst-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-tst-ss-vmbackup-rg-01"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-tst-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-tst-ss-vmbackup-rg-01"
    vm_id                 = "source_vm_id_01"
    policy_id             = "backup_policy_id"
  }
}
