data "azurerm_log_analytics_workspace" "laWorksapce" {
  name                = var.laWorkspacename
  resource_group_name = var.updateManagmentRgName

  depends_on = [module.createSSLogAnalyticsWorksapce]
}

data "azurerm_automation_account" "automationAccount" {
  name                = var.automationAccountName
  resource_group_name = var.updateManagmentRgName

  depends_on = [module.createSSUpdateManagementAutomationAccount]
}

################### Secrets for WSUS #############################

data "azurerm_key_vault" "kvmanagementSsSecrets" {
  name                = var.managementSsKvName
  resource_group_name = var.managementSsKvRgName
}

data "azurerm_key_vault_secret" "wsusPrivateStaticIpAddress" {
  name         = "wsusPrivateStaticIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

# Subnets
data "azurerm_subnet" "wsusSubnet" {
  name                 = var.wsusSubnetName
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsNetworkingRgName
}

data "azurerm_storage_account" "SA" {
  name                = var.storageAccountName
  resource_group_name = var.managementSsSaRgName
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

########## Details for Azure monitoring private link scope ######

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "spSecret" {
  name         = "ssmgmtContributorSPSecret"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "spApplicationId" {
  name         = "ssmgmtContributorSPAppId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

################### Azure Disk Encryption ###################

data "azurerm_key_vault" "kvmanagementSsKeyVault" {
  name                = var.managementSsAdeKvName
  resource_group_name = var.managementSsAdeKvRgName
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "mgmtss-SubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}

data "azurerm_key_vault_secret" "sswusEncryptKeyURL" {
  name         = "eitukssswus01-ade-url"
  key_vault_id = data.azurerm_key_vault.kvmanagementSsSecrets.id
}
