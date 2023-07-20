#Secrets
data "azurerm_key_vault" "kvTransitSecrets" {
  name                = var.transitKvName
  resource_group_name = var.transitKvRgName
}
data "azurerm_key_vault_secret" "adminUser" {
  name         = "f5AdminUserName"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "adminPassword" {
  name         = "f5AdminPassword"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

# Subnets
data "azurerm_subnet" "mgmtSubnet" {
  name                 = var.f5mgmtSubnetName        #"mgmt-subnet-f5"
  virtual_network_name = var.f5VnetName              #"testf5sandvnet"
  resource_group_name  = var.f5VnetResourceGroupName #"testf5sandrg"
}
data "azurerm_subnet" "f5Subnet2" {
  name                 = var.f5Subnet2Name              #"mgmt-subnet-f5"
  virtual_network_name = var.f5Subnet2Vnet              #"testf5sandvnet"
  resource_group_name  = var.f5Subnet2ResourceGroupName #"testf5sandrg"
}

######################## VM1 IP Address List ##########################
data "azurerm_key_vault_secret" "f5Vm1primaryIpAddress" {
  name         = "eit-uks-alz-f5-int-primary"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1mgmtIpAddress" {
  name         = "eit-uks-alz-f5-int-mgmt-primary"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

##################### VM2 IP Address List ##################
data "azurerm_key_vault_secret" "f5Vm2secondIpAddress" {
  name         = "eit-uks-alz-f5-int-secondary"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2mgmtIpAddress" {
  name         = "eit-uks-alz-f5-int-mgmt-secondary"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

########
data "azurerm_key_vault_secret" "LbPrivateIpAddress" {
  name         = "eit-uks-f5-prod-LbPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

############### Enabling F5 VM Backup ###########

# data "azurerm_client_config" "current" {}
data "azurerm_key_vault_secret" "laworkspaceId01" {
  name         = "laworkspaceId01"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}
