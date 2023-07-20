environment                  = "Sandpit"
lzmanagedSssecgovRgName      = "eit-uks-sand-ss-midprd-rg-01" #"gen-uks-sand-ss-ams-rg-03"
lzHubManagedResourceLocation = "uksouth"
eamnicName                   = "eituksalzsandhmid01-nic-01"
eamnicName02                 = "eituksalzsandhmid01-nic-02"
nicIpConfigName              = "eituksalzsandhmid01-nic-01-config"
nicipName                    = "eituksalzsandhmid01-nic-01-ipname"
nicIpConfigName02            = "eituksalzsandhmid01-nic-01-config-02"
nicipName02                  = "eituksalzsandhmid01-nic-01-ipname-02"

# #managedSs key vault
managedSsKvName      = "testamssandSecgov"
managementSsKvRgName = "eit-uks-sand-ss-midprd-rg-01" #".security"

SecgovSubnetName            = "eit-alz-ss-midsand-snet-01"
lzmanagedSsVnetName         = "eit-uks-sandpit-ss-secgovprd-vnet-01"
lzmanagedSsNetworkingRgName = "eit-uks-sand-ss-midprd-rg-01"
avSetname                   = "eit-uks-alz-sand-ss-midprd-avs-01"
storageAccountName          = "diagss01alz"
saContainerName             = "scripts"
eamvmName                   = "euksalzssaspd01"
eamvmName02                 = "euksalzssaspd02"
vmosDiskName                = "euksalzsandsmidp01-osdisk"
vmstorageDiskName           = "euksalzhmidp01-datadisk"
vmosDiskName02              = "euksalzsandsmidp02-osdisk"
vmstorageDiskName02         = "euksalzhmidp02-datadisk"



bootDiagLogStorageAccountName   = "diagss01alz"
bootDiagLogStorageAccountRgName = "eit-uks-sand-ss-midprd-rg-01"

gbRegionXmlFilePath = "https://diagss01alz.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://diagss01alz.blob.core.windows.net/scripts/PrepareVM.ps1"

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=EDF Servers,DC=edf-ss,DC=com" #"OU=PKI,DC=edftest,DC=local"

# ######### Azure Disk Encryption ############

managedSsAdeKvName   = "testamssandSecgov"
managedSsAdeKvRgName = "eit-uks-sand-ss-midprd-rg-01"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"
