environment = "Standard Secured Management"

#managementHs key vault
managementSsKvName   = "avmeitalzssmgmtsub01kv"
managementSsKvRgName = ".security"

lzmanagementSsPkiRgName         = "eit-uks-alz-ss-pki-rg"
lzmanagementSsWacRgName         = "eit-uks-alz-ss-wac-rg"
lzmanagementSsWarpRgName        = "eit-uks-alz-ss-snow-rg-01"
lzHubManagementResourceLocation = "uksouth"
pkiSubnetName                   = "eit-alz-ss-ca-snet-01"
wacSubnetName                   = "eit-alz-ss-wac-snet-01"
warpSubnetName                  = "eit-alz-ss-snow-snet-01"
lzmanagementSsVnetName          = "eit-uks-alz-ss-mgmt-vnet-01"
lzmanagementSsNetworkingRgName  = "eit-uks-alz-ss-mgmt-vnet-rg"
storageAccountName              = "eituksalzssauxscriptprd"
saContainerName                 = "pkiscripts"

bootDiagLogStorageAccountName   = "eituksalzssvmlogssa01"
bootDiagLogStorageAccountRgName = "eit-uks-alz-ss-vmlogs-rg-01"

lapsFilePath        = "https://eituksalzssauxscriptprd.blob.core.windows.net/pkiscripts/LAPS.x64.msi"
gbRegionXmlFilePath = "https://eituksalzssauxscriptprd.blob.core.windows.net/pkiscripts/GBRegion.xml"
prepVmPs1FilePath   = "https://eituksalzssauxscriptprd.blob.core.windows.net/pkiscripts/PrepareVM.ps1"

ouPath = "OU=Infrastructure,OU=Azure UKS,OU=EDF Servers,DC=edf-ss,DC=com"

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

######### Azure Disk Encryption ############

managementSsAdeKvName   = "eit-uks-alz-ss-ade-kvt"
managementSsAdeKvRgName = "eit-uks-alz-ss-ade-rg-01"

EncryptionOperation    = "EnableEncryption"
KeyEncryptionAlgorithm = "RSA-OAEP"
VolumeType             = "All"

##################### Extensions #######################

updateManagmentRgName = "eit-uks-alz-ss-loga-rg"
laWorkspacename       = "eit-uks-alz-ss-loga-01"

#################### Ado selfhosted agent ##############

lzmanagementSsadoagentVMsRgName = "eit-uks-alz-ss-ado-rg"
sigalleryname                   = "eituksalzsssig01"
sharedimagedefname              = "eituksalzsssid01"
vmsssubnetname                  = "eit-alz-ss-ado-snet-01"
vmssvnetname                    = "eit-uks-alz-ss-mgmt-vnet-01"
vmssvnetrg                      = "eit-uks-alz-ss-mgmt-vnet-rg"


################# AFS VM ####################
lzmanagementSsAFSRgName   = "eit-uks-alz-ss-mgmt-vnet-rg"
lzmanagementSsAFSVmRgName = "eit-uks-alz-ss-afs-rg-01"
lzmanagementSsAFSVnetName = "eit-uks-alz-ss-mgmt-vnet-01"
AFSSubnetName             = "eit-alz-ss-afs-snet-01"

############### ADDS TFVARS #######################

lzmanagementss_adds_resource_group = "eit-uks-alz-ss-adds-rg"
lzmanagementSsdcsubnet             = "eit-alz-ss-adds-snet-01"
lzmanagementSsaddsasg              = "eit-uks-alz-ss-adds-asg"
lzmanagementSsaddsasgrg            = "ss-mgmt-asgs-prd"
dc03vmnicName                      = "eituksalzssdc03-nic-01"
dc03vmnicIpConfigName              = "eituksalzssdc03-nic-01-Ip-Config"
enable_nic_ip_forwarding           = "false"
enable_nic_accelerated_networking  = "true"
dc04vmnicName                      = "eituksalzssdc04-nic-01"
dc04vmnicIpConfigName              = "eituksalzssdc04-nic-01-Ip-Config"
dc03vmName                         = "eituksalzssdc03"
dc03vmosDiskName                   = "eituksalzssdc03-osdisk"
dc03vmstorageDiskName              = "eituksalzssdc03-datadisk-01"
dc04vmName                         = "eituksalzssdc04"
dc04vmosDiskName                   = "eituksalzssdc04-osdisk"
dc04vmstorageDiskName              = "eituksalzssdc04-datadisk-01"
prepVmPs1FilePathforAD             = "https://eituksalzssauxscriptprd.blob.core.windows.net/pkiscripts/PrepVMForAD.ps1"
urlConfigureADNextDC               = "https://eituksalzssauxscriptprd.blob.core.windows.net/pkiscripts/ConfigureADNextDC.ps1.zip"
scriptfileConfigureADNextDC        = "ConfigureADNextDC.ps1"
functionConfigureADNextDC          = "ConfigureADNextDC"
scriptsstorage                     = "eituksalzssauxscriptprd"
scriptsstoragerg                   = "eit-uk-alz-ss-auxscripts"
recovery_services_vault_rgname     = "eit-uks-alz-ss-vmbackup-rg"
recovery_services_vault_name       = "eit-uks-alz-ss-vmbackup-rsv-01"
infraVM_backup_policy_01           = "Daily-2200-52W-InfraVM"
infraVM_backup_policy_02           = "Daily-2300-52W-InfraVM"
vm_name = {
  vm1 = {
    recovery_services_vault_name   = "eit-uks-alz-ss-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-alz-ss-vmbackup-rg"
    vm_id                          = "source_vm_id_01"
    policy_id                      = "backup_policy_id_01"
  },
  vm2 = {
    recovery_services_vault_name   = "eit-uks-alz-ss-vmbackup-rsv-01"
    recovery_services_vault_rgname = "eit-uks-alz-ss-vmbackup-rg"
    vm_id                          = "source_vm_id_02"
    policy_id                      = "backup_policy_id_02"
  }
}
