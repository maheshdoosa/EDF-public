environment       = "Production"
managedSsKvName   = "avmgenprdssmngdsub01kv"
managedSsKvRgName = ".security"

############### VM Restore #########
lzmanagedSsEmerson_resourceLocation      = "uksouth"
lzmanagedSsEmerson_rsvName               = "gen-uks-prd-ss-vmbackup-rsv-01"
lzmanagedSsEmerson_rsvrgname             = "gen-uks-prd-ss-vmbackup-rg-01"
lzmanagedSsEmerson_vmname                = "genuksprdams01"
lzmanagedSsEmerson_vmrestoreRgName       = "gen-uks-prd-ss-backuprestore-rg-01"
lzmanagedSsEmerson_storageAccountName    = "eituksgenssauxscriptprd"
lzmanagedSsEmerson_vmrestoretargetRgName = "gen-uks-prd-ss-restoretarget-rg-01"
lzmanagedSsEmerson_newdiskName           = "genuksprdams01"
lzmanagedSsEmerson_newdiskName_r         = "genuksprdams01r"

########### VM ###############

eamnicName                      = "genuksprdams01-nic-01"
nicIpConfigName                 = "genuksprdams01-nic-01-Ip-Config"
nicipName                       = "genuksprdams01-nic-01-Ip"
avSetname                       = "eit-uks-alz-ss-ams-avs-r"
eamvmName                       = "genuksprdams01"
vmosDiskName                    = "genuksprdams01-osdisk"
vmstorageDiskName               = "genuksprdams01-datadisk"
vmstorageDiskName_r             = "genuksprdams01r-datadisk"
lzmanagedSsVnetName             = "gen-uks-prd-ss-managed-vnet-01"
emersonSubnetName               = "gen-uks-prd-ss-ams-snet-restore" // need to update
lzmanagedSsNetworkingRgName     = "gen-uks-prd-ss-managed-vnet-rg-01"
bootDiagLogStorageAccountName   = "genuksprdssvmlogssa01"
bootDiagLogStorageAccountRgName = "gen-uks-prd-ss-vmlogs-rg-01"
