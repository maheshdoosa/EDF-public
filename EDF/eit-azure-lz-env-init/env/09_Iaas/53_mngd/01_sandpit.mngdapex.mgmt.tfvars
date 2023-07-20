environment            = "Sandpit"
apexHsRgName           = "gen-uks-dev-hs-managed-apex-rg-01"
apexHsResourceLocation = "uksouth"
# Apex HS key vault
apexHsKvName = "emersonvmtest"
# managementSsKvRgName = ".security"
#New parameterized variables
apexnic01name   = "gukshsdevapex01-nic-01"
nicIpConfigName = "gukshsdevapex01-nic-01-Ip-Config"
nicipName       = "gukshsdevapex01-nic-01-Ip"
apexvm01Name    = "gukshsdevapex01"
vmosDiskName    = "gukshsdevapex01-osdisk"
# vmstorageDiskName               = "gukshsdevapex01-datadisk"
###### VM02 ######
apexnic02name     = "gukshsdevapex02-nic-01"
nicIpConfigName02 = "gukshsdevapex02-nic-01-Ip-Config"
nicipName02       = "gukshsdevapex02-nic-01-Ip"
apexvm02Name      = "gukshsdevapex02"
vm02osDiskName    = "gukshsdevapex02-osdisk"
# vm02storageDiskName             = "gukshsdevapex02-datadisk"

# apexHsVnetName                  = "apexvnet"
# apexSubnetName                  = "default"
# apexHsNetworkingRgName          = "Ab-apexsa-Rg"

apexHsVnetName         = "gen-uks-dev-hs-managed-vnet-01"
apexSubnetName         = "gen-uks-dev-hs-apex-snet-01"
apexHsNetworkingRgName = "gen-uks-dev-hs-managed-vnet-rg-01"
# storageAccountName              = "eituksgenssauxscriptprd"
# saContainerName                 = "scripts"

bootDiagLogStorageAccountName   = "genuksdevhsvmlogssa01"
bootDiagLogStorageAccountRgName = "Ab-apexsa-Rg"

# gbRegionXmlFilePath = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/GBRegion.xml"
# prepVmPs1FilePath = "https://eituksgenssauxscriptprd.blob.core.windows.net/scripts/PrepareVM.ps1"

# ouPath = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-ss,DC=com"

######### Azure Disk Encryption ############

apexHsAdeKvName   = "testamsemerson"
apexHsAdeKvRgName = "gen-uks-sand-ss-ams-rg-03"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "OS"

rsv_resourceGroupName    = "gen-uks-dev-hs-apex-vmbackup-01"
recovery_vault_name      = "gen-uks-dev-hs-vmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

############ VM Backup ###########

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-dev-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-dev-hs-apex-vmbackup-01"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-dev-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-dev-hs-apex-vmbackup-01"
    vm_id                 = "source_vm2_id"
    policy_id             = "backup_policy_id_02"
  }
}
