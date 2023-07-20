#block to fetch existing subnet



data "azurerm_subnet" "avdSubnet" {
  for_each             = var.sessionhostType
  name                 = each.value.avd_subnetname
  virtual_network_name = each.value.avd_vnetName
  resource_group_name  = each.value.avd_vnetRG
}


# block to fetch existing storage account which will be used to store boot diagnostics logs
data "azurerm_storage_account" "bootDiagLogStorage" {
  for_each            = var.sessionhostType
  name                = each.value.bootDiagLogStorageName
  resource_group_name = each.value.bootDiagLogStorageRGName
}

#block to fetch existing key vault which will be used for disk encryption

data "azurerm_key_vault" "wvd_encryt_keyvault" {
  for_each            = var.sessionhostType
  name                = each.value.EncryptKeyvaultName
  resource_group_name = each.value.EncryptKeyvaultRGName
}



# block to fetch existing Key vault which has AVD secrets

data "azurerm_key_vault" "wvd_Secretskeyvault" {
  for_each            = var.sessionhostType
  name                = each.value.SecretsKeyvaultName
  resource_group_name = each.value.SecretsKeyvaultRGName
}


data "azurerm_key_vault_secret" "spApplicationId" {
  for_each     = var.sessionhostType
  name         = each.value.spApplicationId
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "spSecret" {
  for_each     = var.sessionhostType
  name         = each.value.spSecret
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "tenantId" {
  for_each     = var.sessionhostType
  name         = each.value.tenantId
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  for_each     = var.sessionhostType
  name         = each.value.subscriptionId
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "VM-userID" {
  for_each     = var.sessionhostType
  name         = each.value.VMuser_SecretName
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "VM-password" {
  for_each     = var.sessionhostType
  name         = each.value.VMpass_SecretName
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "storageKey" {
  for_each     = var.sessionhostType
  name         = each.value.storagekey_secretName
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "Domain-Name" {
  for_each     = var.sessionhostType
  name         = each.value.VMdomain_Secretname
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "avd_OU_Path" {
  for_each     = var.sessionhostType
  name         = each.value.avd_OU_secret_name
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "Domain_Join_username" {
  for_each     = var.sessionhostType
  name         = each.value.avd_domainjoin_user_secretname
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "Domain_Join_Password" {
  for_each     = var.sessionhostType
  name         = each.value.avd_domainjoin_password_secretname
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "VM-imageID" {
  for_each     = var.sessionhostType
  name         = each.value.avd_SharedImage_Id
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

# data source existing log analytics workspace

data "azurerm_key_vault_secret" "LZ_workspaceID" {
  for_each     = var.sessionhostType
  name         = each.value.LZ_workspaceID
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}

data "azurerm_key_vault_secret" "LZ_workspaceKey" {
  for_each     = var.sessionhostType
  name         = each.value.LZ_workspaceKey
  key_vault_id = data.azurerm_key_vault.wvd_Secretskeyvault[each.key].id
}
