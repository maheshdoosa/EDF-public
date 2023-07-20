########### Resource Group ##################
module "genDiamondHSNetworkResourceGroup" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  for_each          = local.rgs
  resourceGroupName = each.key
  resourceLocation  = each.value.location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################ Virtual Network #############
resource "azurerm_virtual_network" "vnets" {
  for_each            = local.vnets
  name                = each.key
  location            = var.rgs[each.value.rg].location
  resource_group_name = each.value.rg
  address_space       = local.vnet_secrets[each.value.addressSpace]
  dns_servers         = local.vnet_secrets[each.value.dnsServerList]
  depends_on          = [module.genDiamondHSNetworkResourceGroup]

  tags = module.vnetTags.tagsResult
}

################## Subnets #####################
resource "azurerm_subnet" "subnets" {
  for_each                                       = local.subnets
  name                                           = each.key
  resource_group_name                            = local.vnets[each.value.vnetname].rg
  virtual_network_name                           = each.value.vnetname
  address_prefixes                               = local.vnet_secrets[each.value.address]
  enforce_private_link_endpoint_network_policies = each.value.enablePrivateLinkEndPoint
  enforce_private_link_service_network_policies  = each.value.enablePrivateLinkService
  depends_on                                     = [azurerm_virtual_network.vnets]
  service_endpoints                              = lookup(each.value, "service_endpoints", null)
  dynamic "delegation" {
    for_each = lookup(each.value, "delegation", [])
    content {
      name = lookup(delegation.value, "name", null)
      dynamic "service_delegation" {
        for_each = lookup(delegation.value, "service_delegation", [])
        content {
          name    = lookup(service_delegation.value, "name", null)    # (Required) The name of service to delegate to. Possible values include Microsoft.BareMetal/AzureVMware, Microsoft.BareMetal/CrayServers, Microsoft.Batch/batchAccounts, Microsoft.ContainerInstance/containerGroups, Microsoft.Databricks/workspaces, Microsoft.HardwareSecurityModules/dedicatedHSMs, Microsoft.Logic/integrationServiceEnvironments, Microsoft.Netapp/volumes, Microsoft.ServiceFabricMesh/networks, Microsoft.Sql/managedInstances, Microsoft.Sql/servers, Microsoft.Web/hostingEnvironments and Microsoft.Web/serverFarms.
          actions = lookup(service_delegation.value, "actions", null) # (Required) A list of Actions which should be delegated. Possible values include Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action, Microsoft.Network/virtualNetworks/subnets/action and Microsoft.Network/virtualNetworks/subnets/join/action.
        }
      }
    }
  }
}

############################# UDRs #########################
module "genDiamondHSUdrs" {

  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.1.19"
  for_each          = local.UDR
  routeTableName    = each.key
  routeNames        = each.value.RouteNames
  routeNexthopTypes = each.value.NextHopTypes
  resourceGroupName = each.value.RGName
  location          = local.rgs[each.value.RGName].location
  routePrefixes     = local.udr_prefixes[each.key]
  routeNexthopIps   = local.udr_nexthopIp[each.key]

  tags       = module.genDiamondHSUdrTable.tagsResult
  depends_on = [azurerm_subnet.subnets]
}
resource "azurerm_subnet_route_table_association" "assingUDRs" {
  for_each       = local.UDR_Subnet_Mapping
  subnet_id      = local.subnet_ids[each.value.subnet]
  route_table_id = local.RouteTableIDs[each.value.routetable]

  depends_on = [module.genDiamondHSUdrs]
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

# ################ NSGs ############################
# module "nsgs" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"

#   for_each            = local.nsg
#   resource_group_name = each.value.rg
#   location            = each.value.location
#   security_group_name = each.key
#   custom_rules_list   = local.nsgrules[each.key]
#   tags                = module.nsgtags.tagsResult
#   depends_on          = [azurerm_subnet.subnets]
# }

# ######### Associates Subnets to Network Security Groups #####
# resource "azurerm_subnet_network_security_group_association" "nsg_subnet_associations" {
#   for_each                  = local.nsg_subnets
#   subnet_id                 = local.subnet_ids[each.value.subnet]
#   network_security_group_id = local.nsg_ids[each.value.nsg]
#   depends_on                = [module.nsgs]
# }

############ Diag Settings #######
module "diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [azurerm_virtual_network.vnets]
}
