module "virtual_networks" {
    source              = "../azurerm_vnet"
    for_each            = { for virtual_network in var.virtual_networks : virtual_network.name => virtual_network }
    
    name                = each.key
    resource_group_name = var.resource_group_name
    location            = var.location
    address_space       = each.value.address_space
    dns_servers         = each.value.dns_servers
    is_ddos_enabled     = each.value.is_ddos_enabled  
    tags                = var.tags

    monitor_diagnostic_settings_name            = "${each.key}-diagnostic-settings"
    log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.log_analytics_workspace_name
}
module "route_tables" {
    source               = "../azurerm_route"
    for_each             = { for route_table in var.route_tables : route_table.name => route_table }

    resource_group_name  = var.resource_group_name
    location             = var.location
    route_table_name     = each.key
    routes               = each.value.routes
    tags                 = var.tags
}
module "network_security_groups" {
    source               = "../azurerm_nsg"
    for_each             = { for nsg in var.nsgs : nsg.name => nsg }

    resource_group_name  = var.resource_group_name
    location             = var.location
    name                 = each.key
    nsg_rules            = each.value.nsg_rules
    tags                 = var.tags
    monitor_diagnostic_settings_name            = "${each.key}-diagnostic-settings"
    log_analytics_workspace_subscription_id     = var.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.log_analytics_workspace_name
}
module "subnets" {
    depends_on = [
      module.virtual_networks,
      module.route_tables,
      module.network_security_groups
    ]
    source               = "../azurerm_subnet"
    for_each             = { for subnet in var.subnets : subnet.name => subnet }

    name                 = each.value.name
    resource_group_name  = var.resource_group_name
    service_endpoints    = each.value.service_endpoints
    virtual_network_name = each.value.virtual_network_name
    address_prefixes     = each.value.address_prefixes
    nsg_details          = {
        is_nsg_subnet_association_required = each.value.nsg_name != null ? true : false
        nsg_id                             = each.value.nsg_name != null ? module.network_security_groups["${each.value.nsg_name}"].nsg_id : null
    }
    route_table_details  = {
        is_route_table_subnet_association_required = each.value.route_table_name != null ? true : false
        route_table_id                             = each.value.route_table_name != null ? module.route_tables["${each.value.route_table_name}"].route_table_id : null
    }
}