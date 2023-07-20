################ Common TFVARS  ################

MDWHs-Tst-environment = "High Secured MDW"
MDWHsResourceLocation = "UK South"
prjKvName             = "avmgendevhsmdwsub01kv"
prjKvRgName           = ".security"

MDWHsTstkv   = "g-uks-tst-hs-mdw-ade-kv"
MDWHsTstkvrg = "gen-uks-tst-hs-mdw-ade-rg-01"

auxScriptsSA        = "genukststhsmdwauxsa01"
auxContainerName    = "scripts"
gbRegionXmlFilePath = "https://genukststhsmdwauxsa01.blob.core.windows.net/scripts/GBRegion.xml"  #needs to be updated post the script storage account
prepVmPs1FilePath   = "https://genukststhsmdwauxsa01.blob.core.windows.net/scripts/PrepareVM.ps1" #needs to be updated post the script storage account
lapsFilePath        = "https://genukststhsmdwauxsa01.blob.core.windows.net/scripts/LAPS.x64.msi"
ouPath              = "OU=Application,OU=Azure UKS,OU=EDF Servers,DC=edf-hs,DC=com"

########## Azure Disk Encryption ############

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"

################### Test AppVM01 TFVARS   ###################

MDWHsTstVmRgName                  = "data-uks-prd-del-tst-rg-01"
MDWHsTstAppVM01                   = "gukststhmdboa01"
MDWHsTstAppVM01nicName            = "gukststhmdboa01-nic-01"
MDWHsTstAppVM01nicIpConfigName    = "gukststhmdboa01-nic-01-config"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "false"
MDWHsTstNetworkingRgName          = "data-uks-dev-vnet-tst-rg-01"
MDWHsTstVnetName                  = "gen-uks-dev-hs-mdw-vnet-tst-01"
MDWHsTstSubnetName                = "gen-uks-dev-hs-mdw-snet-tst-del"
TstAppVM01OSDiskName              = "gukststhmdboa01-osdisk"
TstAppvm01storageDiskName         = "gukststhmdboa01-datadisk"


mdwhsTstbootDiagLogStName   = "genukststhsmdvmlogsa01"
mdwhsTstbootDiagLogStRgName = "gen-uks-tst-hs-mdw-vmlogs-rg-01"


############ VM Backup ###########
MDWHsTstRSVName   = "gen-uks-Test-hs-mdw-vmbackup-rsv-01"
MDWHsTstRSVRgName = "gen-uks-hs-Test-mdw-vmbackup-rg-01"

MDWHs_infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
MDWHs_infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"

vm_name = {
  vm1 = {
    recovery_vault_name   = "gen-uks-Test-hs-mdw-vmbackup-rsv-01"
    rsv_resourceGroupName = "gen-uks-hs-Test-mdw-vmbackup-rg-01"
    vm_id                 = "source_vm_id_01"
    policy_id             = "backup_policy_id_01"
  }
}
diagsettingnic = [
  {
    nicname = "gukststhmdboa01-nic-01",
    rg      = "data-uks-prd-del-tst-rg-01"
  }
]


mdw_dev_bastion_rg_name   = "data-uks-dev-mgt-dev-rg-01"
mdw_tst_bastion_rg_name   = "data-uks-dev-mgt-tst-rg-01"
mdw-dev-bastion_pip_name  = "devbastionpubip"
mdw-tst-bastion_pip_name  = "tstbastionpubip"
mdw_dev_bastion_host_name = "gen-dev-hs-mdw-bst"
mdw_tst_bastion_host_name = "gen-tst-hs-mdw-bst"
mdw_bastion_host_ipname   = "configuration"
mdw_bastion_pip_sku       = "Standard"
mdw_dev_bastion_diag_name = "gen-dev-hs-mdw-bst-diag"
mdw_tst_bastion_diag_name = "gen-tst-hs-mdw-bst-diag"
MDWHsDevBastionSubnetName = "AzureBastionSubnet"
MDWHsDevVnetName          = "gen-uks-dev-hs-mdw-vnet-dev-01"
MDWHsDevNetworkingRgName  = "data-uks-dev-vnet-dev-rg-01"
MDWHsTstBastionSubnetName = "AzureBastionSubnet"

########### MDW Dev VM Import ##########

MDWHs-Dev-environment            = "High Secured MDW"
MDWHsDevkv                       = "gen-uks-dev-hs-ade-kv"
MDWHsDevkvrg                     = "data-uks-dev-mgt-dev-rg-01"
MDWHsDevVM01SubnetName           = "gen-uks-dev-hs-mdw-snet-dev-del"
MDWHsDevVM02SubnetName           = "gen-uks-dev-hs-mdw-snet-dev-acq"
MDWHsTstVM02SubnetName           = "gen-uks-dev-hs-mdw-snet-tst-acq"
MDWHsDevVmRgName                 = "data-uks-dev-del-dev-rg-01"
MDWHsDevVm02RgName               = "data-uks-dev-acq-dev-rg-01"
MDWHsTstVm02RgName               = "data-uks-dev-acq-tst-rg-01"
MDWHsDevVM01nicName              = "devbizobjectsnic"
MDWHsDevVM02nicName              = "devdatafactorynic"
MDWHsTstVM02nicName              = "tstdatafactorynic"
enable_nic_accelerate_networking = "false"
MDWHsDevVM01nicIpConfigName      = "devbizobjectsnicconf"
MDWHsDevVM02nicIpConfigName      = "devdatafactorynicconf"
MDWHsTstVM02nicIpConfigName      = "tstdatafactorynicconf"
MDWHsDevVM01                     = "guksdvhmdwboa01"
MDWHsDevVM02                     = "guksdvhmdwirt01"
MDWHsTstVM02                     = "gukstshmdwirt01"
DevVM01OSDiskName                = "guksdvhmdwboa01_OsDisk_1_c3a7395f77734406807327691a672423"
DevVM02OSDiskName                = "guksdvhmdwirt01_OsDisk_1_1e705c2281554d75aedeaed0e85a01d5"
TstVM02OSDiskName                = "gukstshmdwirt01_OsDisk_1_8768701853f44435851b2dd3e22972c3"
prepVm01Ps1FilePath              = "https://genukststhsmdwauxsa01.blob.core.windows.net/scripts/PrepareVM-01.ps1"
MDWHsDevrsv_name                 = "gen-dev-hs-mdw-rsv"
MDWHsDevrsv_rg_name              = "data-uks-dev-mgt-dev-rg-01"
