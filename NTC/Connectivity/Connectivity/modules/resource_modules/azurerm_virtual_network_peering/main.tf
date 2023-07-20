resource "azurerm_virtual_network_peering" "hub_virtual_network_peering" {
  name                         = "${var.spoke_virtual_network_name}-to-${var.hub_virtual_network_name}"
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  allow_virtual_network_access = var.allow_virtual_network_access
  remote_virtual_network_id       = "/subscriptions/${var.hub_subscription_id}/resourceGroups/${var.hub_virtual_network_resource_group_name}/providers/Microsoft.Network/virtualNetworks/${var.hub_virtual_network_name}"
  resource_group_name          = var.spoke_virtual_network_resource_group_name
  virtual_network_name         = var.spoke_virtual_network_name
}