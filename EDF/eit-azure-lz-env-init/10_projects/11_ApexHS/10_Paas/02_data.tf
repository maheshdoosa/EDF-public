data "azurerm_client_config" "current" {}

#Secrets
data "azurerm_key_vault" "kvapexDevHSSecrets" {
  name                = var.apexKvName
  resource_group_name = var.apexKvRgName
}

data "azurerm_key_vault_secret" "tenantId" {
  name         = "tenantId"
  key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
}

# data "azurerm_key_vault_secret" "subscriptionId" {
#   name         = "subscriptionId"
#   key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
# }

########### Backup ###########

# data "azurerm_key_vault_secret" "laworkspaceId" {
#    name         = "laworkspaceId"
#    key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
#  }

# data "azurerm_key_vault_secret" "laworkspaceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
# }

# data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
#   resource_id = module.az-recoveryservicevault.recovery_services_vault.id
# }
########### KeyVault ###########

data "azurerm_virtual_network" "vnet" {
  name                = var.lzdevVnetName
  resource_group_name = var.lzdevNetworkingRgName
}

data "azurerm_virtual_network" "vnettst" {
  name                = var.lztstVnetName
  resource_group_name = var.lztstNetworkingRgName
}


data "azurerm_subnet" "subnet" {
  name                 = var.peSubnetName
  virtual_network_name = var.lzdevVnetName
  resource_group_name  = var.lzdevNetworkingRgName
}

data "azurerm_subnet" "subnettst" {
  name                 = var.peSubnetName_tst
  virtual_network_name = var.lztstVnetName
  resource_group_name  = var.lztstNetworkingRgName
}

data "azurerm_key_vault" "keyvault" {
  name                = var.keyvault_name
  resource_group_name = var.kv_resource_group_name
  #depends_on          = [module.createkeyvault]
}

data "azurerm_key_vault" "keyvaulttst" {
  name                = var.keyvault_name_tst
  resource_group_name = var.kv_resource_group_name_tst
  #depends_on          = [module.createkeyvaultTst]
}

#data "azurerm_private_dns_zone" "dnszone" {
#  name                = var.private_dns_zone_name
#  resource_group_name = var.kv_resource_group_name
#  #depends_on                            = [module.azure-private-dns-zone]
#}

data "azurerm_key_vault_secret" "dnszone" {
  name         = "dnszoneId"
  key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
}

#data "azurerm_private_dns_zone" "dnszonetst" {
#  name                = var.private_dns_zone_name
#  resource_group_name = var.kv_resource_group_name_tst
#depends_on                            = [module.azure-private-dns-zone-tst]
#}


data "azuread_group" "adgroup" {
  display_name = var.aad_group
}

data "azuread_user" "aduser" {
  user_principal_name = var.aad_user #["kat@hashicorp.com", "byte@hashicorp.com"]
}

# #Secrets
#   data "azurerm_key_vault" "kvapexDevHSSecrets" {
#    name                = var.apexDevHSKvName
#    resource_group_name = var.apexDevHSKvRgName
#  }

#  ########### Backup ###########

# data "azurerm_key_vault_secret" "laworkspaceResourceId" {
#    name         = "laworkspaceResourceId"
#    key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
#  }

# data "azurerm_monitor_diagnostic_categories" "recovery_vault_diagnostics_settings" {
#   resource_id = module.az-recoveryservicevault.recovery_services_vault.id
# }
data "azurerm_subnet" "apextstpesubnet" {
  name                 = var.apextstpesubnetName
  virtual_network_name = var.apextstpeVnetName
  resource_group_name  = var.apextstpeVnetRgName
}
data "azurerm_storage_account" "vmDiagDevsa" {
  name                = var.vmDiagSA
  resource_group_name = var.ApexHSVmLogsRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
}
data "azurerm_storage_account" "vmDiagtstsa" {
  name                = var.vmDiagtstSA
  resource_group_name = var.ApexHStstVmLogsRgName
}
data "azurerm_storage_account" "auxdevsa" {
  name                = var.auxdevsa
  resource_group_name = var.auxdevsaRgName
}
data "azurerm_storage_account" "auxtstsa" {
  name                = var.auxtstSA
  resource_group_name = var.auxtstSARgName
}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.kvapexDevHSSecrets.id
}
