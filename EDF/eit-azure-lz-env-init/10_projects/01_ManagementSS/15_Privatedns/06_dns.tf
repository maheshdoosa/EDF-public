################ Resource Group - managementSs Private DNS  #############
module "createRgPrivateDnsSS" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  for_each          = local.rgs
  resourceGroupName = each.key
  resourceLocation  = each.value.location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################ Create PrivateDNS Zones - managementSs Private DNS  #############
module "createZonesPrivateDnsSS" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone"
  for_each              = local.pvtdnszone
  private_dns_zone_name = each.key
  resource_group_name   = each.value.rg
  additionalTags        = module.pvtdnstags.tagsResult
  depends_on            = [module.createRgPrivateDnsSS]
}

############### Private DNS zones link to virtual networks #################
module "ZoneslinktovnetSS" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link"
  for_each              = local.dnszone1
  private_dns_zone_name = each.key
  virtual_network_id    = each.value[0].vnet
  vnet_dns_link_name    = each.value[0].vnet_dns_link_name
  resource_group_name   = each.value[0].resource_group_name
  depends_on            = [module.createZonesPrivateDnsSS]
}
