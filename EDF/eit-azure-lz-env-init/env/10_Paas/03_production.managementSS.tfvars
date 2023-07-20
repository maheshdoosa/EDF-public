environment                     = "Live"
lzmanagementSSVmLogsRgName      = "eit-uks-alz-ss-vmlogs-rg-01"
lzmanagementSSSubLogsRgName     = "eit-uks-alz-ss-auditlogs-rg"
lzHubManagementResourceLocation = "uksouth"

vmDiagSA  = "eituksalzssvmlogssa01"
subLogsSA = "eituksalzssauditsa01"

subLogsSAImmutabilityRententionPeriod = 403

managementSSKvName   = "avmeitalzssmgmtsub01kv"
managementSSKvRgName = ".security"


################# AFS VM ####################
lzmanagementSsAFSRgName                = "eit-uks-alz-ss-mgmt-vnet-rg"
lzmanagementSsAFSVmRgName              = "eit-uks-alz-ss-afs-rg-01"
lzmanagementSsAFSVnetName              = "eit-uks-alz-ss-mgmt-vnet-01"
AFSSubnetName                          = "eit-alz-ss-afs-snet-01"
lzmanagementSsAFSSaName                = "eituksprdssafssa02"
lzmanagementSsAFSFileShare             = "eituksprdssafsmgmt01"
lzmanagementSsAFSSaSyncName            = "afs-ss-afsmgmt01"
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
network_acl_action                     = "Allow"
microsoft_trusted_services             = ["AzureServices"]
routing_preference                     = "MicrosoftRouting"
publish_internet_endpoints             = "false"
publish_microsoft_endpoints            = "true"
fileshare_quota                        = "100"
lzmanagementSsAuditSubnetName          = "eit-alz-ss-audit-snet-01"
lzmanagementSsVnetName                 = "eit-uks-alz-ss-mgmt-vnet-01"
lzmanagementSsAFSServiceConnection     = "eituksprdssafssa02-sc01"
lzmanagementSsAFSSubResourceName       = ["file"]
lzmanagementSsAFSPrivateEndpoint       = "eituksprdssafssa02-pe01"


######### Recovery Services Vault #######

recovery_vault_name          = "eit-uks-alz-ss-vmbackup-rsv-01"
resourceLocation             = "UK South"
resourceGroupName            = "eit-uks-alz-ss-vmbackup-rg"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0
LaName                       = "eit-uks-alz-ss-loga-01"
La_resource_group_name       = "eit-uks-alz-ss-loga-rg"

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-InfraVM"
vm_backup_policy_timezone = "UTC"

backup_policy_frequency = "Daily"
backup_policy_time      = "22:00"
retention_daily_count   = 7

retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday", "Wednesday", "Friday", "Saturday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]

infraVM_backup_policy_02 = "Daily-2300-52W-InfraVM"
backup_policy_time_02    = "23:00"

############ VM Backup ###########

vmName              = "eituksalzssdc01"
vmName2             = "eituksalzssdc02"
resource_group_name = "eit-uks-alz-ss-adds-rg"

vmName3                 = "eitukssscaweb01"
vmName4                 = "eitukssscaweb02"
vmName5                 = "eituksssica01"
vmName6                 = "eituksssica02"
vmName7                 = "eituksssrca01"
resource_group_name_pki = "eit-uks-alz-ss-pki-rg"

vmName8                 = "eitukssswac01"
vmName9                 = "eitukssswac02"
resource_group_name_wac = "eit-uks-alz-ss-wac-rg"

vmName10                 = "eitukssswus01"
resource_group_name_wsus = "eit-uks-alz-ss-wsus-rg"

vmName11                 = "eituksalzsmid01"
resource_group_name_snow = "eit-uks-alz-ss-snow-rg-01"

vmName12                = "eituksssafs01"
resource_group_name_afs = "eit-uks-alz-ss-afs-rg-01"


#################### KV ################################

