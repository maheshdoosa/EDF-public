environment                     = "High Secured Managed"
lzAVDavVmRgName                 = "gen-uks-prd-hs-av-rg-01"
lzAVDavVmResourceLocation       = "uksouth"
AVDavSubnetName                 = "gen-uks-prd-hs-av-snet-01"
lzAVDVnetName                   = "gen-uks-prd-hs-mgmt-vnet-01"
lzAVDVnetRgName                 = "gen-uks-prd-hs-mgmt-vnet-rg-01"
AVDKvName                       = "gen-uks-prd-hs-ade-kv-02"
AVDKvRgName                     = "gen-uks-prd-hs-ade-rg-01"
storageAccountName              = "genuksprdhsauxscripts"
saContainerName                 = "scripts"
EncryptionOperation             = "EnableEncryption"
KeyEncryptionAlgorithm          = "RSA-OAEP"
bootDiagLogStorageAccountRgName = "gen-uks-prd-hs-vmlogs-rg-01"
bootDiagLogStorageAccountName   = "genuksprdhsvmlogssa02"
VolumeType                      = "All"
gbRegionXmlFilePath             = "https://genuksprdhsauxscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath               = "https://genuksprdhsauxscripts.blob.core.windows.net/scripts/PrepareVM.ps1"
lzAVDzone01                     = ["1"]
lzAVDzone02                     = ["2"]
AVDmanagedHsSecretsKvName       = "avmgenprdhsmgmtsub01kv"
AVDmanagedHsSecretsKvRgName     = ".security"
########################### AVD AV VM Data Disk ######################################

lzAVDavVmRgLocation = "UK South"
lzAVDav01Vm         = "guksprdhsavmg01"
lzAVDav02Vm         = "guksprdhsavmg02"

av01NicName     = "guksprdhsavmg01-nic-01"
av02NicName     = "guksprdhsavmg02-nic-01"
nicIpConfigav01 = "guksprdhsavmg01-nic-01-config"
nicIpConfigav02 = "guksprdhsavmg02-nic-01-config"
nicipNameav01   = "guksprdhsavmg01-nic-01-ipname"
nicipNameav02   = "guksprdhsavmg02-nic-01-ipname"
#av01vmName = "guksprdhsavmg01"
#av02vmName = "guksprdhsavmg02"
vmav01osDiskName = "guksprdhsavmg01-osdisk"
vmav02osDiskName = "guksprdhsavmg02-osdisk"

lzAVDav01Vmdatadisk01          = "guksprdhsavmg01-datadisk-01"
lzAVDav01Vmdatadisk02          = "guksprdhsavmg01-datadisk-02"
lzAVDav01Vmdatadisk03          = "guksprdhsavmg01-datadisk-03"
lzAVDav02Vmdatadisk01          = "guksprdhsavmg02-datadisk-01"
lzAVDav02Vmdatadisk02          = "guksprdhsavmg02-datadisk-02"
lzAVDav02Vmdatadisk03          = "guksprdhsavmg02-datadisk-03"
storage_account_type           = "Standard_LRS"
lzAVDav01Vmdatadisk01size      = "128"
lzAVDav01Vmdatadisk02size      = "128"
lzAVDav01Vmdatadisk03size      = "16"
lzAVDav02Vmdatadisk01size      = "128"
lzAVDav02Vmdatadisk02size      = "128"
lzAVDav02Vmdatadisk03size      = "16"
create_option                  = "Empty"
lzAVDav01Vmdatadisk01LunNumber = "1"
lzAVDav01Vmdatadisk02LunNumber = "2"
lzAVDav01Vmdatadisk03LunNumber = "3"
lzAVDav02Vmdatadisk01LunNumber = "1"
lzAVDav02Vmdatadisk02LunNumber = "2"
lzAVDav02Vmdatadisk03LunNumber = "3"
caching                        = "ReadWrite"

################################## AVD SCCM VM #################################################

lzAVDSccmVmRgName           = "gen-uks-prd-hs-sccm-rg-01"
lzAVDSccmVmResourceLocation = "UK South"
AVDSccmSubnetName           = "gen-uks-prd-hs-sccm-snet-01"
lzAVDSccm01Vm               = "guksprdhssccm01"
lzAVDSccm02Vm               = "guksprdhssccm02"

sccm01NicName      = "guksprdhssccm01-nic-01"
sccm02NicName      = "guksprdhssccm02-nic-01"
nicIpConfigsccm01  = "guksprdhssccm01-nic-01-config"
nicIpConfigsccm02  = "guksprdhssccm02-nic-01-config"
nicipNamesccm01    = "guksprdhssccm01-nic-01-ipname"
nicipNamesccm02    = "guksprdhssccm02-nic-01-ipname"
vmsccm01osDiskName = "guksprdhssccm01-osdisk"
vmsccm02osDiskName = "guksprdhssccm02-osdisk"
#sccm01vmName = "guksprdhssccm01"
#sccm02vmName = "guksprdhssccm02"

