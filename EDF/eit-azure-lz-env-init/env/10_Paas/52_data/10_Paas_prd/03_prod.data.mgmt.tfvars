prjKvName   = "avmgenprdhsmdwsub01kv"
prjKvRgName = ".security"

MDWHs-Prd-environment = "High Secured MDW"
MDWHs-Uat-environment = "High Secured MDW"
MDWHsResourceLocation = "UK South"

########### PaaS Storage Account TFVARS  ################

MDWHsPrdAuxRgName    = "gen-uks-prd-hs-mdw-auxscripts-rg-01"
auxScriptsSA         = "genuksprdhsmdwauxsa01"
MDWHsPrdVmLogsRgName = "gen-uks-prd-hs-mdw-vmlogs-rg-01"
vmDiagPrdSA          = "genuksprdhsmdvmlogsa01"

MDWHsUatVmLogsRgName = "gen-uks-uat-hs-mdw-vmlogs-rg-01"
vmDiagUatSA          = "genuksuathsmdvmlogsa01"

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
vmDiagSA_acl                 = "Deny"
vmDiagSA_bypass              = ["AzureServices"]
vmDiagSA_routing             = "MicrosoftRouting"
vmDiagSA_publishinternet     = "false"
vmDiagSA_publishmicrosoft    = "false"


######### Recovery Services Vault #######

MDWHsPrdRSVName   = "gen-uks-prd-hs-mdw-vmbackup-rsv-01"
MDWHsPrdRSVRgName = "gen-uks-hs-prd-mdw-vmbackup-rg-01"

MDWHsUatRSVName   = "gen-uks-uat-hs-mdw-vmbackup-rsv-01"
MDWHsUatRSVRgName = "gen-uks-hs-uat-mdw-vmbackup-rg-01"

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

MDWHsPrdkvRgName = "gen-uks-prd-hs-mdw-ade-rg-01"
MDWHsPrdkvName   = "g-uks-prd-hs-mdw-ade-kv"

MDWHsUatkvRgName = "gen-uks-uat-hs-mdw-ade-rg-01"
MDWHsUatkvName   = "g-uks-uat-hs-bo-ade-kv"

sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
KV_diagnosticsetting_name       = "kv_loganalytics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none


MDWHsPrivateDNSRgName = "gen-uks-prd-hs-bos-pdns-rg"
private_dns_zone_name = "privatelink.vaultcore.azure.net"
vnet_dns_link_name    = "gen-uks-prd-hs-bos-pdns-link"


MDWHs_Prd_endpoint_name = "gen-uks-prd-hs-bo-ade-kv-pe"
MDWHs_Prd_endpoint_SC   = "gen-uks-prd-hs-bo-ade-kv-pesc"

MDWHs_Uat_endpoint_name = "gen-uks-uat-hs-bo-ade-kv-pe"
MDWHs_Uat_endpoint_SC   = "gen-uks-uat-hs-bo-ade-kv-pesc"

is_manual_connection = "false" //keep default false
subresource_names    = ["vault"]


MDWHsPrdNetworkingRgName = "data-uks-prd-vnet-prd-rg-01"
MDWHsPrdVnetName         = "gen-uks-prd-hs-mdw-vnet-prd-01"
MDWHsPrdSubnetName       = "gen-uks-prd-hs-mdw-snet-prd-del"

MDWHsUatNetworkingRgName = "data-uks-prd-vnet-uat-rg-01"
MDWHsUatVnetName         = "gen-uks-prd-hs-mdw-vnet-uat-01"
MDWHsUatSubnetName       = "gen-uks-prd-hs-mdw-snet-uat-del"

############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "avmgenprdhsmdwsub01tf"
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

##### KV Diag Settings #####

category20 = "AuditEvent"
category21 = "AzurePolicyEvaluationDetails"
category22 = "AllMetrics"
#### AVM SA PE #################
sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
avmsa_endpoint_name      = "avmgenprdhsmdwsub01tf-pe"
dataprdSubnetName        = "gen-uks-prd-hs-mdw-snet-prd-pep"
dataprdVnetName          = "gen-uks-prd-hs-mdw-vnet-prd-01"
dataprdNetworkingRgName  = "data-uks-prd-vnet-prd-rg-01"
avmsa_endpoint_SC        = "avmgenprdhsmdwsub01tf-pesc"
# is_manual_connection         = "false" //keep default false
sapep_subresource_names = ["blob"]

##### AUX SA PE ######
auxsa_endpoint_name = "genuksprdhsmdwauxsa01-pe"
auxsa_endpoint_SC   = "genuksprdhsmdwauxsa01-pesc"
