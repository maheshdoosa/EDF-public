# ################ Resource Group - Transit Networking #############
module "createTargetRgForLzTransitNetworking" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzTransitNetworkingRgName
  resourceLocation  = var.lzTransitNetworkingResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}


################ Virtual Networks #############
resource "azurerm_virtual_network" "vnets" {
  for_each            = local.vnets
  name                = each.key
  location            = var.rgs[each.value.rg].location
  resource_group_name = each.value.rg
  address_space       = local.vnet_secrets[each.value.addressSpace]
  dns_servers         = local.vnet_secrets[each.value.dnsServerList]
  depends_on          = [module.createTargetRgForLzTransitNetworking]

  tags = module.transitVnetTags.tagsResult
}


# ################# Subnets #####################
resource "azurerm_subnet" "subnets" {
  for_each                                       = local.subnets
  name                                           = each.key
  resource_group_name                            = local.vnets[each.value.vnetname].rg
  virtual_network_name                           = each.value.vnetname
  address_prefixes                               = local.vnet_secrets[each.value.address]
  enforce_private_link_endpoint_network_policies = each.value.enablePrivateLinkEndPoint
  enforce_private_link_service_network_policies  = each.value.enablePrivateLinkService
  depends_on                                     = [azurerm_virtual_network.vnets]
}



# ############################ UDRs #########################
module "transithsNetworkUdrs" {

  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.0.0"
  for_each                   = local.UDR
  routeTableName             = each.key
  routeNames                 = each.value.RouteNames
  routeNexthopTypes          = each.value.NextHopTypes
  resourceGroupName          = each.value.RGName
  location                   = local.rgs[each.value.RGName].location
  routePrefixes              = local.udr_prefixes[each.key]
  routeNexthopIps            = local.udr_nexthopIp[each.key]
  disableBgpRoutePropagation = each.value.disableBgpRoutePropagation

  tags       = module.t1fwIntTagsUdrTable.tagsResult
  depends_on = [azurerm_subnet.subnets]
}
resource "azurerm_subnet_route_table_association" "assingUDRs" {
  for_each       = local.UDR_Subnet_Mapping
  subnet_id      = local.subnet_ids[each.value.subnet]
  route_table_id = local.RouteTableIDs[each.value.routetable]

  depends_on = [module.transithsNetworkUdrs]
}

module "createTargetRgForExpressroute" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzTransitExpressrouteRgName
  resourceLocation  = var.lzTransitNetworkingResourceLocation
  additionalTags    = module.ExpressrouteTags.tagsResult
}


# ########### Commented old code ##################

# ################ Resource Group - Transit Networking #############
# module "createTargetRgForLzTransitNetworking" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

#   resourceGroupName = var.lzTransitNetworkingRgName
#   resourceLocation  = var.lzTransitNetworkingResourceLocation

#   additionalTags = module.resourceGroupTags.tagsResult
# }

# ################ Networking - VNet and Subnets #############
# module "createHubVNet" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   vnetName          = var.lzTransitVnetName
#   location          = var.lzTransitNetworkingResourceLocation
#   vnetAddressSpace  = data.azurerm_key_vault_secret.transitVnetAddressSpace.value
#   subnets           = var.transitSubnets
#   dnsServerList     = tolist([data.azurerm_key_vault_secret.adDcIp1.value, data.azurerm_key_vault_secret.adDcIp2.value])
#   additionalTags    = module.transitVnetTags.tagsResult
# }

# ################ UDRs #############
# module "udrTableTier1Internal" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   location          = var.lzTransitNetworkingResourceLocation

#   routeTableName    = var.t1fwIntRouteTableName
#   routeNames        = var.t1fwIntRouteNames
#   routeNexthopTypes = var.t1fwIntRoutesNextHopTypes
#   routePrefixes     = local.t1fwIntRoutePrefixes
#   routeNexthopIps   = local.t1fwIntRouteNextHopIps

