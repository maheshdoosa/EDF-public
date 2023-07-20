############## Resource Group ###############
module "mgmthsNetworkResourceGroup" {
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
  depends_on          = [module.mgmthsNetworkResourceGroup]

  tags = module.mgmthsVnet.tagsResult
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

# ############################ UDRs #########################
module "mgmthsNetworkUdrs" {

  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr?ref=v1.1.19"
  for_each          = local.UDR
  routeTableName    = each.key
  routeNames        = each.value.RouteNames
  routeNexthopTypes = each.value.NextHopTypes
  resourceGroupName = each.value.RGName
  location          = local.rgs[each.value.RGName].location
  routePrefixes     = local.udr_prefixes[each.key]
  routeNexthopIps   = local.udr_nexthopIp[each.key]

  tags       = module.mgmthsUdrTable.tagsResult
  depends_on = [azurerm_subnet.subnets]
}
resource "azurerm_subnet_route_table_association" "assingUDRs" {
  for_each       = local.UDR_Subnet_Mapping
  subnet_id      = local.subnet_ids[each.value.subnet]
  route_table_id = local.RouteTableIDs[each.value.routetable]

  depends_on = [module.mgmthsNetworkUdrs]
}

################ NSGs ############################
module "nsgs" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg?ref=v1.1.19"

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

############### NSG diagnostic settings ##############
module "diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.nsgs]
}

#####################VNET is already peered##########################
#################### Existing code ###################
# ################ Resource Group - managementHs Networking #############
# module "createTargetRgForLzmanagementHsNetworking" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

#   resourceGroupName = var.lzmanagementHsNetworkingRgName
#   resourceLocation  = var.lzmanagementHsNetworkingResourceLocation

#   additionalTags    = module.resourceGroupTags.tagsResult
# }

# ################ Networking - VNet and Subnets #############
# module "createHsManagmentVNet" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-vnet"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   vnetName          = var.lzmanagementHsVnetName
#   location          = var.lzmanagementHsNetworkingResourceLocation
#   vnetAddressSpace  = data.azurerm_key_vault_secret.managementHsVnetAddressSpace.value
#   subnets           = var.managementHsSubnets
#   dnsServerList     = tolist([data.azurerm_key_vault_secret.adDcIp1.value, data.azurerm_key_vault_secret.adDcIp2.value])
#   additionalTags    = module.managementHsVnetTags.tagsResult
# }

# ################ UDRs #############
# module "udrManagementSubnet" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location          = var.lzmanagementHsNetworkingResourceLocation

#   routeTableName    = var.mgmtRouteTableName
#   routeNames        = var.mgmtRouteNames
#   routeNexthopTypes = var.mgmtNextHopTypes
#   routePrefixes     = local.mgmtRoutePrefixes
#   routeNexthopIps   = local.mgmtRouteNextHopIps

#   tags              = module.mgmtUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignmgmtUdr" {
#   subnet_id      = data.azurerm_subnet.managementSubnet.id
#   route_table_id = module.udrManagementSubnet.routetable_id

#   depends_on = [module.createHsManagmentVNet, module.udrManagementSubnet]
# }

# module "udrAdSubnet" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location          = var.lzmanagementHsNetworkingResourceLocation

#   routeTableName    = var.adRouteTableName
#   routeNames        = var.adRouteNames
#   routeNexthopTypes = var.adNextHopTypes

#   routePrefixes     = local.adRoutePrefixes
#   routeNexthopIps   = local.adRouteNextHopIps

#   tags              = module.adUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignadUdr" {
#   subnet_id      = data.azurerm_subnet.adSubnet.id
#   route_table_id = module.udrAdSubnet.routetable_id

#   depends_on = [module.createHsManagmentVNet, module.udrAdSubnet]
# }

# module "wsusSubnetRouteTable" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location          = var.lzmanagementHsNetworkingResourceLocation

#   routeTableName    = var.wsusRouteTableName
#   routeNames        = var.wsusRouteNames
#   routeNexthopTypes = var.wsusNextHopTypes
#   routePrefixes     = local.wsusRoutePrefixes
#   routeNexthopIps   = local.wsusRouteNextHopIps

#   tags              = module.wsusUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignwsusUdr" {
#   subnet_id      = data.azurerm_subnet.wsusSubnet.id
#   route_table_id = module.wsusSubnetRouteTable.routetable_id

#   depends_on = [module.createHsManagmentVNet, module.wsusSubnetRouteTable]
# }

# module "wacSubnetRouteTable" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location          = var.lzmanagementHsNetworkingResourceLocation

