########### data source the provider details ####################

data "azurerm_key_vault" "Secrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}

data "azurerm_key_vault_secret" "tenant_id_transit" {
  name         = "tenant-id-transit"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

data "azurerm_key_vault_secret" "tenant_id_remote" {
  name         = "tenant-id-remote"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

data "azurerm_key_vault_secret" "sub_id_transit" {
  name         = "sub-id-transit"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

data "azurerm_key_vault_secret" "sub_id_remote" {
  name         = "sub-id-remote"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

# data "azurerm_key_vault_secret" "client_id_transit" {
#   name         = client-id-transit
#   key_vault_id = data.azurerm_key_vault.Secrets.id
# }

# data "azurerm_key_vault_secret" "secret_key_transit" {
#   name         = secret-key-transit
#   key_vault_id = data.azurerm_key_vault.Secrets.id
# }

#################### data source peering details ####################################

data "azurerm_virtual_network" "Transit" {
  provider            = azurerm.Transit
  name                = var.Transitvnet
  resource_group_name = var.TransitvnetRG
}

data "azurerm_virtual_network" "Remote" {
  provider            = azurerm.Remote
  name                = var.Remotevnet
  resource_group_name = var.RemotevnetRG
}