#   tags = module.t1fwIntTagsUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignt1fwIntUdrToSubnet" {
#   subnet_id      = data.azurerm_subnet.t1intfwTransitSubnetName.id
#   route_table_id = module.udrTableTier1Internal.routetable_id

#   depends_on = [module.createHubVNet]
# }

# #t1fw-External
# module "udrTableTier1External" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   location          = var.lzTransitNetworkingResourceLocation

#   routeTableName    = var.t1fwExtRouteTableName
#   routeNames        = var.t1fwExtRouteNames
#   routeNexthopTypes = var.t1fwExtRoutesNextHopTypes
#   routePrefixes     = local.t1fwExtRoutePrefixes
#   routeNexthopIps   = local.t1fwExtRouteNextHopIps

#   tags = module.t1fwExtTagsUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignt1fwExtUdrToSubnet" {
#   subnet_id      = data.azurerm_subnet.t1extfwTransitSubnetName.id
#   route_table_id = module.udrTableTier1External.routetable_id

#   depends_on = [module.createHubVNet]
# }

# #t1fw-Management
# module "udrTableTier1Management" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   location          = var.lzTransitNetworkingResourceLocation

#   routeTableName    = var.t1fwMgmtRouteTableName
#   routeNames        = var.t1fwMgmtRouteNames
#   routeNexthopTypes = var.t1fwMgmtRoutesNextHopTypes
#   routePrefixes     = local.t1fwMgmtRoutePrefixes
#   routeNexthopIps   = local.t1fwMgmtRouteNextHopIps

#   tags = module.t1fwMgmtTagsUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignt1fwMgmtUdrToSubnet" {
#   subnet_id      = data.azurerm_subnet.t1mgmtfwTransitSubnetName.id
#   route_table_id = module.udrTableTier1Management.routetable_id

#   depends_on = [module.createHubVNet]
# }

# #t2fw-Internal
# module "udrTableTier2Internal" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   location          = var.lzTransitNetworkingResourceLocation

#   routeTableName    = var.t2fwIntRouteTableName
#   routeNames        = var.t2fwIntRouteNames
#   routeNexthopTypes = var.t2fwIntRoutesNextHopTypes
#   routePrefixes     = local.t2fwIntRoutePrefixes
#   routeNexthopIps   = local.t2fwIntRouteNextHopIps

#   tags = module.t2fwIntTagsUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignt2fwIntUdrToSubnet" {
#   subnet_id      = data.azurerm_subnet.t2intfwTransitSubnetName.id
#   route_table_id = module.udrTableTier2Internal.routetable_id

#   depends_on = [module.createHubVNet]
# }

# #t2fw-Management
# module "udrTableTier2Management" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   location          = var.lzTransitNetworkingResourceLocation

#   routeTableName    = var.t2fwMgmtRouteTableName
#   routeNames        = var.t2fwMgmtRouteNames
#   routeNexthopTypes = var.t2fwMgmtRoutesNextHopTypes
#   routePrefixes     = local.t2fwMgmtRoutePrefixes
#   routeNexthopIps   = local.t2fwMgmtRouteNextHopIps

#   tags = module.t2fwMgmtTagsUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignt2fwmgmtUdrToSubnet" {
#   subnet_id      = data.azurerm_subnet.t2mgmtfwTransitSubnetName.id
#   route_table_id = module.udrTableTier2Management.routetable_id

#   depends_on = [module.createHubVNet]
# }

# #t1fw-HASync
# module "udrTableTier1HASync" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzTransitNetworking.rgName
#   location          = var.lzTransitNetworkingResourceLocation

#   routeTableName    = var.t1fwHaSyncRouteTableName
#   routeNames        = var.t1fwHaSyncRouteNames
#   routeNexthopTypes = var.t1fwHaSyncRoutesNextHopTypes
#   routePrefixes     = local.t1fwHaSyncRoutePrefixes
#   routeNexthopIps   = local.t1fwHaSyncRouteNextHopIps

