#### Import the existing created Private DNS zones and A records to TFstate AZT-3607

################ Resource Group - managementHs Private DNS  #############
module "createRgPrivateDnsHS" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  for_each          = local.rgs
  resourceGroupName = each.key
  resourceLocation  = each.value.location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################ Create PrivateDNS Zones - managementHs Private DNS  #############
module "createZonesPrivateDnsHS" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone?ref=v1.1.19"
  for_each              = local.pvtdnszone
  private_dns_zone_name = each.key
  resource_group_name   = each.value.rg
  additionalTags        = module.pvtdnstags.tagsResult
  depends_on            = [module.createRgPrivateDnsHS]
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

########### below two of the record name were duplicated so created using direct modules  ################################

module "CreatePrivateDnsARecords01" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-arecords?ref=v1.1.19"
  name                = var.name01
  zone_name           = var.zone_name01
  resource_group_name = var.resource_group_name01
  ttl                 = var.ttl01
  records             = [data.azurerm_key_vault_secret.recordsecret01.value]
  depends_on          = [module.createZonesPrivateDnsHS]
}

module "CreatePrivateDnsARecords02" {
  source              = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-arecords?ref=v1.1.19"
  name                = var.name02
  zone_name           = var.zone_name02
  resource_group_name = var.resource_group_name02
  ttl                 = var.ttl02
  records             = [data.azurerm_key_vault_secret.recordsecret02.value]
  depends_on          = [module.createZonesPrivateDnsHS]
}

















# ############### Private DNS zones link to virtual networks #################

# module "ZoneslinktovnetHS" {
#   source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link"
#   for_each              = local.dnszone1
#   private_dns_zone_name = each.key
#   virtual_network_id    = each.value[0].vnet
#   vnet_dns_link_name    = each.value[0].vnet_dns_link_name
#   resource_group_name   = each.value[0].resource_group_name
#   depends_on            = [module.createZonesPrivateDnsHS]
# }
