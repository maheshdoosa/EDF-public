resource "azurerm_vpn_gateway" "s2s_vpn" {
  name                = var.azurerm_vpn_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  virtual_hub_id      = var.virtual_hub_id
}