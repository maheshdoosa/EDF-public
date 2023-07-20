environment               = "Live"
lzTransitSubLogsRgName    = "eit-uks-alz-transit-auditlogs-rg"
lzTransitResourceLocation = "uksouth"

subLogsSA = "eituksalztrnauditsa02"

subLogsSAImmutabilityRententionPeriod = 403

transitKvName   = "eitlztransitkv"
transitKvRgName = ".security"


######### Recovery Services Vault #######

recovery_vault_name         = "eit-uks-alz-vmbackup-rsv-01"
resourceLocation            = "UK South"
resourceGroupName           = "eit-uks-alz-vmbackup-rg"
sku                         = "Standard"
soft_delete_enabled         = true
log_category                = "CoreAzureBackup"
log_category_enabled        = true
log_category_retention      = true
log_category_retention_days = 0
//La_resource_group_name       = "eit-uks-alz-hs-loga-rg"
log_analytics_workspace_name = "loganalytics"

############ Backup Policies #############

infraVM_backup_policy      = "Daily-2200-52W-InfraVM"
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

############# AVM SA ####################

avmsaRgName            = ".terraformBootstrap"
avmsaResourceLocation  = "UK South"
avmsa                  = "tfstateprodtransit"
avmsa_accounttier      = "standard"
avmsa_storagetype      = "StorageV2"
avmsa_accountreptype   = "RAGRS"
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



resource_Location01               = "uksouth"
kv_resource_group_name02          = "eit-alz-alz-transit-expressroute-rg"
keyvault_name02                   = "eitukshsexpressroutekv01"
sku_name02                        = "standard" // standard or premium HSM
enabled_for_deployment02          = "false"    //true or false   #need to check
enabled_for_disk_encryption02     = "false"    //true or false
enabled_for_template_deployment02 = "false"    //true or false   #need to check
soft_delete_retention_days02      = "90"
purge_protection_enabled02        = "true" //false //true
# diagnosticsetting_name02          = "keyVault-diagnostics"
default_action02 = "Allow"         // Allow will enable access to all networks
bypass02         = "AzureServices" //none

category21 = "AuditEvent"
category22 = "AzurePolicyEvaluationDetails"
category23 = "AllMetrics"

environment01 = "transit"
#### AVM SA PE #################
sa_private_dns_zone_name = "privatelink.blob.core.windows.net"
avmsa_endpoint_name      = "tfstateprodtransit-pe"
transitSubnetName        = "gen-uks-tst-hs-eam-pep-snet-01" // need to check and update
transitVnetName          = "eit-uks-alz-transit-vnet-01"
transitNetworkingRgName  = "eit-uks-alz-transit-vnet-rg"
avmsa_endpoint_SC        = "tfstateprodtransit-pesc"
is_manual_connection     = "false" //keep default false
sapep_subresource_names  = ["blob"]
