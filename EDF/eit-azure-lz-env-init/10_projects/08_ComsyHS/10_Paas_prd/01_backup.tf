################ Resource Group - Comsy Prod RSV #############
module "createTargetRgForBackup" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ComsyHS_rsv_resourceGroupName
  resourceLocation  = var.ComsyHSResourceLocation

  additionalTags = module.ComsyHs-Prd-rsv-resourceGroupTags.tagsResult
}

module "ComsyHS_recovery_vault" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-recoveryservicevault?ref=v1.1.7"
  rsvname             = var.ComsyHS_recovery_vault_name
  resourceLocation    = var.ComsyHSResourceLocation
  resourceGroupName   = var.ComsyHS_rsv_resourceGroupName
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  # log_analytics_workspace_name = var.RSV_diagnosticsetting_name
  # recovery_services_vault_id   = module.ComsyHS_recovery_vault.recovery_services_vault.id
  # log_analytics_workspace_id   = data.azurerm_key_vault_secret.laworkspaceResourceId.value
  # log_category                 = var.log_category
  # log_category_enabled         = var.log_category_enabled
  # log_category_retention       = var.log_category_retention
  # log_category_retention_days  = var.log_category_retention_days
  depends_on = [module.createTargetRgForBackup]

  additionalTags = module.ComsyHs-Prd-rsv-Tags.tagsResult
}
module "rsv-diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.ComsyHS_recovery_vault]
}

module "backup_policy_01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"
  infraVM_backup_policy     = var.infraVM_backup_policy_01
  resourceGroupName         = var.ComsyHS_rsv_resourceGroupName
  recovery_vault_name       = var.ComsyHS_recovery_vault_name
  vm_backup_policy_timezone = var.vm_backup_policy_timezone

  backup_policy_frequency = var.backup_policy_frequency
  backup_policy_time      = var.backup_policy_time_01
  retention_daily_count   = var.retention_daily_count

  retention_weekly_count     = var.retention_weekly_count
  retention_weekly_weekdays  = var.retention_weekly_weekdays
  retention_monthly_count    = var.retention_monthly_count
  retention_monthly_weekdays = var.retention_monthly_weekdays
  retention_monthly_weeks    = var.retention_monthly_weeks
  retention_yearly_count     = var.retention_yearly_count
  retention_yearly_weekdays  = var.retention_yearly_weekdays
  retention_yearly_weeks     = var.retention_yearly_weeks
  retention_yearly_months    = var.retention_yearly_months

  depends_on = [module.ComsyHS_recovery_vault]
}

module "backup_policy_02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"
  infraVM_backup_policy     = var.infraVM_backup_policy_02
  resourceGroupName         = var.ComsyHS_rsv_resourceGroupName
  recovery_vault_name       = var.ComsyHS_recovery_vault_name
  vm_backup_policy_timezone = var.vm_backup_policy_timezone

  backup_policy_frequency = var.backup_policy_frequency
  backup_policy_time      = var.backup_policy_time_02
  retention_daily_count   = var.retention_daily_count

  retention_weekly_count     = var.retention_weekly_count
  retention_weekly_weekdays  = var.retention_weekly_weekdays
  retention_monthly_count    = var.retention_monthly_count
  retention_monthly_weekdays = var.retention_monthly_weekdays
  retention_monthly_weeks    = var.retention_monthly_weeks
  retention_yearly_count     = var.retention_yearly_count
  retention_yearly_weekdays  = var.retention_yearly_weekdays
  retention_yearly_weeks     = var.retention_yearly_weeks
  retention_yearly_months    = var.retention_yearly_months

  depends_on = [module.ComsyHS_recovery_vault]
}
