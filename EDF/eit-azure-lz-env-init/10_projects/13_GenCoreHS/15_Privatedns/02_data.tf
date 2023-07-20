data "azurerm_key_vault" "Secrets" {
  name                = var.KvName
  resource_group_name = var.KvRgName
}

data "azurerm_key_vault_secret" "recordsecret" {
  count        = length(local._pvtdnszoneArecords1)
  name         = local._pvtdnszoneArecords1[count.index]
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

########### below two of the record name were duplicated so created using direct modules  ################################

data "azurerm_key_vault_secret" "recordsecret01" {
  name         = "private-dns-ods"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}

data "azurerm_key_vault_secret" "recordsecret02" {
  name         = "private-dns-oms"
  key_vault_id = data.azurerm_key_vault.Secrets.id
}
