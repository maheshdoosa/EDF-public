################### ADO Data Source ###################

data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = ".security"
}

#Storage for boot Diagnostic
data "azurerm_storage_account" "bootDiagLogStorage" {

  name                = var.bootDiagLogStorageAccountName
  resource_group_name = var.bootDiagLogStorageAccountRgName
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "hsManagementSubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "vmssadminuser" {
  name         = "vmssadminuser"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "vmssadminPassword" {
  name         = "vmssadminpassword"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_subnet" "hsvmssadosubnet" {
  name                 = var.vmsssubnetname
  virtual_network_name = var.vmssvnetname
  resource_group_name  = var.vmssvnetrg
}

data "azurerm_log_analytics_workspace" "laWorksapce" {
  name                = var.laWorkspacename
  resource_group_name = var.updateManagmentRgName
}

# data "azurerm_key_vault_secret" "adopattoken" {
#   name         = "adopattoken"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }

###### ADE ##################

# data "azurerm_key_vault" "kvmanagementHsKeyVault" {
#   name                = var.managementHsAdeKvName
#   resource_group_name = var.managementHsAdeKvRgName
# }

# variable "managementHsAdeKvName" {
#   description = "managementHsKVRgName"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }

# variable "managementHsAdeKvRgName" {
#   description = "managementHsKVRgName"
#   default     = ".tmp-dev" //intentionally kept it to something unrealistic
#   type        = string
# }
