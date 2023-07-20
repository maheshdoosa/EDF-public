environment = "Production"

cenadtKvName   = "avmeitalzhscenadtsub01kv"
cenadtKvRgName = ".security"

cenadtResourceLocation               = "UK South"
cenadtSubLogsRgName                  = "eit-uks-alz-hs-audit-rg-01"
subLogsSA                            = "eituksalzhsauditsa02"
subLogsSAImmutabilityRetentionPeriod = 403
tenantId                             = "tenantId"                       //key vault secret name as value
SubscriptionId                       = "cenadt-prd-SubscriptionId"      //key vault secret name as value
cenadtContributorSPAppId             = "cenadt-prd-ContributorSPAppId"  //key vault secret name as value
cenadtContributorSPSecret            = "cenadt-prd-ContributorSPSecret" //key vault secret name as value
################# Boot Diag SA #############
lzcenadtHSbootdiagsaRgName  = "eit-uks-alz-hs-vmlogs-rg-01"
lzHubcenadtResourceLocation = "UK South"
vmDiagSAname                = "eitukscenadtvmlogssa01"
sa_endpoint_name            = "eitukscenadtvmlogssa01-pe"
sa_endpoint_SC              = "eitukscenadtvmlogssa01-pesc"
sapep_subresource_names     = ["blob"]
sa_private_dns_zone_name    = "privatelink.blob.core.windows.net"
######### Recovery Services Vault #######
resourceGroupName            = "eit-alz-hs-audit-vmbackup-rg-01"
resourceLocation             = "UK South"
recovery_vault_name          = "eit-alz-hs-audit-vmbackup-rsv-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0
############ Backup Policies #############
infraVM_backup_policy      = "Daily-2200-52W-AppVMs"
vm_backup_policy_timezone  = "UTC"
backup_policy_frequency    = "Daily"
backup_policy_time         = "22:00"
retention_daily_count      = 7
retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday", "Wednesday", "Friday", "Saturday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]
infraVM_backup_policy_02   = "Daily-2300-52W-AppVMs"
backup_policy_time_02      = "23:00"

#################### KV ################################
keyvault_name                   = "e-uks-alz-cenadt-ade-kv"
resource_Location               = "UK South"
kv_resource_group_name          = "eit-uks-alz-cenadt-ade-rg-01"
sku_name                        = "premium" // standard or premium HSM
enabled_for_deployment          = "false"   //true or false
enabled_for_disk_encryption     = "true"    //true or false
enabled_for_template_deployment = "false"   //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none
private_dns_zone_name           = "privatelink.vaultcore.azure.net"
endpoint_name                   = "e-uks-alz-cenadt-ade-kv-pe"
endpoint_SC                     = "e-uks-alz-cenadt-ade-kv-pesc"
is_manual_connection            = "false" //keep default false
subresource_names               = ["vault"]
lzpepNetworkingRgName           = "eit-uks-alz-hs-cenadt-vnet-rg-01"
lzpepVnetName                   = "eit-uks-alz-hs-cenadt-vnet-01"
peSubnetName                    = "eit-alz-hs-cenadt-pep-snet-01"
aad_group                       = "EIT-PRD-RBAC-CenAdtHSSub-Contributor"
aad_user                        = "sai.devarabhotla_accenture.com#EXT#@edfenergynnb.onmicrosoft.com"

############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "avmeitalzhscenadtsub01tf"
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
avmsa_acl              = "Deny"
avmsa_bypass           = ["AzureServices"]
avmsa_routing          = "MicrosoftRouting"
avmsa_publishinternet  = "false"
avmsa_publishmicrosoft = "false"
avmsaca                = "statefiles"
############# subLogsSA SA ####################

subLogsSARgName               = "eit-uks-alz-hs-audit-rg-01"
subLogsSAResourceLocation     = "uksouth"
subLogsSA_accounttier         = "standard"
subLogsSA_storagetype         = "StorageV2"
subLogsSA_accountreptype      = "LRS"
subLogsSA_tlsversion          = "TLS1_2"
subLogsSA_accesstier          = "Hot"
subLogsSA_httpstraffic        = "true"
subLogsSA_publicaccess        = "false"
subLogsSA_hnsenable           = "false"
subLogsSA_nfsv3               = "false"
subLogsSA_largefileshare      = "false"
subLogsSA_acl                 = "Deny"
subLogsSA_bypass              = ["AzureServices"]
subLogsSA_routing             = "MicrosoftRouting"
subLogsSA_publishinternet     = "false"
subLogsSA_publishmicrosoft    = "false"
subLogsSAca                   = "statefiles"
subLogsSA_blobsoftdelete      = "90"
subLogsSA_containersoftdelete = "90"
subLogsSA_sharesoftdelete     = "90"
############# vmDiagSA SA ####################

vmDiagSARgName               = "eit-uks-alz-hs-vmlogs-rg-01"
vmDiagSAResourceLocation     = "uksouth"
vmDiagSA                     = "eitukscenadtvmlogssa01"
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
vmDiagSA_acl                 = "Deny"
vmDiagSA_bypass              = ["AzureServices"]
vmDiagSA_routing             = "MicrosoftRouting"
vmDiagSA_publishinternet     = "false"
vmDiagSA_publishmicrosoft    = "false"
vmDiagSAca                   = "statefiles"
vmDiagSA_blobsoftdelete      = "90"
vmDiagSA_containersoftdelete = "90"
vmDiagSA_sharesoftdelete     = "90"

subLogsSA_endpoint_name = "eituksalzhsauditsa02-pe"
subLogsSA_endpoint_SC   = "eituksalzhsauditsa02-pesc"

avmsa_endpoint_name = "avmeitalzhscenadtsub01tf-pe"
avmsa_endpoint_SC   = "avmeitalzhscenadtsub01tf-pesc"


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
