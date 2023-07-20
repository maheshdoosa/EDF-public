module "resource_groups" {
    source    = "./../resource_modules/azurerm_resource_group"
    for_each  = { for resource_group in var.region.resource_groups : resource_group.name => resource_group }

    name      = each.key
    location  = var.region.location    
    tags      = local.tags
}
module "networks" {
    depends_on = [
      module.resource_groups
    ]
    source              = "./../resource_modules/network"
    for_each            = { for network in var.region.networks : network.id => network } 

    location            = var.region.location
    tags                = local.tags
    resource_group_name = each.value.resource_group_name
    virtual_networks    = try(each.value.virtual_networks, [])
    subnets             = try(each.value.subnets, [])
    route_tables        = try(each.value.route_tables, [])
    nsgs                = try(each.value.nsgs, [])

    log_analytics_workspace_subscription_id     = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_name
}
module "public_ips" {
    depends_on = [
      module.resource_groups
    ]
    source              = "../resource_modules/azurerm_public_ip"
    for_each            = { for public_ip in var.region.public_ips : public_ip.name => public_ip } 

    name                    = each.key
    resource_group_name     = each.value.resource_group_name
    location                = var.region.location
    allocation_method       = each.value.allocation_method
    tags                    = local.tags
    ip_version              = try(each.value.ip_version, null)
    sku                     = try(each.value.sku, null)
    zones                   = try(each.value.zones, null)
    sku_tier                = try(each.value.sku_tier, null)
    idle_timeout_in_minutes = try(each.value.idle_timeout_in_minutes, null)
    domain_name_label       = try(each.value.domain_name_label, null)
    reverse_fqdn            = try(each.value.reverse_fqdn, null)
    public_ip_prefix_id     = try(each.value.public_ip_prefix_id, null)
    ip_tags                 = try(each.value.ip_tags, null)

    monitor_diagnostic_settings_name            = "${each.key}-diagnostic-settings"
    log_analytics_workspace_subscription_id     = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_name
}
module "bastions" {
    depends_on = [
      module.networks,
      module.public_ips
    ]
    source              = "../resource_modules/azurerm_bastion_host"
    for_each            = { for bastion in var.region.bastions : bastion.name => bastion } 

    name                          = each.key
    location                      = var.region.location
    resource_group_name           = each.value.resource_group_name
    sku                           = try(each.value.sku, null)
    copy_paste_enabled            = try(each.value.copy_paste_enabled, null)
    file_copy_enabled             = try(each.value.file_copy_enabled, null)
    ip_connect_enabled            = try(each.value.ip_connect_enabled, null)
    scale_units                   = try(each.value.scale_units, null)
    shareable_link_enabled        = try(each.value.shareable_link_enabled, null)
    tunneling_enabled             = try(each.value.tunneling_enabled, null)
    ip_configuration_name         = each.value.ip_configuration_name
    subnet_id                     = module.networks["hub"].bastion_subnet_id
    public_ip_id                  = module.public_ips[each.value.public_ip_name].id
    tags                          = local.tags

    monitor_diagnostic_settings_name            = "${each.key}-diagnostic-settings"
    log_analytics_workspace_subscription_id     = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_name
}
module "firewall" {
    depends_on = [
      module.networks,
      module.public_ips
    ]
    source                        = "../resource_modules/azurerm_firewall"
    name                          = var.region.firewall.name
    resource_group_name           = var.region.firewall.resource_group_name
    location                      = var.region.location
    sku_name                      = var.region.firewall.sku_name
    sku_tier                      = var.region.firewall.sku_tier
    zones                         = ["1"]
    ip_configuration_name         = var.region.firewall.ip_configuration_name
    subnet_id                     = module.networks["hub"].firewall_subnet_id
    public_ip_id                  = module.public_ips[var.region.firewall.public_ip_name].id
    policy_name                   = var.region.firewall.policy_name
    policy_resource_group_name    = var.region.firewall.policy_resource_group_name
    policy_subscription_id        = var.tfvars.subscription_id
    tags                          = local.tags

    monitor_diagnostic_settings_name            = "${var.region.firewall.name}-diagnostic-settings"
    log_analytics_workspace_subscription_id     = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_name
}
module "virtual_network_gateways" {
  depends_on = [
    module.networks
  ]
    source                        = "../resource_modules/azurerm_virtual_network_gateway"
    for_each                      = { for azurerm_virtual_network_gateway in var.region.azurerm_virtual_network_gateways : azurerm_virtual_network_gateway.name => azurerm_virtual_network_gateway } 

    name                          = each.key
    resource_group_name           = each.value.resource_group_name
    location                      = var.region.location
    subnet_id                     = module.networks["hub"].gateway_subnet_id
    public_ip_id                  = module.public_ips[each.value.public_ip_name].id
    type                          = each.value.type
    vpn_type                      = each.value.vpn_type
    active_active                 = each.value.active_active
    enable_bgp                    = each.value.enable_bgp
    sku                           = each.value.sku
    ip_configuration_name         = each.value.ip_configuration_name
    private_ip_address_allocation = each.value.private_ip_address_allocation
    address_space                 = each.value.address_space
    # root_certificate_name         = each.value.root_certificate_name
    # public_cert_data              = each.value.root_certificate_data
    aad_tenant                    = each.value.aad_tenant 
    aad_audience                  = each.value.aad_audience 
    aad_issuer                    = each.value.aad_issuer
    vpn_auth_types                = each.value.vpn_auth_types
    vpn_client_protocols          = each.value.vpn_client_protocols

    monitor_diagnostic_settings_name            = "${each.key}-diagnostic-settings"
    log_analytics_workspace_subscription_id     = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_subscription_id
    log_analytics_workspace_resource_group_name = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_resource_group_name
    log_analytics_workspace_name                = var.region.monitor_diagnostic_shared_settings.log_analytics_workspace_name
}
module "virtual_network_peerings" {
  depends_on = [
    module.networks
  ]
  source                                    = "./../resource_modules/azurerm_virtual_network_peering"
  for_each                                  = { for virtual_network_peering in var.region.virtual_network_peerings : virtual_network_peering.id => virtual_network_peering }
  
  allow_forwarded_traffic                   = each.value.allow_forwarded_traffic
  allow_gateway_transit                     = each.value.allow_gateway_transit
  allow_virtual_network_access              = each.value.allow_virtual_network_access
  spoke_virtual_network_resource_group_name = each.value.spoke_virtual_network_resource_group_name
  spoke_virtual_network_name                = each.value.spoke_virtual_network_name
  hub_subscription_id                       = each.value.hub_subscription_id
  hub_virtual_network_resource_group_name   = each.value.hub_virtual_network_resource_group_name
  hub_virtual_network_name                  = each.value.hub_virtual_network_name
}
