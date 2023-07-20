########### Imported Key vaults ########

module "createTargetRgForKV01" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name01
  resourceLocation  = var.resource_Location01
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault01" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.1.0"
  keyvault_name                   = var.keyvault_name01
  resource_Location               = var.resource_Location01
  resource_group_name             = var.kv_resource_group_name01
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name01
  enabled_for_deployment          = var.enabled_for_deployment01
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption01
  enabled_for_template_deployment = var.enabled_for_template_deployment01
  soft_delete_retention_days      = var.soft_delete_retention_days01
  purge_protection_enabled        = var.purge_protection_enabled01
  # diagnosticsetting_name          = var.diagnosticsetting_name01
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action01
  bypass         = var.bypass01
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createTargetRgForKV01]
}

module "avmkvdiag01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-kv-diagnostic-settings?ref=v1.1.0"

  diag_settings_name         = var.diagnosticsetting_name01
  azurerm_key_vault_id       = data.azurerm_key_vault.Secrets.id
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId01.value
  diagnostic_logs            = var.diagnostic_logs01
  diagnostic_metrics         = var.diagnostic_metrics01
}
module "avmdkvdiag02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-kv-diagnostic-settings?ref=v1.1.0"

  diag_settings_name         = var.diagnosticsetting_name02
  azurerm_key_vault_id       = data.azurerm_key_vault.Secrets.id
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
  diagnostic_logs            = var.diagnostic_logs02
  diagnostic_metrics         = var.diagnostic_metrics02
}
