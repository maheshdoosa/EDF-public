environment               = "Staging"
updateManagmentRgName     = "eit-uks-alz-ss-loga-rg"
updateManagmentRgLocation = "UK South"
laWorkspacename           = "eit-uks-alz-ss-loga-01-stg"
laWorkspaceSku            = "Free"
automationAccountName     = "eit-uks-alz-ss-mgmt-aa-01"
automationAccountSku      = "Basic"
lawSolutionName           = "Updates"

#managementHs key vault
managementSsKvName   = "mgmtssinfrasecrets"
managementSsKvRgName = ".security"

#WSUS variables
wsusRgName                     = "eit-uks-alz-ss-wsus-rg"
wsusLocation                   = "uksouth"
wsusSubnetName                 = "eit-alz-ss-wsus-snet-01"
lzmanagementSsVnetName         = "eit-uks-alz-ss-mgmt-vnet-01"
lzmanagementSsNetworkingRgName = "eit-uks-alz-ss-mgmt-vnet-rg2"

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=Servers,DC=edf-ss,DC=com"

#bootDiagLogStorageAccountName  = "stortestboot"
#bootDiagLogStorageAccountRgName = "eit-uks-stg-adds-rg"

storageAccountName   = "eituksalzssauxscript"
managementSsSaRgName = "eit-uk-alz-ss-auxscripts"
saContainerName      = "scripts"

bootDiagLogStorageAccountName   = "eituksalzssvmlogssa01stg"
bootDiagLogStorageAccountRgName = "eit-uks-alz-stg-vmlogs-rg-01"

gbRegionXmlFilePath = "https://eituksalzssauxscript.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzssauxscript.blob.core.windows.net/scripts/PrepVM.ps1"

amplsName = "eit-uks-alz-stg-ampls-01"

######### Azure Disk Encryption ############

managementSsAdeKvName   = "eit-uks-alz-ss-ade-kvt"
managementSsAdeKvRgName = "eit-uks-alz-ss-ade-rg-01"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"
