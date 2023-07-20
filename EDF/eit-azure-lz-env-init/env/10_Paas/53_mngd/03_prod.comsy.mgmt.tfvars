########### Comsy Prod TFVARS ##############

environment             = "High Secured Managed"
managedGenHSKvName      = "avmgenprdhsmngdsub01kv"
managedGenHSKvRgName    = ".security"
ComsyHSResourceLocation = "UK South"


######### Recovery Services Vault #######

ComsyHS_recovery_vault_name   = "gen-uks-prd-hs-vmbackup-rsv-01"
ComsyHS_rsv_resourceGroupName = "gen-uks-hs-prd-vmbackup-rg-01"
sku                           = "standard"
soft_delete_enabled           = true
log_analytics_workspace_name  = "rsv_logs"
log_category                  = "CoreAzureBackup"
log_category_enabled          = true
log_category_retention        = true
log_category_retention_days   = 0

############ Backup Policies #############

infraVM_backup_policy_01   = "Daily-2200-52W-AppVMs"
infraVM_backup_policy_02   = "Daily-2300-52W-AppVMs"
vm_backup_policy_timezone  = "UTC"
backup_policy_frequency    = "Daily"
backup_policy_time_01      = "22:00"
backup_policy_time_02      = "23:00"
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


#################### KV ################################

ComsyHS_keyvault_name           = "g-uks-prd-hs-cms-ade-kv"
ComsyHS_kv_resourceGroupName    = "gen-uks-prd-hs-comsy-ade-rg-01"
sku_name                        = "standard" // standard or premium HSM
enabled_for_deployment          = "false"    //true or false
enabled_for_disk_encryption     = "true"     //true or false
enabled_for_template_deployment = "false"    //true or false
soft_delete_retention_days      = "90"
purge_protection_enabled        = "true" //true
diagnosticsetting_name          = "keyVault-diagnostics"
default_action                  = "Deny"          //Allow will enable access to all networks
bypass                          = "AzureServices" //none

ComsyHSPrivateDNSRgName = "gen-uks-prd-hs-apex-pdns-rg" //Apex DNS Zone RG Name
private_dns_zone_name   = "privatelink.vaultcore.azure.net"

vnet_dns_link_name        = "gen-uks-prd-hs-comsy-pdns-link"
ComsyHs_Prd_endpoint_name = "gen-uks-prd-hs-comsy-ade-kv-pe"
ComsyHs_Prd_endpoint_SC   = "gen-uks-prd-hs-comsy-ade-kv-pesc"
is_manual_connection      = "false" //keep default false
subresource_names         = ["vault"]

ComsyHsPrdNetworkingRgName = "gen-uks-prd-hs-managed-vnet-rg-01"
ComsyHsPrdVnetName         = "gen-uks-prd-hs-managed-vnet-01"
ComsyHsPrdSubnetName       = "gen-uks-prd-hs-comsy-snet-01"

############## SQL DB ##############
comsySQLPaaSRgName = "gen-uks-prd-hs-managed-comsy-rg-01"
# ComsyHSResourceLocation            = "UK South"
comsySQLServerName                 = "genuksprdhsqlsvr01"
comsySqlServerVersion              = "12.0"
comsySqlPrivateEndpointDecision    = "true"
comsySqlDBNames                    = ["genuksprdhscomsydb01"]
comsySqldbname                     = "genuksprdhscomsydb01"
comsySqlDBMaxSize                  = "4"
comsySqlDBSkuName                  = "GP_Gen5_2"
comsySqlDBZoneRedundantDecision    = "true"
comsySqlDBFailoverDecision         = "false"
comsySqlDBFailoverLocation         = "null"
endpointFailoverPolicyModeDecision = "Automatic"
privateEndpointSubnetName          = "gen-uks-prd-hs-comsy-snet-01"
privateEndpointVNETName            = "gen-uks-prd-hs-managed-vnet-01"
privateEndpointVNETRgName          = "gen-uks-prd-hs-managed-vnet-rg-01"
comsySQLEndPointName               = "genuksprdhsqlsvr01-pe-01"
privateEndpointSubResourceName     = ["sqlServer"]
comsySQLServiceConnName            = "genuksprdhsqlsvr01sc"
azuread_authentication_only        = "false"
sqldbazureadgroup                  = "GEN-PRD-RBAC-SQLDB-AzAdmin"


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

category16 = "SQLSecurityAuditEvents"
category17 = "SQLInsights"
category18 = "Errors"
category19 = "AutomaticTuning"
category20 = "DatabaseWaitStatistics"
category21 = "Deadlocks"
category22 = "DevOpsOperationsAudit"
category23 = "Blocks"
category24 = "QueryStoreRuntimeStatistics"
category25 = "QueryStoreWaitStatistics"
category26 = "SQLInsights"
category27 = "Timeouts"
category28 = "Basic"
category29 = "InstanceAndAppAdvanced"
category30 = "WorkloadManagement"

##### KV Diag Settings #####

category31 = "AuditEvent"
category32 = "AzurePolicyEvaluationDetails"
category33 = "AllMetrics"
