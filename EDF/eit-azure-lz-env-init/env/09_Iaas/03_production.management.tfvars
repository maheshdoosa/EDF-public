environment = "Live"

#managementHs key vault
managementHsKvName   = "eitlzmanagementhskv"
managementHsKvRgName = ".security"

lzmanagementHsPkiRgName         = "eit-uks-alz-hs-pki-rg"
lzmanagementHsWacRgName         = "eit-uks-alz-hs-wac-rg"
lzHubManagementResourceLocation = "uksouth"
pkiSubnetName                   = "eit-alz-hs-ca-snet-01"
wacSubnetName                   = "eit-alz-hs-wac-snet-01"
lzmanagementHsVnetName          = "eit-uks-alz-hs-mgmt-vnet-01"
lzmanagementHsNetworkingRgName  = "eit-uks-alz-hs-mgmt-vnet-rg"

bootDiagLogStorageAccountName   = "eituksalzhsvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-hs-vmlogs-rg-01"

ouPath   = "OU=Infrastructure,OU=Azure UKS,OU=Servers,DC=edf-hs,DC=com"
ouPathDc = "OU=Domain Controllers,DC=edf-hs,DC=com"

IaaSAntiMalware = <<SETTINGS
            {
                "AntimalwareEnabled": "true",
                "RealtimeProtectionEnabled": "true",
                "ScheduledScanSettings": {
                "isEnabled": "false",
                "day": "7",
                "time": "120",
                "scanType": "Quick"
                },
                "Exclusions": {
                    "Extensions": "",
                    "Paths": "%allusersprofile%\\NTUser.pol;%systemroot%\\system32\\GroupPolicy\\Machine\\registry.pol;%windir%\\Security\\database\\*.chk;%windir%\\Security\\database\\*.edb;%windir%\\Security\\database\\*.jrs;%windir%\\Security\\database\\*.log;%windir%\\Security\\database\\*.sdb;%windir%\\SoftwareDistribution\\Datastore\\Datastore.edb;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb.chk;%windir%\\SoftwareDistribution\\Datastore\\Logs\\edb*.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00001.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Edbres00002.jrs;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res1.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\Res2.log;%windir%\\SoftwareDistribution\\Datastore\\Logs\\tmp.edb",
                    "Processes": ""
                }
            }
            SETTINGS

######################### AFS VM Variables #######################

lzmanagementHsAFSVmRgName = "eit-uks-alz-hs-afs-rg-01"
afshsnic01name            = "eitukhssafs01-nic-01"
nicIpConfigName           = "eitukshsafs01-nic-01-Ip-Config"
nicipName                 = "eitukshsafs01-nic-01-Ip"
afshsvm01Name             = "eitukhssafs01"
vmosDiskName              = "eitukhssafs01-osdisk"
vmstorageDiskName         = "eitukhssafs01-datadisk"

####################### AFS Networking Variables ########################
AFSSubnetName             = "eit-alz-hs-afs-snet-01"
lzmanagementHsAFSVnetName = "eit-uks-alz-hs-mgmt-vnet-01"
lzmanagementHsAFSRgName   = "eit-uks-alz-hs-mgmt-vnet-rg"

######################### VM - DC03 Variables #######################

lzmanagementHsDc03RgName = "eit-uks-alz-hs-adds-rg"
dc03vmnicName            = "eituksalzhsdc03-nic-01"
dc03vmnicIpConfigName    = "eituksalzhsdc03-nic-01-Ip-Config"
dc03vmnicipName          = "eituksalzhsdc03-nic-01-Ip"
dc03vmName               = "eituksalzhsdc03"
do03vmosDiskName         = "eituksalzhsdc03-osdisk"
dc03vmstorageDiskName    = "eituksalzhsdc03-datadisk-01"

######################### VM - DC03 Variables #######################
dc04vmnicName         = "eituksalzhsdc04-nic-01"
dc04vmnicIpConfigName = "eituksalzhsdc04-nic-01-Ip-Config"
dc04vmnicipName       = "eituksalzhsdc04-nic-01-Ip"
dc04vmName            = "eituksalzhsdc04"
do04vmosDiskName      = "eituksalzhsdc04-osdisk"
dc04vmstorageDiskName = "eituksalzhsdc04-datadisk-01"

####################### DC03 and DC04 VM's Networking Variables ########################
dcSubnetName = "eit-alz-hs-adds-snet-01"

########################### Variables for storage account ###############
storageAccountName  = "eituksalzhsauxscripts" #Verify
saContainerName     = "scripts"
gbRegionXmlFilePath = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/PrepareVM.ps1"
PrepareVMForADPath  = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/PrepareVMForAD.ps1"
lapsFilePath        = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/LAPS.x64.msi"
############################ ADE KV values ###################################
managementHsAdeKvName   = "eit-uks-alz-hs-ade-kvt"
managementHsAdeKvRgName = "eit-uks-alz-hs-ade-rg-01"
EncryptionOperation     = "EnableEncryption"
KeyEncryptionAlgorithm  = "RSA-OAEP"
VolumeType              = "All"

