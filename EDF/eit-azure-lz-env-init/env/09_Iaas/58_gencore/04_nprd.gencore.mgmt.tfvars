environment                     = "High Secured Managed"
lzAVDavVmRgName                 = "gen-uks-np-hs-av-rg-01"
lzAVDavVmResourceLocation       = "uksouth"
AVDavSubnetName                 = "gen-uks-np-hs-av-snet-01"
lzAVDVnetName                   = "gen-uks-np-hs-mgmt-vnet-01"
lzAVDVnetRgName                 = "gen-uks-np-hs-mgmt-vnet-rg-01"
AVDKvName                       = "gen-uks-np-hs-ade-kv-01"
AVDKvRgName                     = "gen-uks-np-hs-ade-rg-01"
storageAccountName              = "genuksnphsauxscripts"
saContainerName                 = "scripts"
EncryptionOperation             = "EnableEncryption"
KeyEncryptionAlgorithm          = "RSA-OAEP"
bootDiagLogStorageAccountRgName = "gen-uks-np-hs-vmlogs-rg-01"
bootDiagLogStorageAccountName   = "genuksnphsvmlogssa01"
VolumeType                      = "All"
gbRegionXmlFilePath             = "https://genuksnphsauxscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath               = "https://genuksnphsauxscripts.blob.core.windows.net/scripts/PrepareVM.ps1"
lzAVDzone01                     = ["1"]
lzAVDzone02                     = ["2"]
AVDmanagedHsSecretsKvName       = "avmgennphsmgmtsub01kv"
AVDmanagedHsSecretsKvRgName     = ".security"
########################### AVD AV VM Data Disk ######################################

lzAVDavVmRgLocation = "UK South"
lzAVDav01Vm         = "guksnphsavmgt01"
lzAVDav02Vm         = "guksnphsavmgt02"

av01NicName     = "guksnphsavmgt01-nic-01"
av02NicName     = "guksnphsavmgt02-nic-01"
nicIpConfigav01 = "guksnphsavmgt01-nic-01-config"
nicIpConfigav02 = "guksnphsavmgt02-nic-01-config"
nicipNameav01   = "guksnphsavmgt01-nic-01-ipname"
nicipNameav02   = "guksnphsavmgt02-nic-01-ipname"
#av01vmName = "guksnphsavmgmt01"
#av02vmName = "guksnphsavmgmt02"
vmav01osDiskName = "guksnphsavmgmt01-osdisk"
vmav02osDiskName = "guksnphsavmgmt02-osdisk"

lzAVDav01Vmdatadisk01          = "guksnphsavmgmt01-datadisk-01"
lzAVDav01Vmdatadisk02          = "guksnphsavmgmt01-datadisk-02"
lzAVDav01Vmdatadisk03          = "guksnphsavmgmt01-datadisk-03"
lzAVDav02Vmdatadisk01          = "guksnphsavmgmt02-datadisk-01"
lzAVDav02Vmdatadisk02          = "guksnphsavmgmt02-datadisk-02"
lzAVDav02Vmdatadisk03          = "guksnphsavmgmt02-datadisk-03"
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

lzAVDSccmVmRgName           = "gen-uks-np-hs-sccm-rg-01"
lzAVDSccmVmResourceLocation = "UK South"
AVDSccmSubnetName           = "gen-uks-np-hs-sccm-snet-01"
lzAVDSccm01Vm               = "guksnphssccm01"
lzAVDSccm02Vm               = "guksnphssccm02"

sccm01NicName      = "guksnphssccm01-nic-01"
sccm02NicName      = "guksnphssccm02-nic-01"
nicIpConfigsccm01  = "guksnphssccm01-nic-01-config"
nicIpConfigsccm02  = "guksnphssccm02-nic-01-config"
nicipNamesccm01    = "guksnphssccm01-nic-01-ipname"
nicipNamesccm02    = "guksnphssccm02-nic-01-ipname"
vmsccm01osDiskName = "guksnphssccm01-osdisk"
vmsccm02osDiskName = "guksnphssccm02-osdisk"
#sccm01vmName = "guksnphssccm01"
#sccm02vmName = "guksnphssccm02"

lzAVDSccm01Vmdatadisk01          = "guksnphssccm01-datadisk-01"
lzAVDSccm01Vmdatadisk02          = "guksnphssccm01-datadisk-02"
lzAVDSccm01Vmdatadisk03          = "guksnphssccm01-datadisk-03"
lzAVDSccm02Vmdatadisk01          = "guksnphssccm02-datadisk-01"
lzAVDSccm02Vmdatadisk02          = "guksnphssccm02-datadisk-02"
lzAVDSccm02Vmdatadisk03          = "guksnphssccm02-datadisk-03"
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

lzAVDaddsVmRgName           = "gen-uks-np-hs-adds-rg-01"
lzAVDaddsVmResourceLocation = "UK South"
AVDaddsSubnetName           = "gen-uks-np-hs-adds-snet-01"


