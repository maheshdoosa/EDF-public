resource "azurerm_virtual_hub" "s2s_vhub" {
  name                   = var.azurerm_virtual_hub_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  virtual_wan_id         = var.virtual_wan_id
  address_prefix         = var.address_prefixes  
  sku                    = var.virtual_hub_sku  
  tags                   = var.tags
}