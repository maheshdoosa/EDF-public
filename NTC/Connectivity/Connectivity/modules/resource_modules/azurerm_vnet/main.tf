locals {
  is_ddos_enabled = var.is_ddos_enabled ? [{}] : []
}
resource "azurerm_network_ddos_protection_plan" "ddos" {
  count               = var.is_ddos_enabled ? 1 : 0
  name                = format("%s${var.separator}%s", var.name, "ddos")
  location            = var.location
  resource_group_name = var.resource_group_name
}
resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
  dynamic "ddos_protection_plan" {
    for_each = local.is_ddos_enabled
    content {
      id     = azurerm_network_ddos_protection_plan.ddos[0].id
      enable = true
    }
  }
}
module "monitor_diagnostic_settings" {
  source                                      = "../azurerm_monitor_diagnostic_setting"
  count                                       = var.monitor_diagnostic_settings_name != null ? 1 : 0

  name                                        = var.monitor_diagnostic_settings_name 
  target_resource_id                          = azurerm_virtual_network.vnet.id
  log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
  log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_name                = var.log_analytics_workspace_name
}