#   tags = module.t1fwHaSyncTagsUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignt1fwHaSyncUdrToSubnet" {
#   subnet_id      = data.azurerm_subnet.t1fwHaSyncTransitSubnetName.id
#   route_table_id = module.udrTableTier1HASync.routetable_id

#   depends_on = [module.createHubVNet]
# }

# ################ NSGs #############
# module "nsgt1fwext" {
#   source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzTransitNetworking.rgName
#   location            = var.lzTransitNetworkingResourceLocation

#   security_group_name = var.nsgt1fwextName
#   custom_rules        = var.nsgRulest1fwext

#   tags = module.tags-nsgt1fwext.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "nsgt1fwext_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.t1extfwTransitSubnetName.id
#   network_security_group_id = module.nsgt1fwext.network_security_group_id

#   depends_on = [module.createHubVNet]
# }

# module "nsgt1fwint" {
#   source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzTransitNetworking.rgName
#   location            = var.lzTransitNetworkingResourceLocation

#   security_group_name = var.nsgt1fwintName
#   custom_rules        = var.nsgRulest1fwint

#   tags = module.tags-nsgt1fwint.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "nsgt1fwint_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.t1intfwTransitSubnetName.id
#   network_security_group_id = module.nsgt1fwint.network_security_group_id

#   depends_on = [module.createHubVNet]
# }

# module "nsgt1fwhasync" {
#   source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzTransitNetworking.rgName
#   location            = var.lzTransitNetworkingResourceLocation

#   security_group_name = var.nsgt1fwhasyncName
#   custom_rules        = var.nsgRulest1fwhasync

#   tags = module.tags-nsgt1fwhasync.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "nsgt1fwhasync_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.t1fwHaSyncTransitSubnetName.id
#   network_security_group_id = module.nsgt1fwhasync.network_security_group_id

#   depends_on = [module.createHubVNet]
# }

# module "nsgt1fwmgmt" {
#   source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzTransitNetworking.rgName
#   location            = var.lzTransitNetworkingResourceLocation

#   security_group_name = var.nsgt1fwmgmtName
#   custom_rules        = var.nsgRulest1fwmgmt

#   tags = module.tags-nsgt1fwmgmt.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "nsgt1fwmgmt_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.t1mgmtfwTransitSubnetName.id
#   network_security_group_id = module.nsgt1fwmgmt.network_security_group_id

#   depends_on = [module.createHubVNet]
# }

# module "nsgt2fwint" {
#   source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzTransitNetworking.rgName
#   location            = var.lzTransitNetworkingResourceLocation

#   security_group_name = var.nsgt2fwintName
#   custom_rules        = var.nsgRulest2fwint

#   tags = module.tags-nsgt1fwint.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "nsgt2fwint_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.t2intfwTransitSubnetName.id
#   network_security_group_id = module.nsgt2fwint.network_security_group_id

#   depends_on = [module.createHubVNet]
# }

# module "nsgt2fwmgmt" {
#   source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzTransitNetworking.rgName
#   location            = var.lzTransitNetworkingResourceLocation

#   security_group_name = var.nsgt2fwmgmtName
#   custom_rules        = var.nsgRulest2fwmgmt

#   tags = module.tags-nsgt2fwmgmt.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "nsgt2fwmgmt_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.t2mgmtfwTransitSubnetName.id
#   network_security_group_id = module.nsgt2fwmgmt.network_security_group_id

#   depends_on = [module.createHubVNet]
# }



# # # ################# Subnets #####################
# # resource "azurerm_subnet" "subnets" {
# #   for_each                                       = local.subnets
# #   name                                           = each.key
# #   resource_group_name                            = local.vnets[each.value.vnetname].rg
# #   virtual_network_name                           = each.value.vnetname
# #   address_prefixes                               = local.vnet_secrets[each.value.address]
# #   enforce_private_link_endpoint_network_policies = each.value.enablePrivateLinkEndPoint
# #   enforce_private_link_service_network_policies  = each.value.enablePrivateLinkService
# #   depends_on                                     = [azurerm_virtual_network.vnets]
# # }
