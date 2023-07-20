environment               = "Sandpit"
updateManagmentRgName     = "eit-uks-alz-sand-loga-rg2"
updateManagmentRgLocation = "UK South"
laWorkspacename           = "eit-uks-alz-sand-loga-new"
laWorkspaceSku            = "Free"
automationAccountName     = "eit-uks-alz-sand-mgmt-aa-012"
automationAccountSku      = "Basic"
lawSolutionName           = "Updates"

#managementHs key vault
managementSsKvName   = "eit-uks-snd-ss-vd-kvt-01"
managementSsKvRgName = "eit-uks-snd-ss-wvd-kvt-rg-01"

#WSUS variables
wsusRgName                     = "eit-uks-alz-sand-wsus-rg2"
wsusLocation                   = "uksouth"
wsusSubnetName                 = "eit-uks-alz-sand-mgmt-snet-02"
lzmanagementSsVnetName         = "eit-uks-alz-sand-mgmt-vnet-01"
lzmanagementSsNetworkingRgName = "eit-uks-alz-sand-mgmt-vnet-rg-01"

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=Servers,DC=edf-hs,DC=com"

bootDiagLogStorageAccountName   = "eituksalzsandvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-sand-vmlogs-rg-01"

storageAccountName   = "eituksalzhsauxscript"
managementSsSaRgName = "eit-uk-alz-hs-auxscripts"
saContainerName      = "scripts"

gbRegionXmlFilePath = "https://eituksalzhsauxscript.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzhsauxscript.blob.core.windows.net/scripts/PrepVM.ps1"

amplsName = "eit-uks-alz-sand-ampls-01"
