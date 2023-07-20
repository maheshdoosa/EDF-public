environment                     = "Staging"
lzHubNetworkingRgName           = "eit-uks-stg-hubvnet-rg-01"
lzHubNetworkingResourceLocation = "uksouth"

#managementSs key vault
managementSsKvName   = "mgmtssinfrasecrets"
managementSsKvRgName = ".security"

lzmanagementSsPkiRgName          = "eit-uks-alz-ss-pki-rg"
lzmanagementSsWacRgName          = "eit-uks-alz-ss-wac-rg"
lzmanagementSsWarpLinuxVMsRgName = "eit-uks-alz-ss-snow-rg-02"
lzHubManagementResourceLocation  = "uksouth"
pkiSubnetName                    = "eit-alz-ss-ca-snet-01"
wacSubnetName                    = "eit-alz-ss-wac-snet-01"
warpSubnetName                   = "eit-alz-ss-wac-snet-01"
warpLinuxVMsSubnetName           = "eit-alz-ss-wac-snet-01"
lzmanagementSsVnetName           = "eit-uks-alz-ss-mgmt-vnet-01"
lzmanagementSsNetworkingRgName   = "eit-uks-alz-ss-mgmt-vnet-rg2"
storageAccountName               = "eituksalzssauxscript"
saContainerName                  = "pkiscripts"

bootDiagLogStorageAccountName   = "eituksalzssvmlogssa01stg"
bootDiagLogStorageAccountRgName = "eit-uks-alz-stg-vmlogs-rg-01"

gbRegionXmlFilePath = "https://eituksalzssauxscript.blob.core.windows.net/pkiscripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzssauxscript.blob.core.windows.net/pkiscripts/PrepareVM.ps1"

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=Servers,DC=edf-ss,DC=com"

######### Azure Disk Encryption ############

managementSsAdeKvName   = "mgmtssinfrasecrets"
managementSsAdeKvRgName = ".security"

##################### Extensions #######################

updateManagmentRgName = "eit-uks-alz-stg-loga-rg"
laWorkspacename       = "eit-uks-alz-stg-loga-01"

################ Ado Agent #############################

lzmanagementSsadoagentVMsRgName = "eit-uks-alz-stg-ado-rg"
sigalleryname                   = "eituksalzstgsig01"
sharedimagedefname              = "eituksalzstgsid01"
vmsssubnetname                  = "eit-alz-ss-wac-snet-01"
vmssvnetname                    = "eit-uks-alz-ss-mgmt-vnet-01"
vmssvnetrg                      = "eit-uks-alz-ss-mgmt-vnet-rg2"
