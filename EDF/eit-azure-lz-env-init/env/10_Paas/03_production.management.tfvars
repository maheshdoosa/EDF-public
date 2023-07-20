environment                     = "HS Management"
lzmanagementHsVmLogsRgName      = "eit-uks-alz-hs-vmlogs-rg-01"
lzmanagementHsSubLogsRgName     = "eit-uks-alz-hs-auditlogs-rg"
lzmanagementHsAuxScriptsRgName  = "eit-uks-alz-hs-auxscripts-rg"
lzHubManagementResourceLocation = "uksouth"

vmDiagSA     = "eituksalzhsvmlogssa01"
subLogsSA    = "eituksalzhsauditsa01"
auxScriptsSA = "eituksalzhsauxscripts"

subLogsSAImmutabilityRententionPeriod = 403

managementHsKvName   = "eitlzmanagementhskv"
managementHsKvRgName = ".security"

################# AFS VM ####################
lzmanagementHsVnetRgName               = "eit-uks-alz-hs-mgmt-vnet-rg"
lzmanagementHsAFSVmRgName              = "eit-uks-alz-hs-afs-rg-01"
lzmanagementHsAFSVnetName              = "eit-uks-alz-hs-mgmt-vnet-01"
AFSSubnetName                          = "eit-alz-hs-afs-snet-01"
lzmanagementHsAFSSaName                = "eituksprdhsafssa01"
lzmanagementHsAFSFileShare             = "eituksprdhsafsmgmt01"
lzmanagementHsAFSSaSyncName            = "afs-hs-afsmgmt01"
account_tier                           = "standard"
storagetype                            = "StorageV2"
account_replication_type               = "LRS"
minTlsVersion                          = "TLS1_2"
access_tier                            = "Hot"
enable_https_traffic                   = "true"
blob_public_access                     = "false"
hns_enabled                            = "false"
nfsv3_enabled                          = "false"
large_file_share                       = "false"
blob_soft_delete_retention_days        = "90"
container_delete_retention_policy_days = "90"
share_soft_delete_retention_days       = "90"
network_acl_action                     = "Deny"
microsoft_trusted_services             = ["AzureServices"]
routing_preference                     = "MicrosoftRouting"
publish_internet_endpoints             = "false"
publish_microsoft_endpoints            = "true"
fileshare_quota                        = "100"
lzmanagementHsAuditSubnetName          = "eit-alz-hs-audit-snet-01"
lzmanagementHsVnetName                 = "eit-uks-alz-hs-mgmt-vnet-01"
lzmanagementHsAFSServiceConnection     = "eituksprdhsafssa01-sc01"
lzmanagementHsAFSSubResourceName       = ["file"]
lzmanagementHsAFSPrivateEndpoint       = "eituksprdhsafssa01-pe01"
AFS_private_dns_zone_name              = "privatelink.file.core.windows.net"
mgmtPrivateDNSRgName                   = "eit-uks-alz-hs-mgmt-pvtdns-rg"

############# IMage Build RG name ####################

lzmanagementHSVmimageRgName = "eit-uks-alz-hs-imagebuild-rg"

