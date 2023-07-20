module "UdrTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.1.19"
  environment = var.environment

  tags = {
    "Business Unit" : local.UdrTagBusinessUnit
    "Major Function" : local.UdrTagMajorFunction
    "Cost Centre" : local.UdrTagCostCentre
    "Project Code" : local.UdrTagProjectCode
    "Category" : local.UdrTagCategory
    "Service Level" : local.UdrTagServiceLevel
    "Owner" : local.UdrTagOwner
    "Support" : local.UdrTagSupport
    "PipelineRunID" : local.UdrTagPipelineRunId
  }
}

module "HubmgmtIntRoutetable01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.1.19"

  resource_group_name = module.createTargetRgForLzHubNetworking.rgName
  location            = var.lzHubNetworkingResourceLocation
  route_names         = var.lzUdrHubtoInternetandSpoke1Name
  route_table_name    = var.lzRouteTableHubMgmtName01

  route_prefixes      = concat(["0.0.0.0/0"], data.azurerm_virtual_network.lzspokeVnet1.address_space, data.azurerm_virtual_network.lzspokeVnet2.address_space)
  route_nexthop_types = var.route_nexthop_type_hub_mgmt01

  route_nexthop_in_ip_address = data.azurerm_firewall.hubfirewall.ip_configuration[0].private_ip_address

  tags = module.UdrTags.tagsResult
}

resource "azurerm_subnet_route_table_association" "lzHubRouteWvd" {
  subnet_id      = data.azurerm_subnet.lzHubwvdSubnet.id
  route_table_id = module.HubmgmtIntRoutetable01.routetable_id

  depends_on = [module.createHubVNet]
}

resource "azurerm_subnet_route_table_association" "lzHubRouteAudt" {
  subnet_id      = data.azurerm_subnet.lzHubaudtSubnet.id
  route_table_id = module.HubmgmtIntRoutetable01.routetable_id

  depends_on = [module.createHubVNet]
}

resource "azurerm_subnet_route_table_association" "lzHubRouteMgmt" {
  subnet_id      = data.azurerm_subnet.lzHubmgmtSubnet.id
  route_table_id = module.HubmgmtIntRoutetable01.routetable_id

  depends_on = [module.createHubVNet]
}

# module "HubmgmtRoutetable02" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resource_group_name         = module.createTargetRgForLzHubNetworking.rgName
#   location                    = var.lzHubNetworkingResourceLocation
#   route_names                 = var.lzUdrHubtoSpoke02Name
#   route_table_name            = var.lzRouteTableHubMgmtName02
#   route_nexthop_types         = var.route_nexthop_type_hub_mgmt02


#   route_prefixes              = data.azurerm_virtual_network.lzspokeVnet2.address_space
#   route_nexthop_in_ip_address = data.azurerm_firewall.hubfirewall.ip_configuration[0].private_ip_address
#   tags                        = module.UdrTags.tagsResult
# }

# resource "azurerm_subnet_route_table_association" "lzHubRouteWvdSpoke2" {
#   subnet_id      = data.azurerm_subnet.lzHubwvdSubnet.id
#   route_table_id = module.HubmgmtRoutetable02.routetable_id
# }

# resource "azurerm_subnet_route_table_association" "lzHubRouteAudtSpoke2" {
#   subnet_id      = data.azurerm_subnet.lzHubaudtSubnet.id
#   route_table_id = module.HubmgmtRoutetable02.routetable_id
# }

# resource "azurerm_subnet_route_table_association" "lzHubRouteMgmtSpoke2" {
#   subnet_id      = data.azurerm_subnet.lzHubmgmtSubnet.id
#   route_table_id = module.HubmgmtRoutetable02.routetable_id
# }

module "SpokeAppWebRoutetable" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.1.19"

  resource_group_name = module.createTargetRgForLzSpokeNetworking01.rgName
  location            = var.lzSpokeNetworkingResourceLocation
  route_table_name    = var.lzRouteTableSpokeAppWebName
  route_names         = var.lzUdrSpoke01toHubName
  route_nexthop_types = var.route_nexthop_type_Spoke1

  route_prefixes              = data.azurerm_virtual_network.lzhubVnet.address_space
  route_nexthop_in_ip_address = data.azurerm_firewall.hubfirewall.ip_configuration[0].private_ip_address


  tags = module.UdrTags.tagsResult
}

resource "azurerm_subnet_route_table_association" "lzHubRouteSpoke1" {
  subnet_id      = data.azurerm_subnet.lzSpokeappwebSubnet.id
  route_table_id = module.SpokeAppWebRoutetable.routetable_id

  depends_on = [module.createSpokeVNet01]
}

module "SpokePaasGpaasRoutetable" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.1.19"

  resource_group_name = module.createTargetRgForLzSpokeNetworking02.rgName
  location            = var.lzSpokeNetworkingResourceLocation
  route_names         = var.lzUdrSpoke02toHubName
  route_table_name    = var.lzRouteTableSpokePaasGpaasName
  route_nexthop_types = var.route_nexthop_type_Spoke2

  route_prefixes              = data.azurerm_virtual_network.lzhubVnet.address_space
  route_nexthop_in_ip_address = data.azurerm_firewall.hubfirewall.ip_configuration[0].private_ip_address

  tags = module.UdrTags.tagsResult
}

resource "azurerm_subnet_route_table_association" "lzHubRouteSpoke2" {
  subnet_id      = data.azurerm_subnet.lzSpokepaasgpaasSubnet.id
  route_table_id = module.SpokePaasGpaasRoutetable.routetable_id

  depends_on = [module.createSpokeVNet02]
}
