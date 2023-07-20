resource "azurerm_virtual_network_gateway" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = var.type
  vpn_type            = var.vpn_type
  active_active       = var.active_active
  enable_bgp          = var.enable_bgp
  sku                 = var.sku
  ip_configuration {
    name                          = var.ip_configuration_name
    public_ip_address_id          = var.public_ip_id
    private_ip_address_allocation = var.private_ip_address_allocation
    subnet_id                     = var.subnet_id
  }
  vpn_client_configuration {
    address_space        = var.address_space
    aad_tenant           = var.aad_tenant 
    aad_audience         = var.aad_audience 
    aad_issuer           = var.aad_issuer 
    vpn_auth_types       = var.vpn_auth_types
    vpn_client_protocols = var.vpn_client_protocols
    # root_certificate {
    #   name             = var.root_certificate_name
    #   public_cert_data = var.public_cert_data
    # }
  }
}
module "monitor_diagnostic_settings" {
  source                                      = "../azurerm_monitor_diagnostic_setting"
  count                                       = var.monitor_diagnostic_settings_name != null ? 1 : 0

  name                                        = var.monitor_diagnostic_settings_name 
  target_resource_id                          = azurerm_virtual_network_gateway.vnet.id
  log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
  log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
  log_analytics_workspace_name                = var.log_analytics_workspace_name
}