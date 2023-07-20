################ Common TFVARS  ################

ComsyHS-Prd-environment = "High Secured Managed"
ComsyHSResourceLocation = "UK South"

ComsyHSKvName = "avmgenprdhsmngdsub01kv"
prjKvRgName   = ".security"

ComsyHSprdkv   = "g-uks-prd-hs-cms-ade-kv"
ComsyHSprdkvrg = "gen-uks-prd-hs-comsy-ade-rg-01"

ComsyHSPrdAuxScriptsSA = "genuksprdhsvmscrtsa01"
auxContainerName       = "scripts"
gbRegionXmlFilePath    = "https://genuksprdhsvmscrtsa01.blob.core.windows.net/scripts/GBRegion.xml"  #needs to be updated post the script storage account
prepVmPs1FilePath      = "https://genuksprdhsvmscrtsa01.blob.core.windows.net/scripts/PrepareVM.ps1" #needs to be updated post the script storage account

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com" #"OU=PKI,DC=edftest,DC=local"
lapsFilePath = "https://genuksprdhsvmscrtsa01.blob.core.windows.net/scripts/LAPS.x64.msi"
########## Azure Disk Encryption ############

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"

################### PROD VM01 TFVARS   ###################

ComsyHSPrdVmRgName                = "gen-uks-prd-hs-managed-comsy-rg-02"
ComsyHSPrdVM01                    = "gukshsprdcmsl01"
ComsyHSPrdVM01nicName             = "gukshsprdcmsl01-nic-01"
ComsyHSPrdVM01nicIpConfigName     = "gukshsprdcmsl01-nic-01-config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
ComsyHSprdNetworkingRgName        = "gen-uks-prd-hs-managed-vnet-rg-01"
ComsyHSprdVnetName                = "gen-uks-prd-hs-managed-vnet-01"
ComsyHSprdSubnetName              = "gen-uks-prd-hs-comsy-snet-01"
VM01OSDiskName                    = "gukshsprdcmsl01-osdisk"
VM01storageDiskName               = "gukshsprdcmsl01-datadisk"


bootDiagLogStorageAccountName   = "genuksprdhsvmlogssa01"
bootDiagLogStorageAccountRgName = "gen-uks-prd-hs-vmlogs-rg-01"


############ VM Backup ###########
ComsyHSPrdRSVName   = "gen-uks-prd-hs-vmbackup-rsv-01"
ComsyHSPrdRSVRgName = "gen-uks-hs-prd-vmbackup-rg-01"

ComsyHS_infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
ComsyHS_infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-prd-vmbackup-rg-01"
    vm_id                 = "source_vm_id_01"
    policy_id             = "backup_policy_id_01"
  }
}
diagsettingnic = [
  {
    nicname = "gukshsprdcmsl01-nic-01",
    rg      = "gen-uks-prd-hs-managed-comsy-rg-02"
  }
]
