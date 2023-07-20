environment                     = "Sandpit"
lzHubNetworkingRgName           = "eit-uks-stg-hubvnet-rg-01"
lzHubNetworkingResourceLocation = "uksouth"

#managementSs key vault
managementSsKvName   = "pkiwactest"
managementSsKvRgName = ".security"

lzmanagementSsPkiRgName          = "eit-uks-alz-sand-pki-rg"
lzmanagementSsWacRgName          = "eit-uks-alz-ss-wac-rg"
lzmanagementSsWarpLinuxVMsRgName = "eit-uks-alz-ss-snow-rg-02"
lzHubManagementResourceLocation  = "uksouth"
pkiSubnetName                    = "eit-alz-sand-ca-snet-01"
wacSubnetName                    = "eit-alz-sand-wac-snet-01"
warpLinuxVMsSubnetName           = "eit-alz-ss-snow-snet-02"
lzmanagementSsVnetName           = "eit-uks-alz-sand-mgmt-vnet-01"
lzmanagementSsNetworkingRgName   = "pkitestss"
storageAccountName               = "eituksalzsandauxscripts"
saContainerName                  = "scripts"

bootDiagLogStorageAccountName   = "eituksalzsandvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-sand-vmlogs-rg-01"

gbRegionXmlFilePath = "https://eituksalzsandauxscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzsandauxscripts.blob.core.windows.net/scripts/PrepareVM.ps1"

ouPath = "OU=PKI,DC=edftest,DC=local"
