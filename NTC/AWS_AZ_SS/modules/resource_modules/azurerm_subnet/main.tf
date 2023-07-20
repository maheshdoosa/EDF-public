resource "azurerm_subnet" "subnet" {
  name                                           = var.azurerm_subnet_name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = var.address_prefixes
 
  # dynamic "delegation" {
  #   for_each = [for del in var.delegation : {
  #     servicename = del.servicename
  #     actions     = del.actions
  #   }]
  #   content {
  #     name = format("%s${var.separator}%s${var.separator}%s", var.name, "delegation", delegation.key)
  #     service_delegation {
  #       name    = delegation.value.servicename
  #       actions = delegation.value.actions
  #     }
  #   }
  # }
}
