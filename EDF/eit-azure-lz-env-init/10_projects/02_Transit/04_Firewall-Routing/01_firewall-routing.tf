#t1fw-Internal
module "udrTableTier1Internal" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

  resourceGroupName = var.lzTransitNetworkingRgName
  location          = var.lzTransitNetworkingResourceLocation

  routeTableName    = var.t1fwIntRouteTableName
  routeNames        = var.t1fwIntRouteNames
  routeNexthopTypes = var.t1fwIntRoutesNextHopTypes
  routePrefixes     = local.t1fwIntRoutePrefixes
  routeNexthopIps   = local.t1fwIntRouteNextHopIps

  tags = module.t1fwIntTagsUdrTable.tagsResult
}
resource "azurerm_subnet_route_table_association" "assignt1fwIntUdrToSubnet" {
  subnet_id      = data.azurerm_subnet.t1intfwTransitSubnetName.id
  route_table_id = module.udrTableTier1Internal.routetable_id
}

#t1fw-External
module "udrTableTier1External" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

  resourceGroupName = var.lzTransitNetworkingRgName
  location          = var.lzTransitNetworkingResourceLocation

  routeTableName    = var.t1fwExtRouteTableName
  routeNames        = var.t1fwExtRouteNames
  routeNexthopTypes = var.t1fwExtRoutesNextHopTypes
  routePrefixes     = local.t1fwExtRoutePrefixes
  routeNexthopIps   = local.t1fwExtRouteNextHopIps

  tags = module.t1fwExtTagsUdrTable.tagsResult
}
resource "azurerm_subnet_route_table_association" "assignt1fwExtUdrToSubnet" {
  subnet_id      = data.azurerm_subnet.t1extfwTransitSubnetName.id
  route_table_id = module.udrTableTier1External.routetable_id
}

#t1fw-Management
module "udrTableTier1Management" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

  resourceGroupName = var.lzTransitNetworkingRgName
  location          = var.lzTransitNetworkingResourceLocation

  routeTableName    = var.t1fwMgmtRouteTableName
  routeNames        = var.t1fwMgmtRouteNames
  routeNexthopTypes = var.t1fwMgmtRoutesNextHopTypes
  routePrefixes     = local.t1fwMgmtRoutePrefixes
  routeNexthopIps   = local.t1fwMgmtRouteNextHopIps

  tags = module.t1fwMgmtTagsUdrTable.tagsResult
}
resource "azurerm_subnet_route_table_association" "assignt1fwMgmtUdrToSubnet" {
  subnet_id      = data.azurerm_subnet.t1mgmtfwTransitSubnetName.id
  route_table_id = module.udrTableTier1Management.routetable_id
}

#t2fw-Internal
module "udrTableTier2Internal" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

  resourceGroupName = var.lzTransitNetworkingRgName
  location          = var.lzTransitNetworkingResourceLocation

  routeTableName    = var.t2fwIntRouteTableName
  routeNames        = var.t2fwIntRouteNames
  routeNexthopTypes = var.t2fwIntRoutesNextHopTypes
  routePrefixes     = local.t2fwIntRoutePrefixes
  routeNexthopIps   = local.t2fwIntRouteNextHopIps

  tags = module.t2fwIntTagsUdrTable.tagsResult
}
resource "azurerm_subnet_route_table_association" "assignt2fwIntUdrToSubnet" {
  subnet_id      = data.azurerm_subnet.t2intfwTransitSubnetName.id
  route_table_id = module.udrTableTier2Internal.routetable_id
}

#t2fw-Management
module "udrTableTier2Management" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

  resourceGroupName = var.lzTransitNetworkingRgName
  location          = var.lzTransitNetworkingResourceLocation

  routeTableName    = var.t2fwMgmtRouteTableName
  routeNames        = var.t2fwMgmtRouteNames
  routeNexthopTypes = var.t2fwMgmtRoutesNextHopTypes
  routePrefixes     = local.t2fwMgmtRoutePrefixes
  routeNexthopIps   = local.t2fwMgmtRouteNextHopIps

  tags = module.t2fwMgmtTagsUdrTable.tagsResult
}
resource "azurerm_subnet_route_table_association" "assignt2fwmgmtUdrToSubnet" {
  subnet_id      = data.azurerm_subnet.t2mgmtfwTransitSubnetName.id
  route_table_id = module.udrTableTier2Management.routetable_id
}

#t1fw-HASync
module "udrTableTier1HASync" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

  resourceGroupName = var.lzTransitNetworkingRgName
  location          = var.lzTransitNetworkingResourceLocation

  routeTableName    = var.t1fwHaSyncRouteTableName
  routeNames        = var.t1fwHaSyncRouteNames
  routeNexthopTypes = var.t1fwHaSyncRoutesNextHopTypes
  routePrefixes     = local.t1fwHaSyncRoutePrefixes
  routeNexthopIps   = local.t1fwHaSyncRouteNextHopIps

  tags = module.t1fwHaSyncTagsUdrTable.tagsResult
}
resource "azurerm_subnet_route_table_association" "assignt1fwHaSyncUdrToSubnet" {
  subnet_id      = data.azurerm_subnet.t1fwHaSyncTransitSubnetName.id
  route_table_id = module.udrTableTier1HASync.routetable_id
}