lzAVDSccm01Vmdatadisk01          = "guksprdhssccm01-datadisk-01"
lzAVDSccm01Vmdatadisk02          = "guksprdhssccm01-datadisk-02"
lzAVDSccm01Vmdatadisk03          = "guksprdhssccm01-datadisk-03"
lzAVDSccm02Vmdatadisk01          = "guksprdhssccm02-datadisk-01"
lzAVDSccm02Vmdatadisk02          = "guksprdhssccm02-datadisk-02"
lzAVDSccm02Vmdatadisk03          = "guksprdhssccm02-datadisk-03"
lzAVDSccm01Vmdatadisk01size      = "128"
lzAVDSccm01Vmdatadisk02size      = "128"
lzAVDSccm01Vmdatadisk03size      = "16"
lzAVDSccm02Vmdatadisk01size      = "128"
lzAVDSccm02Vmdatadisk02size      = "128"
lzAVDSccm02Vmdatadisk03size      = "16"
lzAVDSccm01Vmdatadisk01LunNumber = "1"
lzAVDSccm01Vmdatadisk02LunNumber = "2"
lzAVDSccm01Vmdatadisk03LunNumber = "3"
lzAVDSccm02Vmdatadisk01LunNumber = "1"
lzAVDSccm02Vmdatadisk02LunNumber = "2"
lzAVDSccm02Vmdatadisk03LunNumber = "3"

################################## AVD adds VM #################################################

lzAVDaddsVmRgName           = "gen-uks-prd-hs-adds-rg-01"
lzAVDaddsVmResourceLocation = "UK South"
AVDaddsSubnetName           = "gen-uks-prd-hs-adds-snet-01"
lzAVDadds01Vm               = "guksprdhsadds01"
lzAVDadds02Vm               = "guksprdhsadds02"

adds01NicName      = "guksprdhsadds01-nic-01"
adds02NicName      = "guksprdhsadds02-nic-01"
nicIpConfigadds01  = "guksprdhsadds01-nic-01-config"
nicIpConfigadds02  = "guksprdhsadds02-nic-01-config"
nicipNameadds01    = "guksprdhsadds01-nic-01-ipname"
nicipNameadds02    = "guksprdhsadds02-nic-01-ipname"
vmadds01osDiskName = "guksprdhsadds01-osdisk"
vmadds02osDiskName = "guksprdhsadds02-osdisk"
#adds01vmName = "guksprdhsadds01"
#adds02vmName = "guksprdhsadds02"

lzAVDadds01Vmdatadisk01          = "guksprdhsadds01-datadisk-01"
lzAVDadds01Vmdatadisk02          = "guksprdhsadds01-datadisk-02"
lzAVDadds01Vmdatadisk03          = "guksprdhsadds01-datadisk-03"
lzAVDadds02Vmdatadisk01          = "guksprdhsadds02-datadisk-01"
lzAVDadds02Vmdatadisk02          = "guksprdhsadds02-datadisk-02"
lzAVDadds02Vmdatadisk03          = "guksprdhsadds02-datadisk-03"
lzAVDadds01Vmdatadisk01size      = "16"
lzAVDadds01Vmdatadisk02size      = "8"
lzAVDadds01Vmdatadisk03size      = "16"
lzAVDadds02Vmdatadisk01size      = "16"
lzAVDadds02Vmdatadisk02size      = "8"
lzAVDadds02Vmdatadisk03size      = "16"
lzAVDadds01Vmdatadisk01LunNumber = "1"
lzAVDadds01Vmdatadisk02LunNumber = "2"
lzAVDadds01Vmdatadisk03LunNumber = "3"
lzAVDadds02Vmdatadisk01LunNumber = "1"
lzAVDadds02Vmdatadisk02LunNumber = "2"
lzAVDadds02Vmdatadisk03LunNumber = "3"

################################## AVD WSUS VM #################################################

lzAVDwsusVmRgName           = "gen-uks-prd-hs-wsus-rg-01"
lzAVDwsusVmResourceLocation = "UK South"
AVDwsusSubnetName           = "gen-uks-prd-hs-wsus-snet-01"
lzAVDwsus01Vm               = "guksprdhswsus01"
wsus01NicName               = "guksprdhswsus01-nic-01"
nicIpConfigwsus01           = "guksprdhswsus01-nic-01-config"
nicipNamewsus01             = "guksprdhswsus01-nic-01-ipname"
vmwsus01osDiskName          = "guksprdhswsus01-osdisk"
wsus01vmName                = "guksprdhswsus01"
vmstorageDiskName           = "guksprdhswsus01-datadisk-01"


