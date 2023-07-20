environment                     = "High Secured Managed"
dtgwVmRgName                    = "gen-uks-dev-hs-managed-datagw-rg-01"
dtgwVmResourceLocation          = "uksouth"
dtgwSubnetName                  = "gen-uks-dev-hs-datagw-snet-01"
dtgwvnetName                    = "gen-uks-dev-hs-managed-vnet-01"
dtgwVnetRgName                  = "gen-uks-dev-hs-managed-vnet-rg-01"
AVDKvName                       = "gen-sand-hs-ade-kv-01"
AVDKvRgName                     = "gen-uks-dev-hs-ade-rg-01"
storageAccountName              = "storageaccesspolicytest"
saContainerName                 = "scripts"
EncryptionOperation             = "EnableEncryption"
KeyEncryptionAlgorithm          = "RSA-OAEP"
bootDiagLogStorageAccountRgName = "eit-alz-ss-test-dns-rg-01" //Need to change in prod
bootDiagLogStorageAccountName   = "storageaccesspolicytest"
VolumeType                      = "All"
gbRegionXmlFilePath             = "https://storageaccesspolicytest.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath               = "https://storageaccesspolicytest.blob.core.windows.net/scripts/PrepareVM.ps1"
AVDmanagedHsSecretsKvName       = "avmeitsand01kv"
AVDmanagedHsSecretsKvRgName     = ".security"
########################### VM NIC ######################################

lzAVDavVmRgLocation = "UK South"
dtgw01Vm            = "gukshsdevdtgw01"
dtgw02Vm            = "guksprdhsavmg02"

dtgwvm01          = "gukshsdevdtgw01-nic-01"
dtgwvm02          = "guksprdhsavmg02-nic-01"
nicIpConfigdtgw01 = "gukshsdevdtgw01-nic-01-config"
nicIpConfigdtgw02 = "guksprdhsavmg02-nic-01-config"
nicipNamedtgw01   = "gukshsdevdtgw01-nic-01-ipname"
nicipNamedtgw02   = "guksprdhsavmg02-nic-01-ipname"
#av01vmName = "guksprdhsavmg01"
#av02vmName = "guksprdhsavmg02"
dtgw01osDiskName = "gukshsdevdtgw01-osdisk"
dtgw02osDiskName = "guksprdhsavmg02-osdisk"

###### Disk Part

dtgw01Vmdatadisk01          = "gukshsdevdtgw01-datadisk"
dtgw02Vmdatadisk01          = "guksprdhsavmg02-datadisk-01"
storage_account_type        = "Standard_LRS"
dtgw01Vmdatadisk01size      = "128"
dtgw02Vmdatadisk01size      = "128"
create_option               = "Empty"
dtgw01Vmdatadisk01LunNumber = "1"
dtgw02Vmdatadisk01LunNumber = "1"
caching                     = "ReadWrite"

########### RSV

rsv_resourceGroupName    = "gen-uks-sand-hs-dtgw-vmbackup-01"
recovery_vault_name      = "gen-uks-sand-hs-vmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-InfaVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-InfraVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-sand-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-sand-hs-dtgw-vmbackup-01"
    vm_id                 = "source_av_id01"
    policy_id             = "backup_policy_id_01"
  }
}
