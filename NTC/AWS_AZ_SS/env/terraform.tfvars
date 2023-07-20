tfvars = {
  subscription_id = "aa2950c5-4c1e-41b7-ad10-38537bf033b1"
  tenant_id       = "191bf9b4-af72-44f9-825d-81b189aa4d38"
}
region = {

  location                                      = "uksouth"
  resource_group_name                           = "rg-hub-cpl-cn-uks-01"
  virtual_network_name                          = "vnet-S2SvpnAWS-cpl-cn-uks-01"
  address_space                                 = ["10.64.8.0/24"]
  azurerm_subnet_name                           = "GatewaySubnet"
  address_prefixes                              = ["10.64.8.0/24"]
  azurerm_public_ip_name                        = "pip-S2SvpnAWS-cpl-cn-uks-01"
  allocation_method                             = "Static"
  ip_version                                    = "IPv4"
  public_ip_sku                                 = "Standard"
  idle_timeout_in_minutes                       = "30"
  azurerm_public_ip_zones                       = ["1"]
  azurerm_virtual_network_gateway_name          = "vgw-S2SvpnAWS-cpl-cn-uks-01"
  network_gateway_type                          = "Vpn"
  vpn_type                                      = "RouteBased"
  active_active                                 = false
  network_gateway_sku                           = "VpnGw2AZ"
  enable_bgp                                    = false
  ip_configuration_name                         = "IPConfiguration"
  private_ip_address_allocation                 = "Dynamic"
  local_network_gateway_primary_name            = "lng-S2SvpnAWS-cpl-cn-uks-01-primary"
  gateway_address_standby                       = "3.8.246.208" // need to update
  local_network_gateway_standby_name            = "lng-S2SvpnAWS-cpl-cn-uks-01-standby"
  gateway_address_primary                       = "35.178.51.0" // need to update
  lng_address_space                             = ["172.16.48.0/21"]
  lng_gateway_connection_primary_name           = "conn-S2SvpnAWS-cpl-cn-uks-01-primary"
  shared_key_primary                            = "6SMS_Wt299afGiPQs6ijxheIGLZBU7O4" // need to update
  lng_gateway_connection_standby_name           = "conn-S2SvpnAWS-cpl-cn-uks-01-standby"
  shared_key_standby                            = "8SMS_Wt299afGiPQs6ijxheIGLZBU7O4" // need to update
  lng_connection_type                           = "IPsec"
  lng_connection_mode                           = "Default"
  route_table_name                              = "udr-S2SvpnAWS-cpl-cn-uks-01"
  disable_bgp_route_propagation                 = false
  routes                                        = []

}