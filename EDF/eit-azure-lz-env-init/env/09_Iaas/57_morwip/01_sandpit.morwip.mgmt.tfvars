environment                     = "Standard Secured Managed"
lzAVDavVmRgName                 = "cus-uks-prd-ss-av-rg-01"
lzAVDavVmResourceLocation       = "uksouth"
AVDavSubnetName                 = "cus-uks-prd-ss-av-snet-01"
lzAVDVnetName                   = "cus-uks-prd-ss-mgmt-vnet-01"
lzAVDVnetRgName                 = "avd-test-resources" ///Need to be updated
AVDKvName                       = "avd-test-kvt"       ///Need to be updated
AVDKvRgName                     = "avd-test-resources" ///Need to be updated
storageAccountName              = "eitvmprepscripts"   ///Need to be updated
saContainerName                 = "scripts"
laRgName                        = "avd-test-resources" ///Need to be updated
laWorkspacename                 = "avd-test-la"        ///Need to be updated
EncryptionOperation             = "EnableEncryption"
KeyEncryptionAlgorithm          = "RSA-OAEP"
bootDiagLogStorageAccountRgName = "avd-test-resources" ///Need to be updated
bootDiagLogStorageAccountName   = "avdtestbootlogs"    ///Need to be updated
VolumeType                      = "All"
lzAVDavVmzone                   = ["1"]
gbRegionXmlFilePath             = "https://eitvmprepscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath               = "https://eitvmprepscripts.blob.core.windows.net/scripts/PrepareVM.ps1"
lzAVDzone01                     = ["1"]
lzAVDzone02                     = ["2"]

########################### AVD AV VM Data Disk ######################################

lzAVDavVmRgLocation            = "UK South"
lzAVDav01Vm                    = "cuksprdavmgmt01"
lzAVDav02Vm                    = "cuksprdavmgmt02"
lzAVDav01Vmdatadisk01          = "cuksprdavmgmt01-datadisk-01"
lzAVDav01Vmdatadisk02          = "cuksprdavmgmt01-datadisk-02"
lzAVDav01Vmdatadisk03          = "cuksprdavmgmt01-datadisk-03"
lzAVDav02Vmdatadisk01          = "cuksprdavmgmt02-datadisk-01"
lzAVDav02Vmdatadisk02          = "cuksprdavmgmt02-datadisk-02"
lzAVDav02Vmdatadisk03          = "cuksprdavmgmt02-datadisk-03"
storage_account_type           = "Standard_LRS"
lzAVDav01Vmdatadisk01size      = "16"
lzAVDav01Vmdatadisk02size      = "128"
lzAVDav01Vmdatadisk03size      = "128"
lzAVDav02Vmdatadisk01size      = "16"
lzAVDav02Vmdatadisk02size      = "128"
lzAVDav02Vmdatadisk03size      = "128"
create_option                  = "Empty"
lzAVDav01Vmdatadisk01LunNumber = "1"
lzAVDav01Vmdatadisk02LunNumber = "2"
lzAVDav01Vmdatadisk03LunNumber = "3"
lzAVDav02Vmdatadisk01LunNumber = "1"
lzAVDav02Vmdatadisk02LunNumber = "2"
lzAVDav02Vmdatadisk03LunNumber = "3"
caching                        = "ReadWrite"

################################## AVD SCCM VM #################################################

