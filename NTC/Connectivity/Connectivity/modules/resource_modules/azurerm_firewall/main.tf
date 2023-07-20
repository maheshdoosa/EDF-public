resource "azurerm_firewall" "firewall" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  sku_tier            = var.sku_tier
  firewall_policy_id  = "/subscriptions/${var.policy_subscription_id}/resourceGroups/${var.policy_resource_group_name}/providers/Microsoft.Network/firewallPolicies/${var.policy_name}"
  dns_servers         = var.dns_servers
  private_ip_ranges   = var.private_ip_ranges
  # threat_intel_mode   = var.threat_intel_mode
  zones               = var.zones
  tags                = var.tags
  dynamic "virtual_hub" {
    for_each = var.virtual_hub != null ? [var.virtual_hub] : []
    content {
      virtual_hub_id  = virtual_hub.value.virtual_hub_id
      public_ip_count = virtual_hub.value.public_ip_count
    }
  }
  ip_configuration {
    name                  = var.ip_configuration_name
    subnet_id             = var.subnet_id
    public_ip_address_id  = var.public_ip_id
  }
  dynamic "management_ip_configuration" {
    for_each = var.management_ip_configuration != null ? [var.management_ip_configuration] : []
    content {
      name                 = management_ip_configuration.value.name
      subnet_id            = management_ip_configuration.value.subnet_id
      public_ip_address_id = management_ip_configuration.value.public_ip_address_id
    }
  }
}
module "monitor_diagnostic_settings" {
  source                                      = "../azurerm_monitor_diagnostic_setting"
  count                                       = var.monitor_diagnostic_settings_name != null ? 1 : 0

  name                                        = var.monitor_diagnostic_settings_name 
  target_resource_id                          = azurerm_firewall.firewall.id
  log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
  log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_name                = var.log_analytics_workspace_name
}