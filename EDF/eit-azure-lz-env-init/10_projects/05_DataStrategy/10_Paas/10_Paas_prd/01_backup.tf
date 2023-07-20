
################ Prodution Resources ###############

################ Resource Group - MDWHs PROD Backup Vault #############
module "create-Target-Rg-MDWHs-Prd-RSV" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsPrdRSVRgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Prd-RSVTags.tagsResult
}

################ MDWHs Prd Recovery Service Vault #############

module "create-MDWHs-Prd-RSV" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-recoveryservicevault?ref=v1.1.7"
  rsvname             = var.MDWHsPrdRSVName
  resourceLocation    = var.MDWHsResourceLocation
  resourceGroupName   = var.MDWHsPrdRSVRgName
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  # log_analytics_workspace_name = var.RSV_diagnosticsetting_name
  # recovery_services_vault_id   = module.create-MDWHs-Prd-RSV.recovery_services_vault.id
  # log_analytics_workspace_id   = data.azurerm_key_vault_secret.laworkspaceId.value //
  # log_category                 = var.log_category
  # log_category_enabled         = var.log_category_enabled
  # log_category_retention       = var.log_category_retention
  # log_category_retention_days  = var.log_category_retention_days
  depends_on     = [module.create-Target-Rg-MDWHs-Prd-RSV, ]
  additionalTags = module.MDWHs-Prd-RSVTags.tagsResult
}

module "rsv-diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.create-MDWHs-Prd-RSV]
}

module "create-MDWHs-Prd-backup-policy_01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"
  infraVM_backup_policy     = var.MDWHs_infraVM_backup_policy_01
  resourceGroupName         = var.MDWHsPrdRSVRgName
  recovery_vault_name       = var.MDWHsPrdRSVName
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

  depends_on = [module.create-MDWHs-Prd-RSV]
}

module "create-MDWHs-Prd-backup-policy_02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"
  infraVM_backup_policy     = var.MDWHs_infraVM_backup_policy_02
  resourceGroupName         = var.MDWHsPrdRSVRgName
  recovery_vault_name       = var.MDWHsPrdRSVName
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
  depends_on                 = [module.create-MDWHs-Prd-RSV]
}


################ UAT Resources ###############

################ Resource Group - MDWHs UAT Backup Vault #############
module "create-Target-Rg-MDWHs-Uat-RSV" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.MDWHsUatRSVRgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Uat-RSVTags.tagsResult
}

################ MDWHs Uat Recovery Service Vault #############

module "create-MDWHs-Uat-RSV" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-recoveryservicevault?ref=v1.1.7"
  rsvname             = var.MDWHsUatRSVName
  resourceLocation    = var.MDWHsResourceLocation
  resourceGroupName   = var.MDWHsUatRSVRgName
  sku                 = var.sku
  soft_delete_enabled = var.soft_delete_enabled
  # log_analytics_workspace_name = var.RSV_diagnosticsetting_name
  # recovery_services_vault_id   = module.create-MDWHs-Uat-RSV.recovery_services_vault.id
  # log_analytics_workspace_id   = data.azurerm_key_vault_secret.laworkspaceId.value //
  # log_category                 = var.log_category
  # log_category_enabled         = var.log_category_enabled
  # log_category_retention       = var.log_category_retention
  # log_category_retention_days  = var.log_category_retention_days
  depends_on     = [module.create-Target-Rg-MDWHs-Uat-RSV, ]
  additionalTags = module.MDWHs-Uat-RSVTags.tagsResult
}



module "create-MDWHs-Uat-backup-policy_01" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"
  infraVM_backup_policy     = var.MDWHs_infraVM_backup_policy_01
  resourceGroupName         = var.MDWHsUatRSVRgName
  recovery_vault_name       = var.MDWHsUatRSVName
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

  depends_on = [module.create-MDWHs-Uat-RSV]
}

module "create-MDWHs-Uat-backup-policy_02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy?ref=v1.1.19"
  infraVM_backup_policy     = var.MDWHs_infraVM_backup_policy_02
  resourceGroupName         = var.MDWHsUatRSVRgName
  recovery_vault_name       = var.MDWHsUatRSVName
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
  depends_on                 = [module.create-MDWHs-Uat-RSV]
}
