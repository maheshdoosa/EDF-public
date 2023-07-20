environment                    = "Sandpit"
location                       = "uksouth"
IaaSAntiMalware                = <<SETTINGS
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
IaaSAntiMalwareDC              = <<SETTINGS
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
                    "Paths": "%allusersprofile%\\NTUser.pol;%windir%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb;F:\\ntds\\ntds.dit;F:\\ntds\\EDB*.log;F:\\ntds\\Edbres*.jrs;F:\\ntds\\EDB.chk;F:\\ntds\\TEMP.edb;F:\\ntds\\*.pat;F:\\SYSVOL\\staging;F:\\SYSVOL\\staging areas;F:\\SYSVOL\\sysvol;%windir%\\System32\\Dns\\*.log;%windir%\\System32\\Dns\\*.dns;%windir%\\System32\\Dns\\boot",
                    "Processes": "%windir%\\System32\\ntfrs.exe;%windir%\\System32\\dfsr.exe;%windir%\\System32\\dfsrs.exe"
                }
            }
            SETTINGS
PrepVMsettings                 = <<SETTINGS
  {
      "fileUris": ["https://eituksalzhsauxscript.blob.core.windows.net/scripts/GBRegion.xml","https://eituksalzhsauxscript.blob.core.windows.net/scripts/PrepareVMForAD.ps1"]
  }
  SETTINGS
resourceGroupName              = "eit-uks-alz-ss-adds-rg"
managementSsKvName             = "eitlzmanagementhsk"
managementSsKvRgName           = ".security"
managementSsSaRgName           = "eit-uk-alz-hs-auxscripts"
publisher                      = "Microsoft.Compute"
scriptPathPrepareVm            = "https://eituksalzhsauxscript.blob.core.windows.net/scripts/PrepareVMForAD.ps1"
scriptFilePrepareVm            = "PrepareVMForAD.ps1"
urlCreateAdRootDc1             = "https://eituksalzhsauxscript.blob.core.windows.net/scripts/CreateADRootDC1.ps1.zip"
urlConfigureADNextDC           = "https://eituksalzhsauxscript.blob.core.windows.net/scripts/ConfigureADNextDC.ps1.zip"
storageAccountName             = "eituksalzhsauxscript"
dnsForwarder                   = "168.63.129.16"
saContainerName                = "scripts"
createADRootDC1                = "createADRootDC1.ps1"
createFunctionAdRootDc1        = "createADRootDC1"
ConfigureADNextDC              = "ConfigureADNextDC.ps1"
createFunctionAdRootDc2        = "ConfigureADNextDC"
addsSubnetName                 = "eit-alz-ss-adds-snet-01"
lzmanagementSsVnetName         = "eit-uks-alz-ss-mgmt-vnet-01"
lzmanagementSsNetworkingRgName = "eit-uks-alz-ss-mgmt-vnet-rg"

bootDiagLogStorageAccountName   = "eituksalzsandvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-sand-vmlogs-rg-01"
