prjKvName   = "avmgendevhsmdwsub01kv"
prjKvRgName = ".security"

MDWHs-Tst-environment = "High Secured MDW"
MDWHsResourceLocation = "UK South"

########### PaaS Storage Account TFVARS  ################

MDWHsTstAuxRgName            = "gen-uks-tst-hs-mdw-auxscripts-rg-01"
auxScriptsSA                 = "genukststhsmdwauxsa01"
MDWHsTstVmLogsRgName         = "gen-uks-tst-hs-mdw-vmlogs-rg-01"
vmDiagTstSA                  = "genukststhsmdvmlogsa01"
vmDiagSA_accounttier         = "standard"
vmDiagSA_storagetype         = "StorageV2"
vmDiagSA_accountreptype      = "LRS"
vmDiagSA_tlsversion          = "TLS1_2"
vmDiagSA_accesstier          = "Hot"
vmDiagSA_httpstraffic        = "true"
vmDiagSA_publicaccess        = "false"
vmDiagSA_hnsenable           = "false"
vmDiagSA_nfsv3               = "false"
vmDiagSA_largefileshare      = "false"
vmDiagSA_blobsoftdelete      = "90"
vmDiagSA_containersoftdelete = "90"
vmDiagSA_sharesoftdelete     = "90"
vmDiagSA_acl                 = "Allow"
vmDiagSA_bypass              = ["AzureServices"]
vmDiagSA_routing             = "MicrosoftRouting"
vmDiagSA_publishinternet     = "false"
vmDiagSA_publishmicrosoft    = "false"


######### Recovery Services Vault #######

MDWHsTstRSVName             = "gen-uks-Test-hs-mdw-vmbackup-rsv-01"
MDWHsTstRSVRgName           = "gen-uks-hs-Test-mdw-vmbackup-rg-01"
sku                         = "Standard"
soft_delete_enabled         = true
RSV_diagnosticsetting_name  = "rsv_loganalytics"
log_category                = "CoreAzureBackup"
log_category_enabled        = true
log_category_retention      = true
log_category_retention_days = 0

############ Backup Policies #############

MDWHs_infraVM_backup_policy_01 = "Daily-2200-52W-AppVMs"
MDWHs_infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
backup_policy_time_01          = "22:00"
backup_policy_time_02          = "23:00"

vm_backup_policy_timezone  = "UTC"
backup_policy_frequency    = "Daily"
retention_daily_count      = 7
retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]


################# KV TFVARS

MDWHsTstkvRgName                = "gen-uks-tst-hs-mdw-ade-rg-01"
MDWHsTstkvName                  = "g-uks-tst-hs-mdw-ade-kv"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
KV_diagnosticsetting_name       = "kv_loganalytics"
default_action                  = "Allow"         //Allow will enable access to all networks
bypass                          = "AzureServices" //none
#Backup_Mngt_AppId                                   =   "262044b1-e2ce-469f-a196-69ab7ada62d3"

MDWHsPrivateDNSRgName = "gen-uks-tst-hs-bos-pdns-rg"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
vnet_dns_link_name    = "gen-uks-tst-hs-bos-pdns-link"


MDWHs_Tst_endpoint_name = "gen-uks-tst-hs-bo-ade-kv-pe"
MDWHs_Tst_endpoint_SC   = "gen-uks-tst-hs-bo-ade-kv-pesc"
is_manual_connection    = "false" //keep default false
subresource_names       = ["vault"]


MDWHsTstNetworkingRgName = "data-uks-dev-vnet-tst-rg-01"
MDWHsTstVnetName         = "gen-uks-dev-hs-mdw-vnet-tst-01"
MDWHsTstSubnetName       = "gen-uks-dev-hs-mdw-snet-tst-del"

############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "avmgendevhsmdwsub01tf"
avmsa_accounttier      = "standard"
avmsa_storagetype      = "StorageV2"
avmsa_accountreptype   = "LRS"
avmsa_tlsversion       = "TLS1_2"
avmsa_accesstier       = "Hot"
avmsa_httpstraffic     = "true"
avmsa_publicaccess     = "false"
avmsa_hnsenable        = "false"
avmsa_nfsv3            = "false"
avmsa_largefileshare   = "false"
avmsa_acl              = "Allow"
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"
environment            = "High Secured MDW"

##### AUX SA ########
auxsa_tlsversion          = "TLS1_2"
auxsa_accountreptype      = "LRS"
auxsa_accounttier         = "standard"
auxsa_storagetype         = "StorageV2"
auxsa_httpstraffic        = "true"
auxsa_publicaccess        = "false"
auxsa_hnsenable           = "false"
auxsa_nfsv3               = "false"
auxsa_largefileshare      = "false"
auxsa_blobsoftdelete      = "90"
auxsa_containersoftdelete = "90"
auxsa_sharesoftdelete     = "90"
auxsa_acl                 = "Allow"
auxsa_bypass              = ["AzureServices"]
auxsa_routing             = "MicrosoftRouting"
auxsa_publishinternet     = "false"
auxsa_publishmicrosoft    = "false"

sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
vmDiagsa_endpoint_name   = "genukststhsmdvmlogsa01=pe"
datapeSubnetName         = ""
datapeVnetName           = ""
datapepNetworkingRgName  = ""
vmDiagsa_endpoint_SC     = "genukststhsmdvmlogsa01-pesc"
sapep_subresource_names  = ["blob"]

avmsa_endpoint_name     = "avmgendevhsmdwsub01tf-pe"
avmsa_endpoint_SC       = "avmgendevhsmdwsub01tf-pesc"
datadevpeSubnetName     = "gen-uks-dev-hs-mdw-snet-dev-pep"
datadevVnetName         = "gen-uks-dev-hs-mdw-vnet-dev-01"
datadevNetworkingRgName = "data-uks-dev-vnet-dev-rg-01"

auxsa_endpoint_name = "genukststhsmdwauxsa01-pe"
auxsa_endpoint_SC   = "genukststhsmdwauxsa01-pesc"


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