keyvault_name                   = "eit-uks-ss-ntc-kvt-01"
resource_Location               = "uk south"
kv_resource_group_name          = "eit-uks-alz-ss-ntc-rg"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "true"     //true or false
enabled_for_disk_encryption     = "false"    //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Allow"         //Allow will enable access to all networks
bypass                          = "AzureServices" //none
#environment                             = "Production"
# private_dns_zone_name                   = "privatelink.vaultcore.azure.net"
#private_dns_zone_name                   = "privatelink.vault.azure.net"
#vnet_dns_link_name                      = "kv-vnet-dns-link-01"
#endpoint_name                           = "test-pe"
#endpoint_SC                             = "test-pesc"
#is_manual_connection                    = "false" //keep default false
#subresource_names                       = ["vault"]
#lzsandpitNetworkingRgName               = "gen-uks-np-hs-mgmt-vnet-rg-01"
#lzsandpitVnetName                       = "gen-uks-np-hs-mgmt-vnet-01"
#peSubnetName                            = "gen-uks-np-hs-pep-snet-01"
#aad_group                               = ""
aad_user        = "sai.devarabhotla_accenture.com#EXT#@edfenergynnb.onmicrosoft.com"
laRgName        = "eit-uks-alz-ss-loga-rg"
laWorkspacename = "eit-uks-alz-ss-loga-01"


private_dns_zone_name       = "privatelink.blob.core.windows.net"
vnet_dns_link_name          = "eit-uks-alz-ss-mgmt-vnet-01-dnslink"
mgmtPrivateDNSRgName        = "eit-uks-alz-ss-mgmt-pvtdns-rg"
mgmt_vmsa_resourceGroupName = "eit-uks-alz-ss-vmlogs-rg-01"
mgmt_vmsa_endpoint_name     = "eituksalzssvmlogssa01-pe"
mgmt_vmsa_endpoint_SC       = "eituksalzssvmlogssa01-pesc"
is_manual_connection        = "false" //keep default false
subresource_names           = ["blob"]
mgmtPrdSSVnetName           = "eit-uks-alz-ss-mgmt-vnet-01"
mgmtPrdSSNetworkingRgName   = "eit-uks-alz-ss-mgmt-vnet-rg"
mgmtPrdSSSubnetName         = "eit-alz-ss-pep-snet-01"
mgmt_vmsa_name              = "eituksalzssvmlogssa01"

mgmt_sublogsa_resourceGroupName = "eit-uks-alz-ss-auditlogs-rg"
mgmt_sublogsa_endpoint_name     = "eituksalzssauditsa01-pe"
mgmt_sublogsa_endpoint_SC       = "eituksalzssauditsa01-pesc"
mgmt_sublogsa_name              = "eituksalzssauditsa01"

#################### KV01 ################################

keyvault_name01                   = "eit-uks-alz-ss-cred-kv"
resource_Location01               = "uk south"
kv_resource_group_name01          = "eit-uks-alz-ss-cred-rg-01"
sku_name01                        = "standard" // standard or premium HSM
enabled_for_deployment01          = "true"     //true or false
enabled_for_disk_encryption01     = "false"    //true or false
enabled_for_template_deployment01 = "false"    //true or false
soft_delete_retention_days01      = "90"
purge_protection_enabled01        = "false" //true
diagnosticsetting_name01          = "keyVault-diagnostics"
default_action01                  = "Allow"         //Allow will enable access to all networks
bypass01                          = "AzureServices" //none
aad_user01_01                     = "d5d939fc-7a73-46a0-abf6-b41d95a7b286"
aad_user01_02                     = "ff255ba1-e24d-457e-812c-a09d030e22a8"

########################## Ade KV ######################

ade_keyvault_name                 = "eit-uks-alz-ss-ade-kvt"
ade_kv_resource_group_name        = "eit-uks-alz-ss-ade-rg-01"
enabled_for_disk_encryption_adekv = "true"
enabled_for_deployment_adekv      = "false"
sku_name_adekv                    = "premium"
########################## AVM KV ######################

avm_keyvault_name            = "avmeitalzssmgmtsub01kv"
avm_kv_resource_group_name   = ".security"
enabled_for_deployment_avmkv = "false"


