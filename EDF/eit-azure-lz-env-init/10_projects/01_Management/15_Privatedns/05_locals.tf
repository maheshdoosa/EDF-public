locals {
  rgs        = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }
  _zones     = { for z in var.pvtdnszones : z.zone => z }
  pvtdnszone = { for zone1 in keys(local._zones) : zone1 => local._zones[zone1] if local._zones[zone1].enable == true }
  dnszone    = [for dns in var.vnetlinkpvtdnszones : [for dns1 in dns.private_dns_zone_name : dns1]]
  dnszone1   = { for dnsvalue in local.dnszone[0] : dnsvalue => var.vnetlinkpvtdnszones }

  ###### Data source the Vnet id ##########################
  Vnetid = var.vnetlinkpvtdnszones[0].vnet
  ######### change the private dns zone A record creation as list to map type ###############
  _pvtdnszoneArecords = { for record in var.pvtdnszoneArecords : record.name => record }
  ######### Fetching the record name for data source the value ###################
  _pvtdnszoneArecords1 = flatten([for value in var.pvtdnszoneArecords : value.record])
  recordsecret         = { for secret in data.azurerm_key_vault_secret.recordsecret : secret.name => split(",", secret.value) }
}