########################### Backup #####################
rsv_resourceGroupName    = "eit-uks-alz-hs-vmbackup-rg"
recovery_vault_name      = "eit-uks-alz-hs-vmbackup-rsv-01"
recovery_vault_name_02   = "eit-uks-alz-hs-vmbackup-rsv-02"
infraVM_backup_policy    = "Daily-2200-52W-InfraVM"
infraVM_backup_policy_01 = "Daily-2300-52W-InfraVM"

vm_name = {
  vm1 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id"
    policy_id             = "backup_policy_id_03"
  },
  vm2 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_01"
    policy_id             = "backup_policy_id_03"
  },
  vm3 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_02"
    policy_id             = "backup_policy_id_04"
  },
  vm4 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_03"
    policy_id             = "backup_policy_id_03"
  },
  vm5 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_04"
    policy_id             = "backup_policy_id_03"
  },
  vm6 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_05"
    policy_id             = "backup_policy_id_04"
  },
  vm7 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_06"
    policy_id             = "backup_policy_id_03"
  },
  vm8 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_07"
    policy_id             = "backup_policy_id_04"
  },
  vm9 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_08"
    policy_id             = "backup_policy_id_03"
  },
  vm10 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_09"
    policy_id             = "backup_policy_id_04"
  },
  vm11 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_10"
    policy_id             = "backup_policy_id_03"
  },
  vm12 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_11"
    policy_id             = "backup_policy_id_03"
  },
  vm13 = {
    recovery_vault_name   = "eit-uks-alz-hs-vmbackup-rsv-02"
    rsv_resourceGroupName = "eit-uks-alz-hs-vmbackup-rg"
    vm_id                 = "source_vm_id_12"
    policy_id             = "backup_policy_id_03"
  }
}




############### Ansible patching VM TFVARS #######################

lzmanagementhsAnsRgName           = "eit-uks-alz-hs-ans-rg"
ansvm01name                       = "eitukshsans01"
ansvmnicName                      = "eitukshsans01-nic-01"
ansosDiskName                     = "eitukshsans01-osdisk"
AnsvmnicIpConfigName              = "eitukshsans01-nic-01-Ip-Config"
ImageRGname                       = "eit-uks-alz-hs-imagebuild-rg"
Imagegalleryname                  = "eituksalzhsimagebuild01"
Imagename                         = "ubuntu20_04"
ImageVersion                      = "latest"
enable_nic_ip_forwarding          = "false"
enable_nic_accelerated_networking = "true"

#ouPath             = "OU=Application,OU=Azure UKS,OU=EDF Linux Servers,DC=edf-hs,DC=com"
saContainerName-dj = "scripts"
adAdminGroup       = "%svc_hs-snow-discover@edf-hs.com"
#adAdminGroup1      = "%Domain\ Admins@edf-ss.com"
adAdminGroup2      = "%devops_temp_admins@edf-hs.com"
DomainJoinFilePath = "https://eituksalzhsauxscripts.blob.core.windows.net/scripts/ubuntu_domainjoin.sh"
hostname           = "eitukshsans01.edf-hs.com"


dc01vmName                = "eituksalzhsdc01"
dc02vmName                = "eituksalzhsdc02"
web01vmname               = "eitukshscaweb01"
web02vmname               = "eitukshscaweb02"
ica01vmname               = "eitukshsica01"
ica02vmname               = "eitukshsica02"
rca01vmname               = "eitukshsrca01"
wac01vmname               = "eitukshswac01"
wus01vmname               = "eitukshswus01"
lzmanagementhsweb01RgName = "eit-uks-alz-hs-pki-rg"
lzmanagementhsica01RgName = "eit-uks-alz-hs-pki-rg"
lzmanagementhswac01RgName = "eit-uks-alz-hs-wac-rg"
lzmanagementhswus01RgName = "eit-uks-alz-hs-wsus-rg"

diagsettingnic = [
  {
    nicname = "eitukshsrca01-nic-01",
    rg      = "eit-uks-alz-hs-pki-rg"
  },
  {
    nicname = "eitukshsica01-nic-01",
    rg      = "eit-uks-alz-hs-pki-rg"
  },
  {
    nicname = "eitukshsrca02-nic-01",
    rg      = "eit-uks-alz-hs-pki-rg"
  },
  {
    nicname = "eitukshscaweb01-nic-01",
    rg      = "eit-uks-alz-hs-pki-rg"
  },
  {
    nicname = "eitukshscaweb02-nic-01",
    rg      = "eit-uks-alz-hs-pki-rg"
  },
  {
    nicname = "eitukshswac01-nic-01",
    rg      = "eit-uks-alz-hs-wac-rg"
  },
  {
    nicname = "eitukhssafs01-nic-01",
    rg      = "eit-uks-alz-hs-afs-rg-01"
  },
  {
    nicname = "eituksalzhsdc03-nic-01",
    rg      = "eit-uks-alz-hs-adds-rg"
  },
  {
    nicname = "eituksalzhsdc04-nic-01",
    rg      = "eit-uks-alz-hs-adds-rg"
  },
  {
    nicname = "eitukshsans01-nic-01",
    rg      = "eit-uks-alz-hs-ans-rg"
  }
]
