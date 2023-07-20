##### Secrets ##########
#   data "azurerm_key_vault" "kvmanagementSSSecrets" {
#    name                = var.managementSSKvName
#    resource_group_name = var.managementSSKvRgName
#  }

#  data "azurerm_key_vault_secret" "tenantId" {
#    name         = "tenantId"
#    key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
#  }

#  data "azurerm_key_vault_secret" "subscriptionId" {
#    name         = "mgmtss-SubscriptionId"
#    key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
#  }

#  data "azurerm_key_vault_secret" "contributorSpId" {
#    name         = "ssmgmtContributorSPAppId"
#    key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
#  }

#  data "azurerm_key_vault_secret" "contributorSpSecret" {
#    name         = "ssmgmtContributorSPSecret"
#    key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
#  }

# ########### Backup ###########

# data "azurerm_log_analytics_workspace" "Laworkspace" {
#   name                = var.LaName
#   resource_group_name = var.La_resource_group_name
# }

# data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
#   resource_id = module.az-recoveryservicevault.recovery_services_vault.id
# }

###############
data "azurerm_key_vault" "kvm365subSSecrets" {
  name                = var.m365subSSKvName
  resource_group_name = var.m365subSSKvRgName
}
# data "azurerm_key_vault_secret" "SScentraldnszoneid" {
#   name         = "SScentraldnszoneid"
#   key_vault_id = data.azurerm_key_vault.kvm365subSSecrets.id
# }

data "azurerm_key_vault_secret" "SScentralblobdnszoneid" {
  name         = "SScentralblobdnszoneid"
  key_vault_id = data.azurerm_key_vault.kvm365subSSecrets.id
}
data "azurerm_storage_account" "m365subsa" {
  name                = var.m365SA
  resource_group_name = var.m365SubRgName
}
data "azurerm_subnet" "m365pesubnet" {
  name                 = var.m365pesubnetName
  virtual_network_name = var.m365VnetName
  resource_group_name  = var.m365NetworkingRgName
}
