module "wvdNetworkResourceGroup" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
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
  depends_on          = [module.wvdNetworkResourceGroup]
}

# ################# Subnets #####################
resource "azurerm_subnet" "subnets" {
  for_each             = local.subnets
  name                 = each.key
  resource_group_name  = local.vnets[each.value.vnetname].rg
  virtual_network_name = each.value.vnetname
  address_prefixes     = local.vnet_secrets[each.value.address]
  depends_on           = [azurerm_virtual_network.vnets]
}

# ############################ UDRs #########################
module "wvdNetworkUdrs" {

  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.1.19"
  for_each          = local.UDR
  routeTableName    = each.key
  routeNames        = each.value.RouteNames
  routeNexthopTypes = each.value.NextHopTypes
  resourceGroupName = each.value.RGName
  location          = local.rgs[each.value.RGName].location
  routePrefixes     = local.udr_prefixes[each.key]
  routeNexthopIps   = local.udr_nexthopIp[each.key]

  tags       = module.wvdUdrTable.tagsResult
  depends_on = [azurerm_subnet.subnets]
}
resource "azurerm_subnet_route_table_association" "assingUDRs" {
  for_each       = local.UDR_Subnet_Mapping
  subnet_id      = local.subnet_ids[each.value.subnet]
  route_table_id = local.RouteTableIDs[each.value.routetable]

  depends_on = [module.wvdNetworkUdrs]
}

############### Networking - VNet Peering ###############

module "createVNetPeering" {
  count = var.vnet_peering["peer-hub-spoke"]["enable"] == true ? 1 : 0
  providers = {
    azurerm.src = azurerm.hub
    azurerm.dst = azurerm.spoke
  }
  source                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnetpeering-multiple-subs?ref=v1.1.19"
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
