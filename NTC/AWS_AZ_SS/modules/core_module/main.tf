
module "networks" {
  source               = "./../resource_modules/azurerm_vnet"
  virtual_network_name = var.region.virtual_network_name
  location             = var.region.location
  resource_group_name  = var.region.resource_group_name
  address_space        = var.region.address_space
  tags                 = local.tags
}
module "subnet" {
  depends_on           = [module.networks]
  source               = "./../resource_modules/azurerm_subnet"
  azurerm_subnet_name  = var.region.azurerm_subnet_name
  resource_group_name  = var.region.resource_group_name
  virtual_network_name = var.region.virtual_network_name
  address_prefixes     = var.region.address_prefixes
}
module "azurerm_public_ip" {
  depends_on              = [module.subnet]
  source                  = "./../resource_modules/azurerm_public_ip"
  name                    = var.region.azurerm_public_ip_name
  resource_group_name     = var.region.resource_group_name
  location                = var.region.location
  allocation_method       = var.region.allocation_method
  ip_version              = var.region.ip_version
  sku                     = var.region.public_ip_sku
  idle_timeout_in_minutes = var.region.idle_timeout_in_minutes
  tags                    = local.tags
}
module "azurerm_virtual_network_gateway" {
  depends_on                    = [module.azurerm_public_ip, module.subnet]
  source                        = "./../resource_modules/azurerm_virtual_network_gateway"
  name                          = var.region.azurerm_virtual_network_gateway_name
  resource_group_name           = var.region.resource_group_name
  location                      = var.region.location
  type                          = var.region.network_gateway_type
  vpn_type                      = var.region.vpn_type
  active_active                 = var.region.active_active
  sku                           = var.region.network_gateway_sku
  enable_bgp                    = var.region.enable_bgp
  ip_configuration_name         = var.region.ip_configuration_name
  public_ip_id                  = module.azurerm_public_ip.id
  private_ip_address_allocation = var.region.private_ip_address_allocation
  subnet_id                     = module.subnet.subnet_id
  tags                          = local.tags
}
module "azurerm_route_table" {
  depends_on = [ module.azurerm_public_ip ]
  source                        = "./../resource_modules/azurerm_route"
  route_table_name              = var.region.route_table_name
  resource_group_name           = var.region.resource_group_name
  location                      = var.region.location
  disable_bgp_route_propagation = var.region.disable_bgp_route_propagation
  routes                        = var.region.routes
  tags                          = local.tags
}
module "azurerm_local_network_gateway_primary" {
  depends_on = [ module.azurerm_virtual_network_gateway ]
  source              = "./../resource_modules/azurerm_local_network_gateway"
  name                = var.region.local_network_gateway_primary_name
  resource_group_name = var.region.resource_group_name
  location            = var.region.location
  gateway_address     = var.region.gateway_address_primary
  address_space       = var.region.lng_address_space
  tags                = local.tags
}
module "azurerm_local_network_gateway_standby" {
  depends_on = [ module.azurerm_virtual_network_gateway ]
  source              = "./../resource_modules/azurerm_local_network_gateway"
  name                = var.region.local_network_gateway_standby_name
  resource_group_name = var.region.resource_group_name
  location            = var.region.location
  gateway_address     = var.region.gateway_address_standby
  address_space       = var.region.lng_address_space
  tags                = local.tags
}
module "gateway_connection_primary" {
  depends_on = [ module.azurerm_local_network_gateway_primary ]
  source                      = "./../resource_modules/azurerm_virtual_network_gateway_connection"
  name                        = var.region.lng_gateway_connection_primary_name
  location                    = var.region.location
  resource_group_name         = var.region.resource_group_name
  connection_type             = var.region.lng_connection_type
  connection_mode             = var.region.lng_connection_mode
  virtual_network_gateway_id  = module.azurerm_virtual_network_gateway.id
  local_network_gateway_id    = module.azurerm_local_network_gateway_primary.id
  shared_key                  = var.region.shared_key_primary
  tags                        = local.tags
}
module "gateway_connection_standby" {
  depends_on = [ module.azurerm_local_network_gateway_standby ]
  source                      = "./../resource_modules/azurerm_virtual_network_gateway_connection"
  name                        = var.region.lng_gateway_connection_standby_name
  location                    = var.region.location
  resource_group_name         = var.region.resource_group_name
  connection_type             = var.region.lng_connection_type
  connection_mode             = var.region.lng_connection_mode
  virtual_network_gateway_id  = module.azurerm_virtual_network_gateway.id
  local_network_gateway_id    = module.azurerm_local_network_gateway_standby.id
  shared_key                  = var.region.shared_key_standby
  tags                        = local.tags
}