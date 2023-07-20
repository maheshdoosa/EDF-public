
########### Backup ###########

data "azurerm_client_config" "current" {}

data "azurerm_log_analytics_workspace" "Laworkspace" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.La_resource_group_name
}

data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
  resource_id = module.az-recoveryservicevault.recovery_services_vault.id
}
