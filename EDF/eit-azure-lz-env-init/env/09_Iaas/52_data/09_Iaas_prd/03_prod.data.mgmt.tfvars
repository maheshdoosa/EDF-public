################ Common TFVARS  ################

MDWHs-Prd-environment = "High Secured MDW"
MDWHs-Uat-environment = "High Secured MDW"
MDWHsResourceLocation = "UK South"

prjKvName   = "avmgenprdhsmdwsub01kv"
prjKvRgName = ".security"

MDWHsprdkv   = "g-uks-prd-hs-mdw-ade-kv"
MDWHsprdkvrg = "gen-uks-prd-hs-mdw-ade-rg-01"

MDWHsUatkv   = "g-uks-uat-hs-bo-ade-kv"
MDWHsUatkvrg = "gen-uks-uat-hs-mdw-ade-rg-01"

auxScriptsSA        = "genuksprdhsmdwauxsa01"
auxContainerName    = "scripts"
gbRegionXmlFilePath = "https://genuksprdhsmdwauxsa01.blob.core.windows.net/scripts/GBRegion.xml"  #needs to be updated post the script storage account
prepVmPs1FilePath   = "https://genuksprdhsmdwauxsa01.blob.core.windows.net/scripts/PrepareVM.ps1" #needs to be updated post the script storage account

ouPath       = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com" #"OU=PKI,DC=edftest,DC=local"
lapsFilePath = "https://genuksprdhsmdwauxsa01.blob.core.windows.net/scripts/LAPS.x64.msi"
########## Azure Disk Encryption ############

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"

################### PROD WebVM01 TFVARS   ###################

MDWHsPrdVmRgName                  = "data-uks-prd-del-prd-rg-01"
MDWHsPrdWebVM01                   = "guksprdhmdbow01"
MDWHsPrdWebVM01nicName            = "guksprdhmdbow01-nic-01"
MDWHsPrdWebVM01nicIpConfigName    = "guksprdhmdbow01-nic-01-config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"
MDWHsPrdNetworkingRgName          = "data-uks-prd-vnet-prd-rg-01"
MDWHsPrdVnetName                  = "gen-uks-prd-hs-mdw-vnet-prd-01"
MDWHsPrdSubnetName                = "gen-uks-prd-hs-mdw-snet-prd-del"
WebVM01OSDiskName                 = "guksprdhmdbow01-osdisk"
Webvm01storageDiskName            = "guksprdhmdbow01-datadisk"


mdwhsprdbootDiagLogStName   = "genuksprdhsmdvmlogsa01"
mdwhsprdbootDiagLogStRgName = "gen-uks-prd-hs-mdw-vmlogs-rg-01"

################### Prod AppVM01 TFVARS   ###################

MDWHsPrdAppVM01                = "guksprdhmdboa01"
MDWHsPrdAppVM01nicName         = "guksprdhmdboa01-nic-01"
MDWHsPrdAppVM01nicIpConfigName = "guksprdhmdboa01-nic-01-config"
AppVM01OSDiskName              = "guksprdhmdboa01-osdisk"
Appvm01storageDiskName         = "guksprdhmdboa01-datadisk"

################### Prod AppVM02 TFVARS   ###################

MDWHsPrdAppVM02                = "guksprdhmdboa02"
MDWHsPrdAppVM02nicName         = "guksprdhmdboa02-nic-01"
MDWHsPrdAppVM02nicIpConfigName = "guksprdhmdboa02-nic-01-config"
AppVM02OSDiskName              = "guksprdhmdboa02-osdisk"
Appvm02storageDiskName         = "guksprdhmdboa02-datadisk"


################### UAT WebVM01 TFVARS   ###################

MDWHsUatVmRgName                      = "data-uks-prd-del-uat-rg-01"
MDWHsUatWebVM01                       = "guksuathmdbow01"
MDWHsUatWebVM01nicName                = "guksuathmdbow01-nic-01"
MDWHsUatWebVM01nicIpConfigName        = "guksuathmdbow01-nic-01-config"
Uat_enable_nic_ip_forwarding          = "false"
Uat_enable_nic_accelerated_networking = "true"
MDWHsUatNetworkingRgName              = "data-uks-prd-vnet-uat-rg-01"
MDWHsUatVnetName                      = "gen-uks-prd-hs-mdw-vnet-uat-01"
MDWHsUatSubnetName                    = "gen-uks-prd-hs-mdw-snet-uat-del"
UatWebVM01OSDiskName                  = "guksuathmdbow01-osdisk"
UatWebvm01storageDiskName             = "guksuathmdbow01-datadisk"


mdwhsUatbootDiagLogStName   = "genuksuathsmdvmlogsa01"
mdwhsUatbootDiagLogStRgName = "gen-uks-uat-hs-mdw-vmlogs-rg-01"

################### Prod AppVM01 TFVARS   ###################

MDWHsUatAppVM01                = "guksuathmdboa01"
MDWHsUatAppVM01nicName         = "guksuathmdboa01-nic-01"
MDWHsUatAppVM01nicIpConfigName = "guksuathmdboa01-nic-01-config"
UatAppVM01OSDiskName           = "guksuathmdboa01-osdisk"
UatAppvm01storageDiskName      = "guksuathmdboa01-datadisk"

################### Prod AppVM02 TFVARS   ###################

