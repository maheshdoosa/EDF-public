resource "azurerm_public_ip" "pip" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  allocation_method       = var.allocation_method
  tags                    = var.tags
  ip_version              = var.ip_version
  sku                     = var.sku
  zones                   = var.zones
  sku_tier                = var.sku_tier
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  domain_name_label       = var.domain_name_label
  reverse_fqdn            = var.reverse_fqdn
  public_ip_prefix_id     = var.public_ip_prefix_id
  ip_tags                 = var.ip_tags
}
module "monitor_diagnostic_settings" {
  source                                      = "../azurerm_monitor_diagnostic_setting"
  count                                       = var.monitor_diagnostic_settings_name != null ? 1 : 0

  name                                        = var.monitor_diagnostic_settings_name 
  target_resource_id                          = azurerm_public_ip.pip.id
  log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
  log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_name                = var.log_analytics_workspace_name
}