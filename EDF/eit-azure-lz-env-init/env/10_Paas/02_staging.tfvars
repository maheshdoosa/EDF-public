######### Recovery Services Vault #######
environment                  = "Sandbox"
rsvname                      = "rsvtest01"
resourceLocation             = "uksouth"
resourceGroupName            = "TestRGback01"
sku                          = "Standard"
soft_delete_enabled          = false //true
log_analytics_workspace_name = "loganalytics01"
log_category                 = "CoreAzureBackup"
log_category_enabled         = true
log_category_retention       = true
log_category_retention_days  = 0
LaName                       = "eit-uks-stg-loganalytics-ws-01"
La_resource_group_name       = "eit-uks-stg-update-rg"

############ Backup Policies #############

infraVM_backup_policy     = "Daily-2200-52W-InfraVM"
recovery_vault_name       = "rsvtest01"
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

############ VM Backup ###########

vmName              = "backup001"
resource_group_name = "backup01"