SIgalleryname = "eituksalzhsimagebuild01"
images = {
  VMimage1 = {
    sharedimagename          = "Windows2019"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Windows"
    publisher                = "MicrosoftWindowsServer"
    offer                    = "WindowsServer"
    sku                      = "2019-Datacenter"
    planpurchase             = "2019-Datacenter"
    planpublisher            = "MicrosoftWindowsServer"
    planproduct              = "WindowsServer"
  },
  VMimage2 = {
    sharedimagename          = "Oracle"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "Oracle"
    offer                    = "Oracle-Linux"
    sku                      = "ol84-lvm"
    planpurchase             = "ol84-lvm"
    planpublisher            = "Oracle"
    planproduct              = "Oracle-Linux"
  },
  VMimage3 = {
    sharedimagename          = "RedHat"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "RedHat"
    offer                    = "RHEL"
    sku                      = "8.8"
    planpurchase             = "8.8"
    planpublisher            = "RedHat"
    planproduct              = "RHEL"
  },
  VMimage4 = {
    sharedimagename          = "ubuntu_image"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "center-for-internet-security-inc"
    offer                    = "cis-ubuntu-linux-1804-l1"
    sku                      = "cis-ubuntu1804-l1"
    planpurchase             = "cis-ubuntu1804-l1"
    planpublisher            = "center-for-internet-security-inc"
    planproduct              = "cis-ubuntu-linux-1804-l1"
  },
  VMimage5 = {
    sharedimagename          = "ubuntu20_04"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "Canonical"
    offer                    = "0001-com-ubuntu-server-focal"
    sku                      = "20_04-lts"
    planpurchase             = "20_04-lts"
    planpublisher            = "Canonical"
    planproduct              = "0001-com-ubuntu-server-focal"
  },
  VMimage6 = {
    sharedimagename          = "ubuntu18_04"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "Canonical"
    offer                    = "UbuntuServer"
    sku                      = "18.04-LTS"
    planpurchase             = "18.04-LTS"
    planpublisher            = "Canonical"
    planproduct              = "UbuntuServer"
  },
  VMimage7 = {
    sharedimagename          = "Windows_2016"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Windows"
    publisher                = "EIT-ALZ"
    offer                    = "Windows-image"
    sku                      = "Windows2016"
    planpurchase             = "Windows2016"
    planpublisher            = "EIT-ALZ"
    planproduct              = "Windows-image"
  },
  VMimage8 = {
    sharedimagename          = "EIT-RHEL7-image"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "EIT-DevOps-image"
    offer                    = "EIT-RHEL7-image"
    sku                      = "RHEL-7-7"
    planpurchase             = "RHEL-7-7"
    planpublisher            = "EIT-DevOps-image"
    planproduct              = "EIT-RHEL7-image"
  },
  VMimage9 = {
    sharedimagename          = "EIT-Oracle7-image"
    Sharedimagegalleryname   = "eituksalzhsimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-hs-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "EIT-DevOps-image"
    offer                    = "EIT-Oracle7-image"
    sku                      = "Oracle-7-9"
    planpurchase             = "Oracle-7-9"
    planpublisher            = "EIT-DevOps-image"
    planproduct              = "EIT-Oracle7-image"
  }
}


#### mgmt ADDS SA ############
mgmtaddssaRgName           = "eit-uks-alz-hs-adds-rg"
mgmtaddssaResourceLocation = "UK South"
mgmtaddssa                 = "eituksalzhsaddsrgguestdi"


mgmtaddssa_accounttier         = "standard"
mgmtaddssa_storagetype         = "StorageV2"
mgmtaddssa_accountreptype      = "LRS"
mgmtaddssa_tlsversion          = "TLS1_2"
mgmtaddssa_accesstier          = "Hot"
mgmtaddssa_httpstraffic        = "true"
mgmtaddssa_publicaccess        = "false"
mgmtaddssa_hnsenable           = "false"
mgmtaddssa_nfsv3               = "false"
mgmtaddssa_largefileshare      = "false"
mgmtaddssa_blobsoftdelete      = "90"
mgmtaddssa_containersoftdelete = "90"
mgmtaddssa_sharesoftdelete     = "90"
mgmtaddssa_acl                 = "Deny"
mgmtaddssa_bypass              = ["AzureServices"]
mgmtaddssa_routing             = "MicrosoftRouting"
mgmtaddssa_publishinternet     = "false"
mgmtaddssa_publishmicrosoft    = "false"




#### mgmt NTC SA ############
mgmtntcsaRgName           = "eit-uks-alz-hs-ntc-rg"
mgmtntcsaResourceLocation = "UK South"
mgmtntcsa                 = "eituksalzhsntcsa01"


mgmtntcsa_accounttier         = "standard"
mgmtntcsa_storagetype         = "StorageV2"
mgmtntcsa_accountreptype      = "LRS"
mgmtntcsa_tlsversion          = "TLS1_2"
mgmtntcsa_accesstier          = "Hot"
mgmtntcsa_httpstraffic        = "true"
mgmtntcsa_publicaccess        = "false"
mgmtntcsa_hnsenable           = "false"
mgmtntcsa_nfsv3               = "false"
mgmtntcsa_largefileshare      = "false"
mgmtntcsa_blobsoftdelete      = "90"
mgmtntcsa_containersoftdelete = "90"
mgmtntcsa_sharesoftdelete     = "90"
mgmtntcsa_acl                 = "Deny"
mgmtntcsa_bypass              = ["AzureServices"]
mgmtntcsa_routing             = "MicrosoftRouting"
mgmtntcsa_publishinternet     = "false"
mgmtntcsa_publishmicrosoft    = "false"

######## Storage account PE #############