MDWHsUatAppVM02                = "guksuathmdboa02"
MDWHsUatAppVM02nicName         = "guksuathmdboa02-nic-01"
MDWHsUatAppVM02nicIpConfigName = "guksuathmdboa02-nic-01-config"
UatAppVM02OSDiskName           = "guksuathmdboa02-osdisk"
UatAppvm02storageDiskName      = "guksuathmdboa02-datadisk"



############ VM Backup ###########
MDWHsPrdRSVName   = "gen-uks-prd-hs-mdw-vmbackup-rsv-01"
MDWHsPrdRSVRgName = "gen-uks-hs-prd-mdw-vmbackup-rg-01"

MDWHsUatRSVName   = "gen-uks-uat-hs-mdw-vmbackup-rsv-01"
MDWHsUatRSVRgName = "gen-uks-hs-uat-mdw-vmbackup-rg-01"

MDWHs_infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
MDWHs_infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-prd-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-prd-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_01"
    policy_id             = "backup_policy_id_01"
  },
  vm2 = {
    recovery_vault_name   = "gen-uks-prd-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-prd-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_02"
    policy_id             = "backup_policy_id_01"
  },
  vm3 = {
    recovery_vault_name   = "gen-uks-prd-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-prd-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_03"
    policy_id             = "backup_policy_id_01"
  },
  vm4 = {
    recovery_vault_name   = "gen-uks-uat-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-uat-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_04"
    policy_id             = "backup_policy_id_Uat_01"
  },
  vm5 = {
    recovery_vault_name   = "gen-uks-uat-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-uat-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_05"
    policy_id             = "backup_policy_id_Uat_01"
  },
  vm6 = {
    recovery_vault_name   = "gen-uks-uat-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-uat-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_06"
    policy_id             = "backup_policy_id_Uat_01"
  }
}
diagsettingnic = [
  {
    nicname = "guksprdhmdbow01-nic-01",
    rg      = "data-uks-prd-del-prd-rg-01"
  },
  {
    nicname = "guksprdhmdboa01-nic-01",
    rg      = "data-uks-prd-del-prd-rg-01"
  },
  {
    nicname = "guksprdhmdboa02-nic-01",
    rg      = "data-uks-prd-del-prd-rg-01"
  },
  {
    nicname = "guksuathmdbow01-nic-01",
    rg      = "data-uks-prd-del-uat-rg-01"
  },
  {
    nicname = "guksuathmdboa01-nic-01",
    rg      = "data-uks-prd-del-uat-rg-01"
  },
  {
    nicname = "guksuathmdboa02-nic-01",
    rg      = "data-uks-prd-del-uat-rg-01"
  }
]

mdw_prd_bastion_rg_name   = "data-uks-prd-mgt-prd-rg-01"
mdw_uat_bastion_rg_name   = "data-uks-prd-mgt-uat-rg-01"
mdw-prd-bastion_pip_name  = "prdbastionpubip"
mdw-uat-bastion_pip_name  = "uatbastionpubip"
mdw_prd_bastion_host_name = "gen-prd-hs-mdw-bst"
mdw_uat_bastion_host_name = "gen-uat-hs-mdw-bst"
mdw_bastion_host_ipname   = "configuration"
mdw_bastion_pip_sku       = "Standard"
mdw_prd_bastion_diag_name = "gen-prd-hs-mdw-bst-diag"
mdw_uat_bastion_diag_name = "gen-uat-hs-mdw-bst"
MDWHsPrdBastionSubnetName = "AzureBastionSubnet"
MDWHsUatBastionSubnetName = "AzureBastionSubnet"

######## Importing MDW VM'S ############

MDWHsUatPrdVM04kv                = "gen-uks-uat-hs-ade-kv"
MDWHsUatPrdVM04kvrg              = "data-uks-prd-mgt-uat-rg-01"
MDWHsUatVm04Subnet               = "gen-uks-prd-hs-mdw-snet-uat-del"
MDWHsPrdVm04Subnet               = "gen-uks-prd-hs-mdw-snet-prd-acq"
MDWHsPrdVm04RgName               = "data-uks-prd-acq-prd-rg-01"
MDWHsUatVm04RgName               = "data-uks-prd-acq-uat-rg-01"
MDWHsUatVM04nicName              = "uatdatafactorynic"
MDWHsPrdVM04nicName              = "prddatafactorynic"
enable_nic_accelerate_networking = "false"
enable_nic_ip_forward            = "false"
MDWHsUatVM04nicIpConfigName      = "uatdatafactorynicconf"
MDWHsPrdVM04nicIpConfigName      = "prddatafactorynicconf"
MDWHsUatVM04                     = "guksuthmdwirt01"
MDWHsPrdVM04                     = "guksprhmdwirt01"
UatVM04OSDiskName                = "guksuthmdwirt01_OsDisk_1_78c16126bb984fcdb9aeb9a6c2d1c830"
PrdVM04OSDiskName                = "guksprhmdwirt01_OsDisk_1_db14aa2df0734feba7116a62cccba7db"
prepVm01Ps1FilePath              = "https://genuksprdhsmdwauxsa01.blob.core.windows.net/scripts/PrepareVM-01.ps1"
MDWHsUatPrdrsv_name              = "gen-prd-hs-mdw-rsv"
MDWHsUatPrdrsv_rg_name           = "data-uks-prd-mgt-prd-rg-01"
