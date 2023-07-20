module "eamCISsResGroup" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  for_each          = local.rgs
  resourceGroupName = each.key
  resourceLocation  = each.value.location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################ Virtual Networks #############
resource "azurerm_virtual_network" "vnets" {
  for_each            = local.vnets
  name                = each.key
  location            = var.rgs[each.value.rg].location
  resource_group_name = each.value.rg
  address_space       = local.vnet_secrets[each.value.addressSpace]
  dns_servers         = local.vnet_secrets[each.value.dnsServerList]

  tags       = module.eamCISsVnetTags.tagsResult
  depends_on = [module.eamCISsResGroup]
}

# ################# Subnets #####################
resource "azurerm_subnet" "subnets" {
  for_each                                       = local.subnets
  name                                           = each.key
  resource_group_name                            = local.vnets[each.value.vnetname].rg
  virtual_network_name                           = each.value.vnetname
  address_prefixes                               = local.vnet_secrets[each.value.address]
  depends_on                                     = [azurerm_virtual_network.vnets]
  enforce_private_link_endpoint_network_policies = each.value.enablePrivateLinkEndPoint
  enforce_private_link_service_network_policies  = each.value.enablePrivateLinkService
}

############### Networking - VNet Peering ###############
module "createVNetPeering" {
  count = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
  providers = {
    azurerm.src = azurerm.hub
    azurerm.dst = azurerm.spoke
  }
  source                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnetpeering-multiple-subs"
  vNet1ResourceGroupName = var.vnet_peering["peer-hub-spoke"]["vnet1rg"]
  vNet2ResourceGroupName = var.vnet_peering["peer-hub-spoke"]["vnet2rg"]

  peerNameVNet12 = var.vnet_peering["peer-hub-spoke"]["peer1name"]
  peerNameVNet21 = var.vnet_peering["peer-hub-spoke"]["peer2name"]
  vNet1Name      = var.vnet_peering["peer-hub-spoke"]["vnet1name"]
  vNet1Id        = data.azurerm_virtual_network.hubVNet[0].id
  vNet2Name      = var.vnet_peering["peer-hub-spoke"]["vnet2name"]
  vNet2Id        = local.vnet_ids[var.vnet_peering["peer-hub-spoke"]["vnet2name"]]

  AllowVirtualNetworkAccess = var.AllowVirtualNetworkAccess
  AllowForwardedTraffic     = var.AllowForwardedTraffic
  AllowGatewayTransitVNet12 = var.AllowGatewayTransitVNet12
  AllowGatewayTransitVNet21 = var.AllowGatewayTransitVNet21
  UseRemoteGateways         = var.UseRemoteGateways

  depends_on = [azurerm_virtual_network.vnets, azurerm_subnet.subnets]
}

# module "createVNetPeeringDmz" {
#   count = var.vnet_peering["peer-hub-spoke-dmz"]["enable"] == true ? 1 : 0
#   providers = {
#     azurerm.src = azurerm.hub
#     azurerm.dst = azurerm.spoke
#   }
#   source                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnetpeering-multiple-subs"
#   vNet1ResourceGroupName = var.vnet_peering["peer-hub-spoke-dmz"]["vnet1rg"]
#   vNet2ResourceGroupName = var.vnet_peering["peer-hub-spoke-dmz"]["vnet2rg"]

#   peerNameVNet12 = var.vnet_peering["peer-hub-spoke-dmz"]["peer1name"]
#   peerNameVNet21 = var.vnet_peering["peer-hub-spoke-dmz"]["peer2name"]
#   vNet1Name      = var.vnet_peering["peer-hub-spoke-dmz"]["vnet1name"]
#   vNet1Id        = data.azurerm_virtual_network.hubVNet[0].id
#   vNet2Name      = var.vnet_peering["peer-hub-spoke-dmz"]["vnet2name"]
#   vNet2Id        = local.vnet_ids[var.vnet_peering["peer-hub-spoke-dmz"]["vnet2name"]]

#   AllowVirtualNetworkAccess = var.AllowVirtualNetworkAccess
#   AllowForwardedTraffic     = var.AllowForwardedTraffic
#   AllowGatewayTransitVNet12 = var.AllowGatewayTransitVNet12
#   AllowGatewayTransitVNet21 = var.AllowGatewayTransitVNet21
#   UseRemoteGateways         = var.UseRemoteGateways

#   depends_on = [azurerm_virtual_network.vnets, azurerm_subnet.subnets]
# }


# ############################ UDRs #########################
module "udrs" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"
  for_each          = local.UDR
  routeTableName    = each.key
  routeNames        = each.value.RouteNames
  routeNexthopTypes = each.value.NextHopTypes
  resourceGroupName = each.value.RGName
  location          = local.rgs[each.value.RGName].location
  routePrefixes     = local.udr_prefixes[each.key]
  routeNexthopIps   = local.udr_nexthopIp[each.key]

  tags       = module.ciUdrTable.tagsResult
  depends_on = [azurerm_subnet.subnets]
}
resource "azurerm_subnet_route_table_association" "assingUDRs" {
  for_each       = local.UDR_Subnet_Mapping
  subnet_id      = local.subnet_ids[each.value.subnet]
  route_table_id = local.RouteTableIDs[each.value.routetable]

  depends_on = [module.udrs]
}
module "nsgs" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"

  for_each            = local.nsg
  resource_group_name = each.value.rg
  location            = each.value.location
  security_group_name = each.key
  custom_rules_list   = local.nsgrules[each.key]
  tags                = module.nsgtags.tagsResult
  depends_on          = [azurerm_subnet.subnets]
}

######### Associates Subnets to Network Security Groups #####
resource "azurerm_subnet_network_security_group_association" "nsg_subnet_associations" {
  for_each                  = local.nsg_subnets
  subnet_id                 = local.subnet_ids[each.value.subnet]
  network_security_group_id = local.nsg_ids[each.value.nsg]
  depends_on                = [module.nsgs]
}