#   routeTableName    = var.wacRouteTableName
#   routeNames        = var.wacRouteNames
#   routeNexthopTypes = var.wacNextHopTypes
#   routePrefixes     = local.wacRoutePrefixes
#   routeNexthopIps   = local.wacRouteNextHopIps

#   tags              = module.wacUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignwacUdr" {
#   subnet_id      = data.azurerm_subnet.wacSubnet.id
#   route_table_id = module.wacSubnetRouteTable.routetable_id

#   depends_on = [module.createHsManagmentVNet, module.wacSubnetRouteTable]
# }

# module "pkiSubnetRouteTable" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location          = var.lzmanagementHsNetworkingResourceLocation

#   routeTableName    = var.pkiRouteTableName
#   routeNames        = var.pkiRouteNames
#   routeNexthopTypes = var.pkiNextHopTypes
#   routePrefixes     = local.pkiRoutePrefixes
#   routeNexthopIps   = local.pkiRouteNextHopIps

#   tags              = module.pkiUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignpkiUdr" {
#   subnet_id      = data.azurerm_subnet.caSubnet.id
#   route_table_id = module.pkiSubnetRouteTable.routetable_id

#   depends_on = [module.createHsManagmentVNet, module.pkiSubnetRouteTable]
# }

# module "auditSubnetRouteTable" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-udr"

#   resourceGroupName = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location          = var.lzmanagementHsNetworkingResourceLocation

#   routeTableName    = var.auditRouteTableName
#   routeNames        = var.auditRouteNames
#   routeNexthopTypes = var.auditNextHopTypes
#   routePrefixes     = local.auditRoutePrefixes
#   routeNexthopIps   = local.auditRouteNextHopIps

#   tags              = module.auditUdrTable.tagsResult
# }
# resource "azurerm_subnet_route_table_association" "assignauditUdr" {
#   subnet_id      = data.azurerm_subnet.auditSubnet.id
#   route_table_id = module.auditSubnetRouteTable.routetable_id

#   depends_on = [module.createHsManagmentVNet, module.auditSubnetRouteTable]
# }

# ################ NSGs #############
# module "addsNsg" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location            = var.lzmanagementHsNetworkingResourceLocation

#   security_group_name = var.addsNsgName
#   custom_rules        = local.addsNsgRules

#   tags                = module.tags-addsNsg.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "addsNsg_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.adSubnet.id
#   network_security_group_id = module.addsNsg.network_security_group_id

#   depends_on = [module.createHsManagmentVNet, module.addsNsg]
# }

# module "wsusNsg" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location            = var.lzmanagementHsNetworkingResourceLocation

#   security_group_name = var.wsusNsgName
#   custom_rules        = local.wsusNsgRules

#   tags                = module.tags-wsusNsg.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "wsusNsg_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.wsusSubnet.id
#   network_security_group_id = module.wsusNsg.network_security_group_id

#   depends_on = [module.createHsManagmentVNet, module.wsusNsg]
# }

# module "wacNsg" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"
#   resource_group_name = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location            = var.lzmanagementHsNetworkingResourceLocation

#   security_group_name = var.wacNsgName
#   custom_rules        = local.wacNsgRules

#   tags                = module.tags-wacNsg.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "wacNsg_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.wacSubnet.id
#   network_security_group_id = module.wacNsg.network_security_group_id

#   depends_on = [module.createHsManagmentVNet, module.wacNsg]
# }

# module "caNsg" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"

#   resource_group_name = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location            = var.lzmanagementHsNetworkingResourceLocation

#   security_group_name = var.caNsgName
#   custom_rules_list   = local.caNsgRules

#   tags                = module.tags-caNsg.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "caNsg_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.caSubnet.id
#   network_security_group_id = module.caNsg.network_security_group_id

#   depends_on = [module.createHsManagmentVNet, module.caNsg]
# }

# module "auditNsg" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-nsg"

#   resource_group_name = module.createTargetRgForLzmanagementHsNetworking.rgName
#   location            = var.lzmanagementHsNetworkingResourceLocation

#   security_group_name = var.auditNsgName
#   custom_rules_list   = local.auditNsgRules

#   tags                = module.tags-auditNsg.tagsResult
# }
# resource "azurerm_subnet_network_security_group_association" "auditNsg_associate_subnet" {
#   subnet_id                 = data.azurerm_subnet.auditSubnet.id
#   network_security_group_id = module.auditNsg.network_security_group_id

#   depends_on = [module.createHsManagmentVNet, module.auditNsg]
# }
