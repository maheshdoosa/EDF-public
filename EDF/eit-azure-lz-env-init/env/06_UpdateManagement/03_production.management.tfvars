environment = "Live"

#managementHs key vault
managementHsKvName   = "eitlzmanagementhskv"
managementHsKvRgName = ".security"

wsusRgName                     = "eit-uks-alz-hs-wsus-rg"
wsusLocation                   = "uksouth"
wsusSubnetName                 = "eit-alz-hs-wsus-snet-01"
lzmanagementHsVnetName         = "eit-uks-alz-hs-mgmt-vnet-01"
lzmanagementHsNetworkingRgName = "eit-uks-alz-hs-mgmt-vnet-rg"

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=Servers,DC=edf-hs,DC=com"

######### This VM was deployed before the azure-vm base module was modified with AntiMalware and prepforvm ext. These settings have been configured manually on this VM ###
######### We need to remove the existing extensions before we could re-trigger these #####################
storageAccountName  = "eituksalzhsauxscripts"
saContainerName     = "scripts"
gbRegionXmlFilePath = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/PrepareVM.ps1"
lapsFilePath        = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/LAPS.x64.msi"
IaaSAntiMalware     = <<SETTINGS
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

bootDiagLogStorageAccountName   = "eituksalzhsvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-hs-vmlogs-rg-01"

############### Update Management ##########
updateManagmentRgName     = "eit-uks-alz-hs-loga-rg"
updateManagmentRgLocation = "UK South"
laWorkspacename           = "eit-uks-alz-hs-loga-01"
laWorkspaceSku            = "Free"
automationAccountName     = "eit-uks-alz-hs-mgmt-aa-01"
automationAccountSku      = "Basic"
lawSolutionName           = "Updates"

amplsName                 = "eit-uks-alz-hs-mgmt-vnet-rg"
laEndPointName            = "eituksalzhsloga01-pe"
laSubResourceName         = ["azuremonitor"]
laPrivateServiceConnName  = "eit-uks-alz-hs-mgmt-vnet-rg"
aacEndPointName           = "eituksalzhsmgmtaa01-pe"
aacSubResourceName        = ["DSCAndHybridWorker"]
aacPrivateServiceConnName = "eit-uks-alz-hs-mgmt-aa-01"
#############
# automationAccountMsiTemplate = "aacmsitemplate"
identityType = "SystemAssigned"
#####
category1 = "JobLogs"
category2 = "JobStreams"
category3 = "DscNodeStatus"
category4 = "AuditEvent"
category5 = "AllMetrics"

categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90

###########
private_dns_zone_name = "privatelink.azure-automation.net"
endpoint_SC           = "eituksalzhsmgmtaa01-pesc"
is_manual_connection  = "false" //keep default false
subresource_names     = ["DSCAndHybridWorker"]

diagsettingnic = [
  {
    nicname = "eitukshswus01-nic-01",
    rg      = "eit-uks-alz-hs-wsus-rg"
  }
]
