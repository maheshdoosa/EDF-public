resource "azurerm_virtual_wan" "s2s_vwan" {
  name                = var.azurerm_virtual_wan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  type                = var.type
  tags                = var.tags
}