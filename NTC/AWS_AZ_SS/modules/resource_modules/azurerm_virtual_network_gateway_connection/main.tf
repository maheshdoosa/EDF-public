resource "azurerm_virtual_network_gateway_connection" "vgtw-connection" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  type                          = var.connection_type
  connection_mode               = var.connection_mode 
  virtual_network_gateway_id    = var.virtual_network_gateway_id
  local_network_gateway_id      = var.local_network_gateway_id
  shared_key                    = var.shared_key
  tags                          = var.tags
}