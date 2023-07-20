environment                     = "High Secured Managed"
dtgwVmRgName                    = "gen-uks-dev-hs-managed-datagw-rg-01"
dtgwVmResourceLocation          = "uksouth"
dtgwSubnetName                  = "gen-uks-dev-hs-datagw-snet-01"
dtgwvnetName                    = "gen-uks-dev-hs-managed-vnet-01"
dtgwVnetRgName                  = "gen-uks-dev-hs-managed-vnet-rg-01"
ADEKvName                       = "gen-uks-dev-hs-ade-kv-01"
ADEKvRgName                     = "gen-uks-dev-hs-ade-rg-01"
storageAccountName              = "genuksuathsauxscript"
saContainerName                 = "scripts"
EncryptionOperation             = "EnableEncryption"
KeyEncryptionAlgorithm          = "RSA-OAEP"
bootDiagLogStorageAccountRgName = "gen-uks-dev-hs-vmlogs-rg-01" //Need to change in prod
bootDiagLogStorageAccountName   = "genuksdevhsvmlogssa02"
VolumeType                      = "All"
gbRegionXmlFilePath             = "https://genuksuathsauxscript.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath               = "https://genuksuathsauxscript.blob.core.windows.net/scripts/PrepareVM.ps1"

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"
lapsFilePath = "https://genuksuathsauxscript.blob.core.windows.net/scripts/LAPS.x64.msi"
KvName       = "avmgentsthsmngdsub01kv"
KvRgName     = ".security"
########################### VM NIC ######################################

lzAVDavVmRgLocation = "UK South"
dtgw01Vm            = "gukshsdevdtgw01"
dtgw02Vm            = "gukshsdevdtgw02"

dtgwvm01          = "gukshsdevdtgw01-nic-01"
dtgwvm02          = "gukshsdevdtgw02-nic-01"
nicIpConfigdtgw01 = "gukshsdevdtgw01-nic-01-config"
nicIpConfigdtgw02 = "gukshsdevdtgw02-nic-01-config"
nicipNamedtgw01   = "gukshsdevdtgw01-nic-01-ipname"
nicipNamedtgw02   = "gukshsdevdtgw02-nic-01-ipname"
#av01vmName = "guksprdhsavmg01"
#av02vmName = "gukshsdevdtgw02"
dtgw01osDiskName = "gukshsdevdtgw01-osdisk"
dtgw02osDiskName = "gukshsdevdtgw02-osdisk"

###### Disk Part

dtgw01Vmdatadisk01          = "gukshsdevdtgw01-datadisk"
dtgw02Vmdatadisk01          = "gukshsdevdtgw02-datadisk-01"
storage_account_type        = "Standard_LRS"
dtgw01Vmdatadisk01size      = "64"
dtgw02Vmdatadisk01size      = "64"
create_option               = "Empty"
dtgw01Vmdatadisk01LunNumber = "1"
dtgw02Vmdatadisk01LunNumber = "1"
caching                     = "ReadWrite"


IaaSAntiMalware = <<SETTINGS
            {
                "AntimalwareEnabled": true,
                "RealtimeProtectionEnabled": "true",
                "ScheduledScanSettings": {
                "isEnabled": "false",
                "day": "1",
                "time": "180",
                "scanType": "Full"
                },
                "Exclusions": {
                    "Extensions": "",
                    "Paths": "%allusersprofile%\\NTUser.pol;%systemroot%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb",
                    "Processes": ""
                }
            }
            SETTINGS


########### RSV

rsv_resourceGroupName    = "gen-uks-dev-hs-dtgw-vmbackup-01"
recovery_vault_name      = "gen-uks-dev-hs-dtgw-vmbackup-rsv-01"
infraVM_backup_policy    = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-dev-hs-dtgw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-dev-hs-dtgw-vmbackup-01"
    vm_id                 = "source_av_id01"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-dev-hs-dtgw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-dev-hs-dtgw-vmbackup-01"
    vm_id                 = "source_av_id02"
    policy_id             = "backup_policy_id_02"
  }
}
diagsettingnic = [
  {
    nicname = "gukshsdevdtgw01-nic-01",
    rg      = "gen-uks-dev-hs-managed-datagw-rg-01"
  },
  {
    nicname = "gukshsdevdtgw02-nic-01",
    rg      = "gen-uks-dev-hs-managed-datagw-rg-01"
  }
]