saprivate_dns_zone_name         = "privatelink.blob.core.windows.net"
mgmtvmDiagHSsaRgName            = "eit-uks-alz-hs-vmlogs-rg-01"
mgmtvmDiagHSauxsa_endpoint_name = "eituksalzhsvmlogssa01-pe"
mgmtResourceLocation            = "uksouth"
mgmtvmDiagHSauxsa_endpoint_SC   = "eituksalzhsvmlogssa01-pesc"
is_manual_connection            = "false" //keep default false
mgmtsa_subresource_names        = ["blob"]
mgmtHSpesubnetName              = "eit-alz-hs-pep-snet-01"
mgmtHSpeVnetName                = "eit-uks-alz-hs-mgmt-vnet-01"
mgmtHSpeVnetRgName              = "eit-uks-alz-hs-mgmt-vnet-rg"


mgmtsubLogsHSauxsa_endpoint_name = "eituksalzhsauditsa01-pe"
mgmtsubLogsHSauxsa_endpoint_SC   = "eituksalzhsauditsa01-pesc"


mgmtHSauxsa_endpoint_name = "eituksalzhsauxscripts-pe"
mgmtHSauxsa_endpoint_SC   = "eituksalzhsauxscripts-pesc"

mgmtHSaddssa_endpoint_name = "eituksalzhsaddsrgguestdi-pe"
mgmtHSaddssa_endpoint_SC   = "eituksalzhsaddsrgguestdi-pesc"

mgmtHSntcsa_endpoint_name = "eituksalzhsntcsa01-pe"
mgmtHSntcsa_endpoint_SC   = "eituksalzhsntcsa01-pesc"

######### Recovery Services Vault #######

recovery_vault_name          = "eit-uks-alz-hs-vmbackup-rsv-01"
recovery_vault_name_02       = "eit-uks-alz-hs-vmbackup-rsv-02"
resourceLocation             = "uksouth"
resourceGroupName            = "eit-uks-alz-hs-vmbackup-rg"
sku                          = "Standard"
storage_mode_type            = "LocallyRedundant"
soft_delete_enabled          = true
log_analytics_workspace_name = "eit-uks-alz-hs-loga-01"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-InfraVM"
vm_backup_policy_timezone = "UTC"

backup_policy_frequency = "Daily"
backup_policy_time      = "22:00"
retention_daily_count   = 7

retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday"]
retention_monthly_weeks    = ["First"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["First"]
retention_yearly_months    = ["January"]

infraVM_backup_policy_02 = "Daily-2300-52W-InfraVM"
backup_policy_time_02    = "23:00"
############# avmeit SA ####################

avmeitRgName            = ".terraformBootstrap"
avmeitResourceLocation  = "uksouth"
avmeit                  = "azureeitavm"
avmeit_accounttier      = "standard"
avmeit_storagetype      = "StorageV2"
avmeit_accountreptype   = "LRS"
avmeit_tlsversion       = "TLS1_2"
avmeit_accesstier       = "Hot"
avmeit_httpstraffic     = "true"
avmeit_publicaccess     = "false"
avmeit_hnsenable        = "false"
avmeit_nfsv3            = "false"
avmeit_largefileshare   = "false"
avmeit_acl              = "Deny"
avmeit_bypass           = ["AzureServices"]
avmeit_routing          = "MicrosoftRouting"
avmeit_publishinternet  = "false"
avmeit_publishmicrosoft = "false"
avmeitca                = "statefiles"
############# tfstate SA ####################

tfstateRgName            = ".terraformBootstrap"
tfstateResourceLocation  = "uksouth"
tfstate                  = "tfstateprodmanagement"
tfstate_accounttier      = "standard"
tfstate_storagetype      = "StorageV2"
tfstate_accountreptype   = "RAGRS"
tfstate_tlsversion       = "TLS1_2"
tfstate_accesstier       = "Hot"
tfstate_httpstraffic     = "true"
tfstate_publicaccess     = "false"
tfstate_hnsenable        = "false"
tfstate_nfsv3            = "false"
tfstate_largefileshare   = "false"
tfstate_acl              = "Deny"
tfstate_bypass           = ["AzureServices"]
tfstate_routing          = "MicrosoftRouting"
tfstate_publishinternet  = "false"
tfstate_publishmicrosoft = "false"
tfstateca                = "statefiles"

avmeit_privateEndpoint_name = "azureeitavm-pe"
avmeit_privateEndpoint_sc   = "azureeitavm-pesc"

tfstate_privateEndpoint_name = "tfstateprodmanagement-pe"
tfstate_privateEndpoint_sc   = "tfstateprodmanagement-pesc"
############# auditsa SA ####################

auditsaRgName            = "eit-uks-alz-hs-auditlogs-rg"
auditsaResourceLocation  = "uksouth"
auditsa                  = "eituksalzhsauditsa01"
auditsa_accounttier      = "standard"
auditsa_storagetype      = "StorageV2"
auditsa_accountreptype   = "LRS"
auditsa_tlsversion       = "TLS1_2"
auditsa_accesstier       = "Hot"
auditsa_httpstraffic     = "true"
auditsa_publicaccess     = "false"
auditsa_hnsenable        = "false"
auditsa_nfsv3            = "false"
auditsa_largefileshare   = "false"
auditsa_acl              = "Deny"
auditsa_bypass           = ["AzureServices"]
auditsa_routing          = "MicrosoftRouting"
auditsa_publishinternet  = "false"
auditsa_publishmicrosoft = "false"
auditsaca                = "statefiles"
############# auxsa SA ####################

auxsaRgName            = "eit-uks-alz-hs-auxscripts-rg"
auxsaResourceLocation  = "uksouth"
auxsa                  = "eituksalzhsauxscripts"
auxsa_accounttier      = "standard"
auxsa_storagetype      = "StorageV2"
auxsa_accountreptype   = "LRS"
auxsa_tlsversion       = "TLS1_2"
auxsa_accesstier       = "Hot"
auxsa_httpstraffic     = "true"
auxsa_publicaccess     = "false"
auxsa_hnsenable        = "false"
auxsa_nfsv3            = "false"
auxsa_largefileshare   = "false"
auxsa_acl              = "Deny"
auxsa_bypass           = ["AzureServices"]
auxsa_routing          = "MicrosoftRouting"
auxsa_publishinternet  = "false"
auxsa_publishmicrosoft = "false"
auxsaca                = "statefiles"
############# vmlogsa SA ####################

vmlogsaRgName            = "eit-uks-alz-hs-vmlogs-rg-01"
vmlogsaResourceLocation  = "uksouth"
vmlogsa                  = "eituksalzhsvmlogssa01"
vmlogsa_accounttier      = "standard"
vmlogsa_storagetype      = "StorageV2"
vmlogsa_accountreptype   = "LRS"
vmlogsa_tlsversion       = "TLS1_2"
vmlogsa_accesstier       = "Hot"
vmlogsa_httpstraffic     = "true"
vmlogsa_publicaccess     = "false"
vmlogsa_hnsenable        = "false"
vmlogsa_nfsv3            = "false"
vmlogsa_largefileshare   = "false"
vmlogsa_acl              = "Deny"
vmlogsa_bypass           = ["AzureServices"]
vmlogsa_routing          = "MicrosoftRouting"
vmlogsa_publishinternet  = "false"
vmlogsa_publishmicrosoft = "false"
vmlogsaca                = "statefiles"

container                   = "scripts"
vmlogsa_blobsoftdelete      = "90"
vmlogsa_containersoftdelete = "90"
vmlogsa_sharesoftdelete     = "90"
auditsa_blobsoftdelete      = "90"
auditsa_containersoftdelete = "90"
auditsa_sharesoftdelete     = "90"
auxsa_blobsoftdelete        = "90"
auxsa_containersoftdelete   = "90"
auxsa_sharesoftdelete       = "90"

eitdevopsResourceLocation = "uksouth"
EITDevopsAppRgName        = "eit-uks-alz-hs-devops-app-rg-01"
EITDevopsPackerRgName     = "eit-uks-alz-hs-devops-packer-rg-01"
EITDevopsctrlplaneRgName  = "eit-uks-alz-hs-devops-ctrlplane-rg-01"

category1  = "AzureBackupReport"
category2  = "CoreAzureBackup"
category3  = "AddonAzureBackupJobs"
category4  = "AddonAzureBackupAlerts"
category5  = "AddonAzureBackupPolicy"
category6  = "AddonAzureBackupStorage"
category7  = "AddonAzureBackupProtectedInstance"
category8  = "AzureSiteRecoveryJobs"
category9  = "AzureSiteRecoveryEvents"
category10 = "AzureSiteRecoveryReplicatedItems"
category11 = "AzureSiteRecoveryReplicationStats"
category12 = "AzureSiteRecoveryRecoveryPoints"
category13 = "AzureSiteRecoveryReplicationDataUploadRate"
category14 = "AzureSiteRecoveryProtectedDiskDataChurn"
category15 = "Health"

categoryenabledtrue            = true
categoryenabledfalse           = false
retention_policy_enabled_true  = true
retention_policy_enabled_false = false
retention_policydays           = 90

########## Storage account diag settings ##########
category16 = "StorageRead"
category17 = "StorageWrite"
category18 = "StorageDelete"
category19 = "Transaction"
