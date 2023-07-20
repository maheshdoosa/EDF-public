#Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = var.managementHsKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

# data "azurerm_key_vault_secret" "subscriptionId" {
#   name         = "hsManagementSubscriptionId"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }
/*
data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
*/
data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault" "hs-mgmt-kvs" {
  count               = length(var.diagsettingakv)
  name                = var.diagsettingakv[count.index]
  resource_group_name = ".security"
}

data "azurerm_key_vault" "hs-mgmt-kvs15" {
  count               = length(var.diagsettingakv15)
  name                = var.diagsettingakv15[count.index]
  resource_group_name = "eit-uks-alz-hs-cred-rg-01"
}

data "azurerm_key_vault" "hs-mgmt-kvs17" {
  count               = length(var.diagsettingakv17)
  name                = var.diagsettingakv17[count.index]
  resource_group_name = "eit-uks-alz-hs-ade-rg-01"
}

data "azurerm_key_vault" "hs-mgmt-kvs18" {
  count               = length(var.diagsettingakv18)
  name                = var.diagsettingakv18[count.index]
  resource_group_name = "eit-uks-alz-hs-ntc-rg"
}

data "azurerm_key_vault" "hs-mgmt-kvs19" {
  count               = length(var.diagsettingakv19)
  name                = var.diagsettingakv19[count.index]
  resource_group_name = "eit-uks-alz-hs-vmbackup-rg"
}

# data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
#   name         = "centaudit-laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }
# data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
#   name         = "hsmgmt-laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

data "azurerm_client_config" "current" {
}
