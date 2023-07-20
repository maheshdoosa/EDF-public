################ Resource Group - managementSs Private DNS  #############
module "createRgPrivateDnsHS" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  for_each          = local.rgs
  resourceGroupName = each.key
  resourceLocation  = each.value.location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################ Create PrivateDNS Zones - managementSs Private DNS  #############
module "createZonesPrivateDnsHS" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone?ref=v1.1.19"
  for_each              = local.pvtdnszone
  private_dns_zone_name = each.key
  resource_group_name   = each.value.rg
  additionalTags        = module.pvtdnstags.tagsResult
  depends_on            = [module.createRgPrivateDnsHS]
}

############### Private DNS zones link to virtual networks #################

module "ZoneslinktovnetHS" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link?ref=v1.1.19"
  for_each              = local.dnszone1
  private_dns_zone_name = each.key
  virtual_network_id    = data.azurerm_virtual_network.Vnet.id
  vnet_dns_link_name    = each.value[0].vnet_dns_link_name
  resource_group_name   = each.value[0].resource_group_name
  depends_on            = [module.createZonesPrivateDnsHS]
}
############### A Record Creation ##################################################
module "CreatePrivateDnsARecords" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-arecords?ref=v1.1.19"
  for_each            = local._pvtdnszoneArecords
  name                = each.key
  zone_name           = each.value.zonename
  resource_group_name = each.value.rg
  ttl                 = each.value.ttl
  records             = tolist(local.recordsecret[each.value.record])
  depends_on          = [module.createZonesPrivateDnsHS]
  additionalTags      = module.Arecordtags.tagsResult
}
