resource "azurerm_bastion_host" "bastion" {
  name                   = var.name
  location               = var.location
  resource_group_name    = var.resource_group_name
  sku                    = var.sku
  copy_paste_enabled     = var.copy_paste_enabled
  file_copy_enabled      = var.file_copy_enabled
  ip_connect_enabled     = var.ip_connect_enabled
  scale_units            = var.scale_units
  shareable_link_enabled = var.shareable_link_enabled
  tunneling_enabled      = var.tunneling_enabled
  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
  tags = var.tags
}
module "monitor_diagnostic_settings" {
  source                                      = "../azurerm_monitor_diagnostic_setting"
  count                                       = var.monitor_diagnostic_settings_name != null ? 1 : 0

  name                                        = var.monitor_diagnostic_settings_name 
  target_resource_id                          = azurerm_bastion_host.bastion.id
  log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
  log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_name                = var.log_analytics_workspace_name
}