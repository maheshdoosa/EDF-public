resource "azurerm_public_ip" "pip" {
  name                    = var.name
  resource_group_name     = var.resource_group_name
  location                = var.location
  allocation_method       = var.allocation_method
  tags                    = var.tags
  ip_version              = var.ip_version
  sku                     = var.sku
  # zones                   = var.zones
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
}
