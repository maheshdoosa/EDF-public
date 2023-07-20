################ Resource Group - managementSs AD #############
module "createTargetRgForBackup" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.resourceGroupName
  resourceLocation  = var.resourceLocation

  additionalTags = module.recoveryServiceVaultTags.tagsResult
}

module "az-recoveryservicevault" {
  source                       = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-recoveryservicevault"
  rsvname                      = var.recovery_vault_name
  resourceLocation             = var.resourceLocation
  resourceGroupName            = var.resourceGroupName
  sku                          = var.sku
  soft_delete_enabled          = var.soft_delete_enabled
  log_analytics_workspace_name = var.log_analytics_workspace_name
  recovery_services_vault_id   = module.az-recoveryservicevault.recovery_services_vault.id
  log_analytics_workspace_id   = data.azurerm_log_analytics_workspace.Laworkspace.id
  log_category                 = var.log_category
  log_category_enabled         = var.log_category_enabled
  log_category_retention       = var.log_category_retention
  log_category_retention_days  = var.log_category_retention_days
  depends_on                   = [module.createTargetRgForBackup]

  additionalTags = module.recoveryServiceVaultTags.tagsResult
}

module "backup_policy" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy"
  infraVM_backup_policy     = var.infraVM_backup_policy
  resourceGroupName         = var.resourceGroupName
  recovery_vault_name       = var.recovery_vault_name
  vm_backup_policy_timezone = var.vm_backup_policy_timezone

  backup_policy_frequency = var.backup_policy_frequency
  backup_policy_time      = var.backup_policy_time
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

  depends_on = [module.az-recoveryservicevault]
}

module "backup_policy_02" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-backup-policy"
  infraVM_backup_policy     = var.infraVM_backup_policy_02
  resourceGroupName         = var.resourceGroupName
  recovery_vault_name       = var.recovery_vault_name
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

  depends_on = [module.az-recoveryservicevault]
}

resource "azurerm_backup_protected_vm" "vm1" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "ssdc02" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm2_id
  backup_policy_id    = local.backup_policy02_id

  depends_on = [module.backup_policy_02]
}

resource "azurerm_backup_protected_vm" "caweb01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm3_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "caweb02" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm4_id
  backup_policy_id    = local.backup_policy02_id

  depends_on = [module.backup_policy_02]
}

resource "azurerm_backup_protected_vm" "sica01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm5_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "sica02" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm6_id
  backup_policy_id    = local.backup_policy02_id

  depends_on = [module.backup_policy_02]
}

resource "azurerm_backup_protected_vm" "srca01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm7_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "sswac01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm8_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "sswac02" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm9_id
  backup_policy_id    = local.backup_policy02_id

  depends_on = [module.backup_policy_02]
}

resource "azurerm_backup_protected_vm" "sswus01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm10_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "smid01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm11_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}

resource "azurerm_backup_protected_vm" "afs01" {
  resource_group_name = var.resourceGroupName
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = local.source_vm12_id
  backup_policy_id    = local.backup_policy_id

  depends_on = [module.backup_policy]
}
