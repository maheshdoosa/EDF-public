data "azurerm_key_vault" "kv" {
  name                = var.kvname
  resource_group_name = var.kvrg
}

data "azurerm_key_vault_secret" "kvsecretghpat" {
  name         = "target-gh-pat"
  key_vault_id = data.azurerm_key_vault.kv.id
}
