data "azurerm_client_config" "current" {
}
data "azurerm_key_vault" "MDWHSSecrets" {
  name                = var.prjKvName
  resource_group_name = var.prjKvRgName
}

data "azurerm_key_vault" "MDWHsTstkv" {
  name                = var.MDWHsTstkv
  resource_group_name = var.MDWHsTstkvrg
}

data "azurerm_key_vault_secret" "MDWHsTstAppVM01PrivateIpAddress" {
  name         = "MDWHsTstAppVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}


data "azurerm_key_vault_secret" "adminPassword" {
  name         = "vm-admin-password"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "adminUser" {
  name         = "vm-admin-user"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "adminUser1" {
  name         = "vm-admin-user1"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "auxScriptsSAAccountKey" {
  name         = "mdwhs-aux-sa-key"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "laworkspaceId" {
  name         = "laworkspaceId"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "laWorkspaceKey" {
  name         = "laWorkspaceKey"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsTstAppVM01EncryptKeyURL" {
  name         = "gukststhmdboa01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}


data "azurerm_subnet" "MDWHsTstVmSubnet" {
  name                 = var.MDWHsTstSubnetName
  virtual_network_name = var.MDWHsTstVnetName
  resource_group_name  = var.MDWHsTstNetworkingRgName
}


#Storage for boot Diagnostic
data "azurerm_storage_account" "mdwhsTstbootDiagLogStorage" {

  name                = var.mdwhsTstbootDiagLogStName
  resource_group_name = var.mdwhsTstbootDiagLogStRgName
}

data "azurerm_key_vault_secret" "adDomainName" {
  name         = "adDomainName"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "adAdminUser" {
  name         = "ad-domainjoin-username"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "adAdminPassword" {
  name         = "ad-domainjoin-password"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_key_vault_secret" "laworkspaceId02" {
  name         = "laworkspaceId02"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}
data "azurerm_network_interface" "nicid" {
  for_each            = local.nic_fetch
  name                = each.key
  resource_group_name = each.value
}

data "azurerm_subnet" "MDWHsDevBastionSubnet" {
  name                 = var.MDWHsDevBastionSubnetName
  virtual_network_name = var.MDWHsDevVnetName
  resource_group_name  = var.MDWHsDevNetworkingRgName
}

data "azurerm_subnet" "MDWHsTstBastionSubnet" {
  name                 = var.MDWHsTstBastionSubnetName
  virtual_network_name = var.MDWHsTstVnetName
  resource_group_name  = var.MDWHsTstNetworkingRgName
}

######### MDW Dev VM Import ###############

data "azurerm_key_vault" "MDWHsDevkv" {
  name                = var.MDWHsDevkv
  resource_group_name = var.MDWHsDevkvrg
}

data "azurerm_key_vault_secret" "MDWHsDevVM01PrivateIpAddress" {
  name         = "MDWHsDevVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsDevVM02PrivateIpAddress" {
  name         = "MDWHsDevVM02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsTstVM02PrivateIpAddress" {
  name         = "MDWHsTstVM02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "guksdvhmdwboa01-ade-url" {
  name         = "guksdvhmdwboa01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "guksdvhmdwirt01-ade-url" {
  name         = "guksdvhmdwirt01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "gukstshmdwirt01-ade-url" {
  name         = "gukstshmdwirt01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}


data "azurerm_subnet" "MDWHsDevVm01Subnet" {
  name                 = var.MDWHsDevVM01SubnetName
  virtual_network_name = var.MDWHsDevVnetName
  resource_group_name  = var.MDWHsDevNetworkingRgName
}

data "azurerm_subnet" "MDWHsDevVm02Subnet" {
  name                 = var.MDWHsDevVM02SubnetName
  virtual_network_name = var.MDWHsDevVnetName
  resource_group_name  = var.MDWHsDevNetworkingRgName
}

data "azurerm_subnet" "MDWHsTstVm02Subnet" {
  name                 = var.MDWHsTstVM02SubnetName
  virtual_network_name = var.MDWHsTstVnetName
  resource_group_name  = var.MDWHsTstNetworkingRgName
}

data "azurerm_backup_policy_vm" "Daily-2200-52W-InfraVM" {
  name                = "Daily-2200-52W-InfraVM"
  recovery_vault_name = var.MDWHsDevrsv_name
  resource_group_name = var.MDWHsDevrsv_rg_name
}
