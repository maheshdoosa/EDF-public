environment = "Sandpit"

avdSSKvName   = "emersonvmtest"
avdSSKvRgName = ".security"

######### Recovery Services Vault #######

recovery_vault_name          = "cus-uks-prd-ss-vmbackup-rsv-01"
resourceLocation             = "uksouth"
resourceGroupName            = "cus-uks-prd-ss-vmbackup-rg-01"
sku                          = "Standard"
soft_delete_enabled          = true
log_analytics_workspace_name = "loganalytics"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-InfaVMs"
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

infraVM_backup_policy_02 = "Daily-2300-52W-InfraVMs"
backup_policy_time_02    = "23:00"
