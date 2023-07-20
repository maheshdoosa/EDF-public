KvName   = "avmgentsthsmngdsub01kv"
KvRgName = ".security"

######### Recovery Services Vault #######
environment                  = "High Secured Managed"
recovery_vault_name          = "gen-uks-dev-hs-dtgw-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "gen-uks-dev-hs-dtgw-vmbackup-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-AppVMs"
vm_backup_policy_timezone = "UTC"

backup_policy_frequency = "Daily"
backup_policy_time      = "22:00"
retention_daily_count   = 7

retention_weekly_count     = 52
retention_weekly_weekdays  = ["Sunday"]
retention_monthly_count    = 12
retention_monthly_weekdays = ["Sunday", "Wednesday"]
retention_monthly_weeks    = ["First", "Last"]
retention_yearly_count     = 1
retention_yearly_weekdays  = ["Sunday"]
retention_yearly_weeks     = ["Last"]
retention_yearly_months    = ["January"]

infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
backup_policy_time_02    = "23:00"


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
