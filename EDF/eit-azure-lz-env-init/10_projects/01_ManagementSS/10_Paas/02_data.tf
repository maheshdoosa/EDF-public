#Secrets
data "azurerm_key_vault" "kvmanagementSSSecrets" {
  name                = var.managementSSKvName
  resource_group_name = var.managementSSKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "mgmtss-SubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpId" {
  name         = "ssmgmtContributorSPAppId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpSecret" {
  name         = "ssmgmtContributorSPSecret"
  key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
}

########### Backup ###########

data "azurerm_log_analytics_workspace" "Laworkspace" {
  name                = var.LaName
  resource_group_name = var.La_resource_group_name
}

data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
  resource_id = module.az-recoveryservicevault.recovery_services_vault.id
}

######## AFS data sources secrets ################

data "azurerm_storage_account" "AFSSaName" {
  name                = var.lzmanagementSsAFSSaName
  resource_group_name = var.lzmanagementSsAFSVmRgName
  # depends_on = [    module.azurestorageaccountAFS  ]
}

data "azurerm_storage_sync" "AFSsasync" {
  name                = var.lzmanagementSsAFSSaSyncName
  resource_group_name = var.lzmanagementSsAFSVmRgName
  # depends_on = [    module.azure-storage-sync-AFS  ]
}

data "azurerm_storage_sync_group" "AFSSaSyncGroup" {
  name            = var.lzmanagementSsAFSSaSyncName
  storage_sync_id = data.azurerm_storage_sync.AFSsasync.id
  # depends_on = [    module.azure-storage-sync-AFS  ]
}

data "azurerm_subnet" "AFSSysSubnet" {
  name                 = var.lzmanagementSsAuditSubnetName
  virtual_network_name = var.lzmanagementSsVnetName
  resource_group_name  = var.lzmanagementSsAFSRgName


}

data "azurerm_storage_account" "azAFSsa" {
  name                = var.lzmanagementSsAFSSaName
  resource_group_name = var.lzmanagementSsAFSVmRgName
  # depends_on = [    module.azurestorageaccountAFS  ]
}

data "azurerm_key_vault_secret" "afs-sync-group-id" {
  name         = "afs-sync-group-id"
  key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
}

########### KeyVault ###########
data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  #depends_on          = [module.createkeyvault]
}
/*
data "azurerm_private_dns_zone" "dnszone" {
  name                                  = var.private_dns_zone_name
  resource_group_name                   = var.kv_resource_group_name
  depends_on                            = [module.azure-private-dns-zone]
}*/
/*
data "azuread_group" "adgroup" {
  display_name = var.aad_group
}


data "azuread_user" "aduser" {
  user_principal_name = var.aad_user #["kat@hashicorp.com", "byte@hashicorp.com"]
}*/

data "azurerm_client_config" "current" {

}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementSSSecrets.id
}

data "azurerm_virtual_network" "mgmtPrdSSVnet" {
  name                = var.mgmtPrdSSVnetName
  resource_group_name = var.mgmtPrdSSNetworkingRgName
}
data "azurerm_subnet" "mgmtSSPrdsubnet" {
  name                 = var.mgmtPrdSSSubnetName
  virtual_network_name = var.mgmtPrdSSVnetName
  resource_group_name  = var.mgmtPrdSSNetworkingRgName
}
data "azurerm_storage_account" "mgmtPrdSSvmsa" {
  name                = var.mgmt_vmsa_name
  resource_group_name = var.mgmt_vmsa_resourceGroupName
}
data "azurerm_private_dns_zone" "mgmtsaDnszone" {
  name                = var.private_dns_zone_name
  resource_group_name = var.mgmtPrivateDNSRgName
}

data "azurerm_storage_account" "mgmtPrdSSsublogsa" {
  name                = var.mgmt_sublogsa_name
  resource_group_name = var.mgmt_sublogsa_resourceGroupName
}
/*
data "azuread_user" "aduser01" {
  user_principal_name = var.aad_user01
}

data "azuread_user" "aduser02" {
  user_principal_name = var.aad_user02
}*/

data "azurerm_key_vault" "adekeyvault" {
  name                = var.ade_keyvault_name
  resource_group_name = var.ade_kv_resource_group_name
}

data "azurerm_key_vault" "avmkeyvault" {
  name                = var.avm_keyvault_name
  resource_group_name = var.avm_kv_resource_group_name
}



data "azurerm_subnet" "mgmtsubnet" {
  name                 = var.mgmtpepSubnetName
  virtual_network_name = var.mgmtVnetName
  resource_group_name  = var.mgmtNetworkingRgName
}

data "azurerm_private_dns_zone" "mgmtssDnszone" {
  name                = var.private_dns_zone_kv_name
  resource_group_name = var.mgmtkvPrivateDNSRgName
}

data "azurerm_key_vault" "credkeyvault" {
  name                = var.keyvault_name01
  resource_group_name = var.kv_resource_group_name01
}

data "azurerm_storage_account" "mgmtPrdSSavmsa" {
  name                = var.mgmtavmsa
  resource_group_name = var.mgmtavmsaRgName
}
data "azurerm_storage_account" "mgmtPrdSSauxsa" {
  name                = var.mgmtauxsa
  resource_group_name = var.mgmtauxsaRgName
}
data "azurerm_storage_account" "mgmtPrdSSntcsa" {
  name                = var.mgmtntcsa
  resource_group_name = var.mgmtntcsaRgName
}
data "azurerm_storage_account" "mgmtPrdSSclisa" {
  name                = var.mgmtclisa
  resource_group_name = var.mgmtclisaRgName
}
