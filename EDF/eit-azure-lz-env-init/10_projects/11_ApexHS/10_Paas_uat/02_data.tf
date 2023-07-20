
########### APEX HS Resources #############

data "azurerm_client_config" "current" {}

#Secrets
data "azurerm_key_vault" "ApexHsprdSecrets" {
  name                = var.managedGenHSKvName
  resource_group_name = var.managedGenHSKvRgName
}

# data "azurerm_key_vault_secret" "laworkspaceResourceId" {
#   name         = "laworkspaceResourceId"
#   key_vault_id = data.azurerm_key_vault.ApexHsprdSecrets.id
# }

data "azurerm_virtual_network" "ApexHsPrdVnet" {
  name                = var.ApexHsPrdVnetName
  resource_group_name = var.ApexHsPrdNetworkingRgName
}


data "azurerm_subnet" "ApexHsPrdsubnet" {
  name                 = var.ApexHsPrdSubnetName
  virtual_network_name = var.ApexHsPrdVnetName
  resource_group_name  = var.ApexHsPrdNetworkingRgName
}

data "azurerm_key_vault" "ApexHsPrdkeyvault" {
  name                = var.ApexHS_keyvault_name
  resource_group_name = var.ApexHS_kv_resourceGroupName
  #depends_on          = [module.create-keyvault-for-ApexHs]
}

#data "azurerm_private_dns_zone" "ApexHsDnszone" {
#  name                = var.private_dns_zone_name
#  resource_group_name = var.ApexHSPrivateDNSRgName
#depends_on          = [module.azure-private-dns-zone-ApexHs]
#}
data "azurerm_key_vault_secret" "dnszone" {
  name         = "dnszoneId"
  key_vault_id = data.azurerm_key_vault.ApexHsprdSecrets.id
}


data "azurerm_subnet" "auxScriptspesubnet" {
  name                 = var.apexuatpesubnetName
  virtual_network_name = var.apexuatpeVnetName
  resource_group_name  = var.apexuatpeVnetRgName
}
data "azurerm_storage_account" "auxScriptssa" {
  name                = var.prdscriptsSA
  resource_group_name = var.ApexHSprdscriptsRgName
}
data "azurerm_key_vault_secret" "HScentraldnszoneid" {
  name         = "HScentraldnszoneid"
  key_vault_id = data.azurerm_key_vault.ApexHsprdSecrets.id
}
data "azurerm_storage_account" "vmlogssa" {
  name                = var.prdvmDiagSA
  resource_group_name = var.ApexHSprdVmLogsRgName
}
data "azurerm_storage_account" "avmsatst" {
  name                = var.avmsa
  resource_group_name = var.avmsaRgName
}
data "azurerm_storage_account" "avmsanp" {
  name                = var.avmgen
  resource_group_name = var.avmsaRgName
}

data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.ApexHsprdSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.ApexHsprdSecrets.id
}