############ Private endpoint with KV ################
private_dns_zone_kv_name = "privatelink.vaultcore.azure.net"
ntc_kv_resourceGroupName = "eit-uks-alz-ss-ntc-rg"
ntc_Prd_endpoint_name    = "eit-uks-alz-ss-ntc-kv-pe"
ntc_Prd_endpoint_SC      = "eit-uks-alz-ss-ntc-kv-pesc"
subresource_names_kv     = ["vault"]
mgmtpepSubnetName        = "eit-alz-ss-pep-snet-01"
mgmtVnetName             = "eit-uks-alz-ss-mgmt-vnet-01"
mgmtNetworkingRgName     = "eit-uks-alz-ss-mgmt-vnet-rg"
mgmtkvPrivateDNSRgName   = "eit-uks-alz-ss-mgmt-pvtdns-rg"


cred_kv_resourceGroupName = "eit-uks-alz-ss-cred-rg-01"
cred_Prd_endpoint_name    = "eit-uks-alz-ss-cred-kv-pe"
cred_Prd_endpoint_SC      = "eit-uks-alz-ss-cred-kv-pesc"


ade_kv_resourceGroupName = "eit-uks-alz-ss-ade-rg-01"
ade_Prd_endpoint_name    = "eit-uks-alz-ss-ade-kv-pe"
ade_Prd_endpoint_SC      = "eit-uks-alz-ss-ade-kv-pesc"


avm_Prd_endpoint_name = "eit-uks-alz-ss-avm-kv-pe"
avm_Prd_endpoint_SC   = "eit-uks-alz-ss-avm-kv-pesc"


############# AVM SA ####################

mgmtavmsaRgName               = ".terraformBootstrap"
mgmtavmsaResourceLocation     = "UK South"
mgmtavmsa                     = "avmeitalzssmgmtsub01tf"
mgmtavmsa_accounttier         = "standard"
mgmtavmsa_storagetype         = "StorageV2"
mgmtavmsa_accountreptype      = "LRS"
mgmtavmsa_tlsversion          = "TLS1_2"
mgmtavmsa_accesstier          = "Hot"
mgmtavmsa_httpstraffic        = "true"
mgmtavmsa_publicaccess        = "false"
mgmtavmsa_hnsenable           = "false"
mgmtavmsa_nfsv3               = "false"
mgmtavmsa_largefileshare      = "false"
mgmtavmsa_blobsoftdelete      = "90"
mgmtavmsa_containersoftdelete = "90"
mgmtavmsa_sharesoftdelete     = "90"
mgmtavmsa_acl                 = "Allow"
mgmtavmsa_bypass              = ["AzureServices"]
mgmtavmsa_routing             = "MicrosoftRouting"
mgmtavmsa_publishinternet     = "false"
mgmtavmsa_publishmicrosoft    = "false"
# environment     = "Live"
mgmtavmsaca = "statefiles"


#### NTC SA ############
mgmtntcsaRgName               = "eit-uks-alz-ss-ntc-rg"
mgmtntcsaResourceLocation     = "UK South"
mgmtntcsa                     = "eituksalzssntcsa01"
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
mgmtntcsa_acl                 = "Allow"
mgmtntcsa_bypass              = ["AzureServices"]
mgmtntcsa_routing             = "MicrosoftRouting"
mgmtntcsa_publishinternet     = "false"
mgmtntcsa_publishmicrosoft    = "false"
mgmtntcsaca01                 = "code"
mgmtntcsaca02                 = "eitukmonitoringtfstate"
mgmtntcsaca03                 = "scripts"

############### aux SA #############

