#Secrets
data "azurerm_key_vault" "kvmanagementHsSecrets" {
  name                = var.managementHsKvName
  resource_group_name = var.managementHsKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "subscriptionId" {
  name         = "hsManagementSubscriptionId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpId" {
  name         = "hsmgmtContributorSPAppId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

data "azurerm_key_vault_secret" "contributorSpSecret" {
  name         = "hsmgmtContributorSPSecret"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

######## AFS data sources secrets ################

data "azurerm_storage_account" "AFSSaName" {
  name                = var.lzmanagementHsAFSSaName
  resource_group_name = var.lzmanagementHsAFSVmRgName
  # depends_on = [    module.azurestorageaccountAFS  ]
}

data "azurerm_storage_sync" "AFSsasync" {
  name                = var.lzmanagementHsAFSSaSyncName
  resource_group_name = var.lzmanagementHsAFSVmRgName
  # depends_on = [    module.azure-storage-sync-AFS  ]
}

data "azurerm_storage_sync_group" "AFSSaSyncGroup" {
  name            = var.lzmanagementHsAFSSaSyncName
  storage_sync_id = data.azurerm_storage_sync.AFSsasync.id
  # depends_on = [    module.azure-storage-sync-AFS  ]
}

# data "azurerm_subnet" "AFSSysSubnet" {
#   name                 = var.lzmanagementHsAuditSubnetName
#   virtual_network_name = var.lzmanagementHsVnetName
#   resource_group_name  = var.lzmanagementHsVnetRgName

# }

data "azurerm_storage_account" "azAFSsa" {
  name                = var.lzmanagementHsAFSSaName
  resource_group_name = var.lzmanagementHsAFSVmRgName
  # depends_on = [    module.azurestorageaccountAFS  ]
}

data "azurerm_key_vault_secret" "afs-sync-group-id" {
  name         = "afs-sync-group-id"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}


############# SA PE ##############

data "azurerm_subnet" "mgmtHSpesubnet" {
  name                 = var.mgmtHSpesubnetName
  virtual_network_name = var.mgmtHSpeVnetName
  resource_group_name  = var.mgmtHSpeVnetRgName
}
data "azurerm_storage_account" "mgmtvmDiagHSauxsa" {
  name                = var.vmDiagSA
  resource_group_name = var.lzmanagementHsVmLogsRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_storage_account" "mgmtHSsubLogssa" {
  name                = var.subLogsSA
  resource_group_name = var.lzmanagementHsSubLogsRgName
}
data "azurerm_storage_account" "mgmtHSauxsa" {
  name                = var.auxScriptsSA
  resource_group_name = var.lzmanagementHsAuxScriptsRgName
}
data "azurerm_storage_account" "mgmtHSaddssa" {
  name                = var.mgmtaddssa
  resource_group_name = var.mgmtaddssaRgName
}
data "azurerm_storage_account" "mgmtHSntcsa" {
  name                = var.mgmtntcsa
  resource_group_name = var.mgmtntcsaRgName
}
data "azurerm_storage_account" "avmeit" {
  name                = var.avmeit
  resource_group_name = var.avmeitRgName
}
data "azurerm_storage_account" "tfstate" {
  name                = var.tfstate
  resource_group_name = var.tfstateRgName
}
############# Recovery Services Vault ############

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laResourceId"
#   key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
# }
data "azurerm_private_dns_zone" "Dnszone_file" {
  name                = var.AFS_private_dns_zone_name
  resource_group_name = var.mgmtPrivateDNSRgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}