adds03NicName                    = "gukspphsadds01-nic-01"
nicIpConfigadds03                = "gukspphsadds01-nic-01-config"
nicipNameadds03                  = "gukspphsadds01-nic-01-ipname"
lzAVDadds03Vm                    = "gukspphsadds01"
vmadds03osDiskName               = "gukspphsadds01-osdisk"
lzAVDadds03Vmdatadisk01size      = "16"
lzAVDadds03Vmdatadisk01          = "gukspphsadds01-datadisk-01"
lzAVDadds03Vmdatadisk01LunNumber = "1"
lzAVDadds03Vmdatadisk02size      = "8"
lzAVDadds03Vmdatadisk02          = "gukspphsadds01-datadisk-02"
lzAVDadds03Vmdatadisk02LunNumber = "2"
lzAVDadds03Vmdatadisk03size      = "16"
lzAVDadds03Vmdatadisk03          = "gukspphsadds01-datadisk-03"
lzAVDadds03Vmdatadisk03LunNumber = "3"

adds04NicName                    = "gukspphsadds02-nic-01"
nicIpConfigadds04                = "gukspphsadds02-nic-01-config"
nicipNameadds04                  = "gukspphsadds02-nic-01-ipname"
lzAVDadds04Vm                    = "gukspphsadds02"
vmadds04osDiskName               = "gukspphsadds02-osdisk"
lzAVDadds04Vmdatadisk01size      = "16"
lzAVDadds04Vmdatadisk01          = "gukspphsadds02-datadisk-01"
lzAVDadds04Vmdatadisk01LunNumber = "1"
lzAVDadds04Vmdatadisk02size      = "8"
lzAVDadds04Vmdatadisk02          = "gukspphsadds02-datadisk-02"
lzAVDadds04Vmdatadisk02LunNumber = "2"
lzAVDadds04Vmdatadisk03size      = "16"
lzAVDadds04Vmdatadisk03          = "gukspphsadds02-datadisk-03"
lzAVDadds04Vmdatadisk03LunNumber = "3"

################################## AVD WSUS VM #################################################

lzAVDwsusVmRgName           = "gen-uks-np-hs-wsus-rg-01"
lzAVDwsusVmResourceLocation = "UK South"
AVDwsusSubnetName           = "gen-uks-np-hs-wsus-snet-01"
lzAVDwsus01Vm               = "guksnphswsus01"
wsus01NicName               = "guksnphswsus01-nic-01"
nicIpConfigwsus01           = "guksnphswsus01-nic-01-config"
nicipNamewsus01             = "guksnphswsus01-nic-01-ipname"
vmwsus01osDiskName          = "guksnphswsus01-osdisk"
wsus01vmName                = "guksnphswsus01"
vmstorageDiskName           = "guksprdhswsus01-datadisk-01"


######### VM backup #################
rsv_resourceGroupName    = "gen-uks-np-hs-vmbackup-rg-01"
recovery_vault_name      = "gen-uks-np-hs-vmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-InfaVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-InfraVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_av_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_av_id02"
    policy_id             = "backup_policy_id_02"
  },
  vm3 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_sccm_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm4 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_sccm_id02"
    policy_id             = "backup_policy_id_02"
  },
  # vm5 = {
  #   recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
  #   rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
  #   vm_id                 = "source_adds_id01"
  #   policy_id             = "backup_policy_id_01"
  # },
  # vm6 = {
  #   recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
  #   rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
  #   vm_id                 = "source_adds_id02"
  #   policy_id             = "backup_policy_id_02"
  # },
  vm7 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_wsus_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm8 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_adds_id03"
    policy_id             = "backup_policy_id_01"
  },
  vm9 = {
    recovery_vault_name   = "gen-uks-np-hs-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-np-hs-vmbackup-rg-01"
    vm_id                 = "source_adds_id04"
    policy_id             = "backup_policy_id_02"
  }
}
diagsettingnic = [
  {
    nicname = "guksnphsavmgt01-nic-01",
    rg      = "gen-uks-np-hs-av-rg-01"
  },
  {
    nicname = "guksnphsavmgt02-nic-01",
    rg      = "gen-uks-np-hs-av-rg-01"
  },
  {
    nicname = "guksnphssccm01-nic-01",
    rg      = "gen-uks-np-hs-sccm-rg-01"
  },
  {
    nicname = "guksnphssccm02-nic-01",
    rg      = "gen-uks-np-hs-sccm-rg-01"
  },
  {
    nicname = "guksnphswsus01-nic-01",
    rg      = "gen-uks-np-hs-wsus-rg-01"
  },
  {
    nicname = "gukspphsadds01-nic-01",
    rg      = "gen-uks-np-hs-adds-rg-01"
  },
  {
    nicname = "gukspphsadds02-nic-01",
    rg      = "gen-uks-np-hs-adds-rg-01"
  }
]