mgmtauxsaRgName               = "eit-uk-alz-ss-auxscripts"
mgmtauxsaResourceLocation     = "UK South"
mgmtauxsa                     = "eituksalzssauxscriptprd"
mgmtauxsa_accounttier         = "standard"
mgmtauxsa_storagetype         = "StorageV2"
mgmtauxsa_accountreptype      = "LRS"
mgmtauxsa_tlsversion          = "TLS1_2"
mgmtauxsa_accesstier          = "Hot"
mgmtauxsa_httpstraffic        = "true"
mgmtauxsa_publicaccess        = "false"
mgmtauxsa_hnsenable           = "false"
mgmtauxsa_nfsv3               = "false"
mgmtauxsa_largefileshare      = "false"
mgmtauxsa_blobsoftdelete      = "90"
mgmtauxsa_containersoftdelete = "90"
mgmtauxsa_sharesoftdelete     = "90"
mgmtauxsa_acl                 = "Allow"
mgmtauxsa_bypass              = ["AzureServices"]
mgmtauxsa_routing             = "MicrosoftRouting"
mgmtauxsa_publishinternet     = "false"
mgmtauxsa_publishmicrosoft    = "false"
mgmtauxsaca01                 = "pkiscripts"
mgmtauxsaca02                 = "scripts"


############ cli SA ################

mgmtclisaRgName               = ".security"
mgmtclisaResourceLocation     = "UK South"
mgmtclisa                     = "sastoragecli"
mgmtclisa_accounttier         = "standard"
mgmtclisa_storagetype         = "StorageV2"
mgmtclisa_accountreptype      = "LRS"
mgmtclisa_tlsversion          = "TLS1_2"
mgmtclisa_accesstier          = "Hot"
mgmtclisa_httpstraffic        = "true"
mgmtclisa_publicaccess        = "false"
mgmtclisa_hnsenable           = "false"
mgmtclisa_nfsv3               = "false"
mgmtclisa_largefileshare      = "false"
mgmtclisa_blobsoftdelete      = "90"
mgmtclisa_containersoftdelete = "90"
mgmtclisa_sharesoftdelete     = "90"
mgmtclisa_acl                 = "Allow"
mgmtclisa_bypass              = ["AzureServices"]
mgmtclisa_routing             = "MicrosoftRouting"
mgmtclisa_publishinternet     = "false"
mgmtclisa_publishmicrosoft    = "false"
mgmtclisaca                   = "bootdiagnostics-windowste-8d14f6ac-ad49-47fc-932b-c3d1a529d65b"


mgmt_avmsa_resourceGroupName = ".terraformBootstrap"
mgmt_avmsa_endpoint_name     = "avmeitalzssmgmtsub01tf-pe"
mgmt_avmsa_endpoint_SC       = "avmeitalzssmgmtsub01tf-pesc"

mgmt_auxsa_resourceGroupName = "eit-uk-alz-ss-auxscripts"
mgmt_auxsa_endpoint_name     = "eituksalzssauxscriptprd-pe"
mgmt_auxsa_endpoint_SC       = "eituksalzssauxscriptprd-pesc"


mgmt_ntcsa_resourceGroupName = "eit-uks-alz-ss-ntc-rg"
mgmt_ntcsa_endpoint_name     = "eituksalzssntcsa01"
mgmt_ntcsa_endpoint_SC       = "eituksalzssntcsa01"

mgmt_clisa_resourceGroupName = ".security"
mgmt_clisa_endpoint_name     = "sastoragecli-pe"
mgmt_clisa_endpoint_SC       = "sastoragecli-pesc"



############# IMage Build RG name ####################

lzmanagementSSVmimageRgName = "eit-uks-alz-ss-imagebuild-rg"

SIgalleryname = "eituksalzssimagebuild01"
images = {
  VMimage1 = {
    sharedimagename          = "Windows2019"
    Sharedimagegalleryname   = "eituksalzssimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-ss-imagebuild-rg"
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
    Sharedimagegalleryname   = "eituksalzssimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-ss-imagebuild-rg"
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
    Sharedimagegalleryname   = "eituksalzssimagebuild01"
    sharedimageresourcegroup = "eit-uks-alz-ss-imagebuild-rg"
    sharedimagelocation      = "UK South"
    os_type                  = "Linux"
    publisher                = "RedHat"
    offer                    = "RHEL"
    sku                      = "8.8"
    planpurchase             = "8.8"
    planpublisher            = "RedHat"
    planproduct              = "RHEL"
  }
}
