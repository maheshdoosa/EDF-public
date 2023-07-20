module "createProjsNetworking" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//eit-projects-networking?ref=v1.1.20"

  environment   = var.environment
  businessUnit  = local.businessUnit
  majorFunction = local.majorFunction
  costCentre    = local.costCentre
  projectCode   = local.projectCode
  category      = local.category
  serviceLevel  = local.serviceLevel
  owner         = local.owner
  support       = local.support

  rgs                       = var.rgs
  vnets                     = var.vnets
  UDR                       = var.UDR
  UDR_Subnet_Mapping        = var.UDR_Subnet_Mapping
  nsg                       = var.nsg
  nsgrules                  = var.nsgrules
  nsg_subnet_mapping        = var.nsg_subnet_mapping
  prjKvName                 = var.prjKvName
  prjKvRgName               = var.prjKvRgName
  tenantId                  = var.tenantId
  spokeSubscriptionId       = var.spokeSubscriptionId
  hubSubscriptionId         = var.hubSubscriptionId
  vnet_peering              = var.vnet_peering
  AllowVirtualNetworkAccess = var.AllowVirtualNetworkAccess
  AllowForwardedTraffic     = var.AllowForwardedTraffic
  AllowGatewayTransitVNet12 = var.AllowGatewayTransitVNet12
  AllowGatewayTransitVNet21 = var.AllowGatewayTransitVNet21
  UseRemoteGateways         = var.UseRemoteGateways
}

################ Diag Settings #########
module "diagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.5"
  for_each                   = local.diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.createProjsNetworking]
}
