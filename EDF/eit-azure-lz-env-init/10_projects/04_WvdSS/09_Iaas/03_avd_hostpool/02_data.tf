# block to fetch existing Key vault which has Service principal secrets and script files needed for hostpool registration

data "azurerm_key_vault" "wvd_SPkeyvault" {
  for_each            = var.hostpool
  name                = each.value.SPkeyvaultName
  resource_group_name = each.value.SPkeyvaultRGName
}


data "azurerm_key_vault_secret" "spApplicationId" {
  for_each     = var.hostpool
  name         = each.value.spApplicationId
  key_vault_id = data.azurerm_key_vault.wvd_SPkeyvault[each.key].id
}

data "azurerm_key_vault_secret" "spSecret" {
  for_each     = var.hostpool
  name         = each.value.spSecret
  key_vault_id = data.azurerm_key_vault.wvd_SPkeyvault[each.key].id
}

data "azurerm_key_vault_secret" "tenantId" {
  for_each     = var.hostpool
  name         = each.value.tenantId
  key_vault_id = data.azurerm_key_vault.wvd_SPkeyvault[each.key].id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  for_each     = var.hostpool
  name         = each.value.subscriptionId
  key_vault_id = data.azurerm_key_vault.wvd_SPkeyvault[each.key].id
}

data "azurerm_key_vault_secret" "LZworkspaceId" {
  for_each     = var.hostpool
  name         = each.value.LZworkspaceId
  key_vault_id = data.azurerm_key_vault.wvd_SPkeyvault[each.key].id
}

data "azurerm_key_vault" "wvd_hpkeyvault" {
  for_each            = var.avd_AppGroup
  name                = each.value.HPkeyvaultName
  resource_group_name = each.value.HPkeyvaultRGName
}

data "azurerm_key_vault_secret" "hostpoolId" {
  for_each     = var.avd_AppGroup
  name         = each.value.avd_HostPool_ID
  key_vault_id = data.azurerm_key_vault.wvd_hpkeyvault[each.key].id
}

data "azurerm_key_vault_secret" "workspaceId" {
  for_each     = var.avd_AppGroup
  name         = each.value.avd_WorkSpace_ID
  key_vault_id = data.azurerm_key_vault.wvd_hpkeyvault[each.key].id
}

data "azurerm_key_vault" "wvd_AppGrpkeyvault" {
  for_each            = var.ADgroups
  name                = each.value.AppGrpkeyvaultName
  resource_group_name = each.value.AppGrpkeyvaultRGName
}

data "azurerm_key_vault_secret" "AppgroupId" {
  for_each     = var.ADgroups
  name         = each.value.AppgroupResourceID
  key_vault_id = data.azurerm_key_vault.wvd_AppGrpkeyvault[each.key].id
}
