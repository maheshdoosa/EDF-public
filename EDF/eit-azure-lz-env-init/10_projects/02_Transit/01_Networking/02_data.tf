#Secrets
data "azurerm_key_vault" "kvTransitSecrets" {
  name                = var.transitKvName
  resource_group_name = var.transitKvRgName
}

data "azurerm_key_vault_secret" "vnet_secrets" {
  count        = length(local.vnet_secret_names)
  name         = local.vnet_secret_names[count.index]
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "transit-udr-prefixes" {
  for_each     = var.UDR
  name         = each.value.kv_secret_udrprefixes
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

#####################################################################
data "azurerm_key_vault_secret" "transit-udr-nexthop" {
  for_each     = var.UDR
  name         = each.value.kv_secret_nexthopIP
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

# ####### Commented old code ###############


# #Secrets
# data "azurerm_key_vault" "kvTransitSecrets" {
#   name                = var.transitKvName
#   resource_group_name = var.transitKvRgName
# }

# data "azurerm_key_vault_secret" "adDcIp1" {
#   name         = "lz-ad-dc-ip1"
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_key_vault_secret" "adDcIp2" {
#   name         = "lz-ad-dc-ip2"
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_key_vault_secret" "transitVnetAddressSpace" {
#   name         = "transit-vnet-address-space"
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_key_vault_secret" "hsManageVnetAddressSpace" {
#   name         = "hsmanage-vnet-address-space"
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_key_vault_secret" "t1fw-ilb-ip" {
#   name         = var.t1fwIlbIp
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_key_vault_secret" "t2fw-ilb-ip" {
#   name         = var.t2fwIlbIp
#   key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
# }

# data "azurerm_subnet" "t1intfwTransitSubnetName" {
#   name                 = var.t1intfwTransitSubnetName
#   virtual_network_name = var.lzTransitVnetName
#   resource_group_name  = var.lzTransitNetworkingRgName
# }
# data "azurerm_subnet" "t1extfwTransitSubnetName" {
#   name                 = var.t1extfwTransitSubnetName
#   virtual_network_name = var.lzTransitVnetName
#   resource_group_name  = var.lzTransitNetworkingRgName
# }
# data "azurerm_subnet" "t1mgmtfwTransitSubnetName" {
#   name                 = var.t1mgmtfwTransitSubnetName
#   virtual_network_name = var.lzTransitVnetName
#   resource_group_name  = var.lzTransitNetworkingRgName
# }
# data "azurerm_subnet" "t2intfwTransitSubnetName" {
#   name                 = var.t2intfwTransitSubnetName
#   virtual_network_name = var.lzTransitVnetName
#   resource_group_name  = var.lzTransitNetworkingRgName
# }
# data "azurerm_subnet" "t2mgmtfwTransitSubnetName" {
#   name                 = var.t2mgmtfwTransitSubnetName
#   virtual_network_name = var.lzTransitVnetName
#   resource_group_name  = var.lzTransitNetworkingRgName
# }
# data "azurerm_subnet" "t1fwHaSyncTransitSubnetName" {
#   name                 = var.t1HaSyncfwTransitSubnetName
#   virtual_network_name = var.lzTransitVnetName
#   resource_group_name  = var.lzTransitNetworkingRgName
# }
