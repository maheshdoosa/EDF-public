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
data "azurerm_subnet" "externalSubnet" {
  name                 = var.f5externalSubnetName
  virtual_network_name = var.f5VnetName
  resource_group_name  = var.f5VnetResourceGroupName
}
data "azurerm_subnet" "internalSubnet" {
  name                 = var.f5internalSubnetName
  virtual_network_name = var.f5VnetName
  resource_group_name  = var.f5VnetResourceGroupName
}

######################## VM1 IP Address List ##########################

data "azurerm_key_vault_secret" "f5Vm1mgmtIpAddress" {
  name         = "f5Vm1mgmtIpAddress"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "f5Vm1externalIpAddress1" {
  name         = "f5Vm1externalIpAddress1"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "f5Vm1externalIpAddress2" {
  name         = "f5Vm1externalIpAddress2"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "f5Vm1externalIpAddress3" {
  name         = "f5Vm1externalIpAddress3"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
/*
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress4" {
  name         = "f5Vm1externalIpAddress4"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress5" {
  name         = "f5Vm1externalIpAddress5"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress6" {
  name         = "f5Vm1externalIpAddress6"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress7" {
  name         = "f5Vm1externalIpAddress7"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress8" {
  name         = "f5Vm1externalIpAddress8"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress9" {
  name         = "f5Vm1externalIpAddress9"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress10" {
  name         = "f5Vm1externalIpAddress10"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress11" {
  name         = "f5Vm1externalIpAddress11"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress12" {
  name         = "f5Vm1externalIpAddress12"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress13" {
  name         = "f5Vm1externalIpAddress13"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress14" {
  name         = "f5Vm1externalIpAddress14"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress15" {
  name         = "f5Vm1externalIpAddress15"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress16" {
  name         = "f5Vm1externalIpAddress16"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress17" {
  name         = "f5Vm1externalIpAddress17"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress18" {
  name         = "f5Vm1externalIpAddress18"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress19" {
  name         = "f5Vm1externalIpAddress19"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm1externalIpAddress20" {
  name         = "f5Vm1externalIpAddress20"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
*/


data "azurerm_key_vault_secret" "f5Vm1internalIpAddress" {
  name         = "f5Vm1internalIpAddress"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

##################### VM2 IP Address List ##################

data "azurerm_key_vault_secret" "f5Vm2mgmtIpAddress" {
  name         = "f5Vm2mgmtIpAddress"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "f5Vm2externalIpAddress1" {
  name         = "f5Vm2externalIpAddress1"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "f5Vm2externalIpAddress2" {
  name         = "f5Vm2externalIpAddress2"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

data "azurerm_key_vault_secret" "f5Vm2externalIpAddress3" {
  name         = "f5Vm2externalIpAddress3"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
/*
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress4" {
  name         = "f5Vm2externalIpAddress4"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress5" {
  name         = "f5Vm2externalIpAddress5"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress6" {
  name         = "f5Vm2externalIpAddress6"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress7" {
  name         = "f5Vm2externalIpAddress7"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress8" {
  name         = "f5Vm2externalIpAddress8"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress9" {
  name         = "f5Vm2externalIpAddress9"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress10" {
  name         = "f5Vm2externalIpAddress10"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress11" {
  name         = "f5Vm2externalIpAddress11"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress12" {
  name         = "f5Vm2externalIpAddress12"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress13" {
  name         = "f5Vm2externalIpAddress13"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress14" {
  name         = "f5Vm2externalIpAddress14"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress15" {
  name         = "f5Vm2externalIpAddress15"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress16" {
  name         = "f5Vm2externalIpAddress16"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress17" {
  name         = "f5Vm2externalIpAddress17"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress18" {
  name         = "f5Vm2externalIpAddress18"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress19" {
  name         = "f5Vm2externalIpAddress19"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
data "azurerm_key_vault_secret" "f5Vm2externalIpAddress20" {
  name         = "f5Vm2externalIpAddress20"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}
*/

data "azurerm_key_vault_secret" "f5Vm2internalIpAddress" {
  name         = "f5Vm2internalIpAddress"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}


#################### Internal Load balancer IP ##################
data "azurerm_key_vault_secret" "f5InternalLbPrivateIpAddress" {
  name         = "f5InternalLbPrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.kvTransitSecrets.id
}

############### Enabling F5 VM Backup ###########

data "azurerm_client_config" "current" {}
