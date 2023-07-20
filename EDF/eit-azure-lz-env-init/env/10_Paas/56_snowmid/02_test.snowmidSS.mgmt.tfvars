# environment                     = "Test"
# lzHubNetworkingResourceLocation = "uksouth"
# lzmanagedSSVmLogsRgName         = "gen-uks-tst-ss-vmlogs-rg-01"
# lzHubManagedResourceLocation    = "uksouth"

# vmDiagSA = "genukststssvmlogssa02"

# managedSSKvName   = "avmgentstssmngdsub01kv"
# managedSSKvRgName = ".security"

# ######### Recovery Services Vault #######

# recovery_vault_name          = "gen-uks-tst-ss-vmbackup-rsv-01"
# resourceLocation             = "UK South"
# resourceGroupName            = "gen-uks-tst-ss-vmbackup-rg-01"
# sku                          = "Standard"
# soft_delete_enabled          = true
# log_analytics_workspace_name = "loganalytics"
# log_category                 = "CoreAzureBackup"
# log_category_enabled         = true
# log_category_retention       = true
# log_category_retention_days  = 0
# LaName                       = "eit-uks-alz-ss-loga-01"
# La_resource_group_name       = "eit-uks-alz-ss-loga-rg"

# ############ Backup Policies #############

# infraVM_backup_policy     = "Daily-2200-52W-AppVMs"
# vm_backup_policy_timezone = "UTC"

# backup_policy_frequency = "Daily"
# backup_policy_time      = "22:00"
# retention_daily_count   = 7

# retention_weekly_count     = 52
# retention_weekly_weekdays  = ["Sunday", "Wednesday", "Friday", "Saturday"]
# retention_monthly_count    = 12
# retention_monthly_weekdays = ["Sunday", "Wednesday"]
# retention_monthly_weeks    = ["First", "Last"]
# retention_yearly_count     = 1
# retention_yearly_weekdays  = ["Sunday"]
# retention_yearly_weeks     = ["Last"]
# retention_yearly_months    = ["January"]

# infraVM_backup_policy_02 = "Daily-2300-52W-AppVMs"
# backup_policy_time_02    = "23:00"

# ############ VM Backup ###########

# vmName              = "genukststams01"
# resource_group_name = "gen-uks-tst-ss-ams-rg-01"
