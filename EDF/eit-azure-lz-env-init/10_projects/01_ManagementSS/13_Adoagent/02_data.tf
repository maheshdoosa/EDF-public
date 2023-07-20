################### ADO Data Source ###################
# #Secrets
data "azurerm_key_vault" "kvmanagementSsSecrets" {
  name                = var.managementSsKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "mgmtss-SubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}


data "azurerm_key_vault_secret" "vmssadminuser" {
  name         = "vmssadminuser"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "vmssadminPassword" {
  name         = "vmssadminpassword"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_subnet" "ssvmssadosubnet" {
  name                 = var.vmsssubnetname
  virtual_network_name = var.vmssvnetname
  resource_group_name  = var.vmssvnetrg
}

data "azurerm_log_analytics_workspace" "laWorksapce" {
  name                = var.laWorkspacename
  resource_group_name = var.updateManagmentRgName
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}