lzAVDSccmVmRgName                = "cus-uks-prd-ss-sccm-rg-01"
lzAVDSccmVmResourceLocation      = "UK South"
AVDSccmSubnetName                = "cus-uks-prd-ss-sccm-snet-01"
lzAVDSccm01Vm                    = "cuksprdsccm01"
lzAVDSccm02Vm                    = "cuksprdsccm02"
lzAVDSccm01Vmdatadisk01          = "cuksprdsccm01-datadisk-01"
lzAVDSccm01Vmdatadisk02          = "cuksprdsccm01-datadisk-02"
lzAVDSccm01Vmdatadisk03          = "cuksprdsccm01-datadisk-03"
lzAVDSccm02Vmdatadisk01          = "cuksprdsccm02-datadisk-01"
lzAVDSccm02Vmdatadisk02          = "cuksprdsccm02-datadisk-02"
lzAVDSccm02Vmdatadisk03          = "cuksprdsccm02-datadisk-03"
lzAVDSccm01Vmdatadisk01size      = "16"
lzAVDSccm01Vmdatadisk02size      = "128"
lzAVDSccm01Vmdatadisk03size      = "128"
lzAVDSccm02Vmdatadisk01size      = "16"
lzAVDSccm02Vmdatadisk02size      = "128"
lzAVDSccm02Vmdatadisk03size      = "128"
lzAVDSccm01Vmdatadisk01LunNumber = "1"
lzAVDSccm01Vmdatadisk02LunNumber = "2"
lzAVDSccm01Vmdatadisk03LunNumber = "3"
lzAVDSccm02Vmdatadisk01LunNumber = "1"
lzAVDSccm02Vmdatadisk02LunNumber = "2"
lzAVDSccm02Vmdatadisk03LunNumber = "3"

################################## AVD adds VM #################################################

lzAVDaddsVmRgName                = "cus-uks-prd-ss-adds-rg-01"
lzAVDaddsVmResourceLocation      = "UK South"
AVDaddsSubnetName                = "cus-uks-prd-ss-adds-snet-01"
lzAVDadds01Vm                    = "cuksprdadds01"
lzAVDadds02Vm                    = "cuksprdadds02"
lzAVDadds01Vmdatadisk01          = "cuksprdadds01-datadisk-01"
lzAVDadds01Vmdatadisk02          = "cuksprdadds01-datadisk-02"
lzAVDadds01Vmdatadisk03          = "cuksprdadds01-datadisk-03"
lzAVDadds02Vmdatadisk01          = "cuksprdadds02-datadisk-01"
lzAVDadds02Vmdatadisk02          = "cuksprdadds02-datadisk-02"
lzAVDadds02Vmdatadisk03          = "cuksprdadds02-datadisk-03"
lzAVDadds01Vmdatadisk01size      = "16"
lzAVDadds01Vmdatadisk02size      = "128"
lzAVDadds01Vmdatadisk03size      = "128"
lzAVDadds02Vmdatadisk01size      = "16"
lzAVDadds02Vmdatadisk02size      = "128"
lzAVDadds02Vmdatadisk03size      = "128"
lzAVDadds01Vmdatadisk01LunNumber = "1"
lzAVDadds01Vmdatadisk02LunNumber = "2"
lzAVDadds01Vmdatadisk03LunNumber = "3"
lzAVDadds02Vmdatadisk01LunNumber = "1"
lzAVDadds02Vmdatadisk02LunNumber = "2"
lzAVDadds02Vmdatadisk03LunNumber = "3"

######### VM backup #################
rsv_resourceGroupName    = "cus-uks-prd-ss-vmbackup-rg-01"
recovery_vault_name      = "cus-uks-prd-ss-vmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-InfaVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-InfraVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "cus-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "cus-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_av_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "cus-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "cus-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_av_id02"
    policy_id             = "backup_policy_id_02"
  },
  vm3 = {
    recovery_vault_name   = "cus-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "cus-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_sccm_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm4 = {
    recovery_vault_name   = "cus-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "cus-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_sccm_id02"
    policy_id             = "backup_policy_id_02"
  },
  vm5 = {
    recovery_vault_name   = "cus-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "cus-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_adds_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm6 = {
    recovery_vault_name   = "cus-uks-prd-ss-vmbackup-rsv-01"
    rsv_resourceGroupName = "cus-uks-prd-ss-vmbackup-rg-01"
    vm_id                 = "source_adds_id02"
    policy_id             = "backup_policy_id_02"
  }
}
