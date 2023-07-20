#### Import the existing created zones and records to TFstate AZT-3607

locals {

  ########## Creating RG ###################################

  rgs = { for rg in keys(var.rgs) : rg => var.rgs[rg] if var.rgs[rg].enable == true }

  ######### change the private dns zone creation as list to map type ###############

  _zones = { for z in var.pvtdnszones : z.zone => z }

  ######### Create the Private DNS zone ########################

  pvtdnszone = { for zone1 in keys(local._zones) : zone1 => local._zones[zone1] if local._zones[zone1].enable == true }

  ######### change the private dns zone A record creation as list to map type ###############

  _pvtdnszoneArecords = { for record in var.pvtdnszoneArecords : record.name => record }

  ######### Fetching the record name for data source the value ###################
  _pvtdnszoneArecords1 = flatten([for value in var.pvtdnszoneArecords : value.record])

  recordsecret = { for secret in data.azurerm_key_vault_secret.recordsecret : secret.name => split(",", secret.value) }

}

# output "record" {
#   value = local._pvtdnszoneArecords
# }

# output "record1" {
#   value = local._pvtdnszoneArecords1
# }

# output "record2" {
#   value = local.recordsecret
# }

# output "record3" {
#   value = "${data.azurerm_key_vault_secret.recordsecret[0].value}"
#   # sensitive   = true
# }
