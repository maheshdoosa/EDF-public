environment                  = "Sandpit"
lzmanagedSsEmersonRgName     = "gen-uks-sand-ss-ams-rg-03"
lzHubManagedResourceLocation = "uksouth"
#managedSs key vault
managedSsKvName      = "emersonvmtest"
managementSsKvRgName = ".security"

emersonSubnetName           = "subnet1"
lzmanagedSsVnetName         = "ab-test-vnet"
lzmanagedSsNetworkingRgName = "ab-test-Rg"
storageAccountName          = "abteststorageacc"
saContainerName             = "scripts"

bootDiagLogStorageAccountName   = "eituksalzsandvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-sand-vmlogs-rg-01"

gbRegionXmlFilePath = "https://abteststorageacc.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://abteststorageacc.blob.core.windows.net/scripts/PrepareVM.ps1"

ouPath = "OU=PKI,DC=edftest,DC=local"

######### Azure Disk Encryption ############

managedSsAdeKvName   = "testamsemerson"
managedSsAdeKvRgName = "gen-uks-sand-ss-ams-rg-03"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"
