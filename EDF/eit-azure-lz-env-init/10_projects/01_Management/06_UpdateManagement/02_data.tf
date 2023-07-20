# #Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = ".security"
}

data "azurerm_key_vault_secret" "wsusPrivateStaticIpAddress" {
  name         = "wsusPrivateStaticIpAddress"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

data "azurerm_key_vault_secret" "storageAccountKey" {
  name         = "aux-hsafs-sa-key"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

# Subnets
data "azurerm_subnet" "wsusSubnet" {
  name                 = var.wsusSubnetName
  virtual_network_name = var.lzmanagementHsVnetName
  resource_group_name  = var.lzmanagementHsNetworkingRgName
}

###################### LAW and AAC #######
data "azurerm_log_analytics_workspace" "laWorksapce" {
  name                = var.laWorkspacename
  resource_group_name = var.updateManagmentRgName
  # depends_on = [module.createHSLogAnalyticsWorksapce]
}
data "azurerm_automation_account" "automationAccount" {
  name                = var.automationAccountName
  resource_group_name = var.updateManagmentRgName
  # depends_on = [module.createHSUpdateManagementAutomationAccount]
}
################ Private endpoint ##################
data "azurerm_subnet" "PEPsubnet" {
  # name                 = "eit-alz-hs-pep-snet-01"
  name                 = "eit-alz-hs-audit-snet-01"
  virtual_network_name = "eit-uks-alz-hs-mgmt-vnet-01"
  resource_group_name  = "eit-uks-alz-hs-mgmt-vnet-rg"
}
data "azurerm_key_vault_secret" "spokeSubscriptionId" {
  name         = "hsManagementSubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

######### LAW diag setting ##########################

data "azurerm_key_vault_secret" "hsmgmt-laworkspaceResourceId" {
  name         = "hsmgmt-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
#######
data "azurerm_key_vault_secret" "dnszoneid" {
  name         = "dnszoneid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