################################## AVD Trend Micro Relay Server 1 VM #################################################

TmrVnetName                       = "gen-uks-prd-hs-mgmt-vnet-02"
TmrVnetRgName                     = "gen-uks-prd-hs-mgmt-vnet-rg-02"
lztmrVmRgName                     = "gen-uks-prd-hs-tmr-rg-01"
lztmrVmResourceLocation           = "UK South"
tmrSubnetName                     = "gen-uks-prd-hs-tmr-snet-01"
lztmr01Vm                         = "guksprdhstmr01"
tmr01NicName                      = "guksprdhstmr01-nic-01"
nicIpConfigtmr01                  = "guksprdhstmr01-nic-01-config"
nicipNametmr01                    = "guksprdhstmr01-nic-01-ipname"
vmtmr01osDiskName                 = "guksprdhstmr01-osdisk"
tmr01vmName                       = "guksprdhstmr01"
tmrstorageDiskName1               = "guksprdhstmr01-datadisk-01"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
ImageRGname                       = "eit-uks-alz-hs-imagebuild-rg"
Imagegalleryname                  = "eituksalzhsimagebuild01"
Imagename                         = "Windows2019"
ImageVersion                      = "1.0.2022040715"
tmr01vmsize                       = "Standard_D2_V3"


################################## AVD Trend Micro Relay Server 2 VM #################################################

# lztmrVmRgName           = "gen-uks-prd-hs-tmr-rg-01"
# lztmrVmResourceLocation = "UK South"
# tmrSubnetName           = "gen-uks-prd-hs-tmr-snet-01"
lztmr02Vm           = "guksprdhstmr02"
tmr02NicName        = "guksprdhstmr02-nic-01"
nicIpConfigtmr02    = "guksprdhstmr02-nic-01-config"
nicipNametmr02      = "guksprdhstmr02-nic-01-ipname"
vmtmr02osDiskName   = "guksprdhstmr02-osdisk"
tmr02vmName         = "guksprdhstmr02"
tmrstorageDiskName2 = "guksprdhstmr02-datadisk-01"
# enable_nic_ip_forwarding             = "false"
# enable_nic_accelerated_networking    = "true"
ImageRGnamevm2      = "eit-uks-alz-hs-imagebuild-rg"
Imagegallerynamevm2 = "eituksalzhsimagebuild01"
Imagenamevm2        = "Windows2019"
ImageVersionvm2     = "1.0.2022040715"
tmr02vmsize         = "Standard_D2_V3"


######### VM backup #################
rsv_resourceGroupName    = "gen-uks-prd-hs-vmbackup-rg-01"
recovery_vault_name      = "gen-uks-prd-hs-vmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-InfaVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-InfraVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_av_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_av_id02"
    policy_id             = "backup_policy_id_02"
  },
  vm3 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_sccm_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm4 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_sccm_id02"
    policy_id             = "backup_policy_id_02"
  },
  vm5 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_adds_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm6 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_adds_id02"
    policy_id             = "backup_policy_id_02"
  },
  vm7 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_wsus_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm8 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_trmvm_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm9 = {
    recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-prd-hs-vmbackup-rg-01"
    vm_id                 = "source_trmvm_id02"
    policy_id             = "backup_policy_id_02"
  }
}
diagsettingnic = [
  {
    nicname = "guksprdhsavmg01-nic-01",
    rg      = "gen-uks-prd-hs-av-rg-01"
  },
  {
    nicname = "guksprdhsavmg02-nic-01",
    rg      = "gen-uks-prd-hs-av-rg-01"
  },
  {
    nicname = "guksprdhssccm01-nic-01",
    rg      = "gen-uks-prd-hs-sccm-rg-01"
  },
  {
    nicname = "guksprdhssccm02-nic-01",
    rg      = "gen-uks-prd-hs-sccm-rg-01"
  },
  {
    nicname = "guksprdhsadds01-nic-01",
    rg      = "gen-uks-prd-hs-adds-rg-01"
  },
  {
    nicname = "guksprdhsadds02-nic-01",
    rg      = "gen-uks-prd-hs-adds-rg-01"
  },
  {
    nicname = "guksprdhswsus01-nic-01",
    rg      = "gen-uks-prd-hs-wsus-rg-01"
  },
  {
    nicname = "guksprdhstmr01-nic-01",
    rg      = "gen-uks-prd-hs-tmr-rg-01"
  },
  {
    nicname = "guksprdhstmr02-nic-01",
    rg      = "gen-uks-prd-hs-tmr-rg-01"
  }
]
