data "azurerm_client_config" "current" {
}
data "azurerm_key_vault" "MDWHSSecrets" {
  name                = var.prjKvName
  resource_group_name = var.prjKvRgName
}

data "azurerm_key_vault" "MDWHsprdkv" {
  name                = var.MDWHsprdkv
  resource_group_name = var.MDWHsprdkvrg
}

data "azurerm_key_vault" "MDWHsUatkv" {
  name                = var.MDWHsUatkv
  resource_group_name = var.MDWHsUatkvrg
}


data "azurerm_key_vault_secret" "MDWHsPrdWebVM01PrivateIpAddress" {
  name         = "MDWHsPrdWebVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsPrdAppVM01PrivateIpAddress" {
  name         = "MDWHsPrdAppVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsPrdAppVM02PrivateIpAddress" {
  name         = "MDWHsPrdAppVM02PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsUatWebVM01PrivateIpAddress" {
  name         = "MDWHsUatWebVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsUatAppVM01PrivateIpAddress" {
  name         = "MDWHsUatAppVM01PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsUatAppVM02PrivateIpAddress" {
  name         = "MDWHsUatAppVM02PrivateIpAddress"
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

data "azurerm_key_vault_secret" "MDWHsPrdWebVM01EncryptKeyURL" {
  name         = "guksprdhmdbow01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsPrdAppVM01EncryptKeyURL" {
  name         = "guksprdhmdboa01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsPrdAppVM02EncryptKeyURL" {
  name         = "guksprdhmdboa02-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsUatWebVM01EncryptKeyURL" {
  name         = "guksuathmdbow01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsUatAppVM01EncryptKeyURL" {
  name         = "guksuathmdboa01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsUatAppVM02EncryptKeyURL" {
  name         = "guksuathmdboa02-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}


data "azurerm_subnet" "MDWHsPrdVmSubnet" {
  name                 = var.MDWHsPrdSubnetName
  virtual_network_name = var.MDWHsPrdVnetName
  resource_group_name  = var.MDWHsPrdNetworkingRgName
}

data "azurerm_subnet" "MDWHsUatVmSubnet" {
  name                 = var.MDWHsUatSubnetName
  virtual_network_name = var.MDWHsUatVnetName
  resource_group_name  = var.MDWHsUatNetworkingRgName
}


#Storage for boot Diagnostic
data "azurerm_storage_account" "mdwhsprdbootDiagLogStorage" {

  name                = var.mdwhsprdbootDiagLogStName
  resource_group_name = var.mdwhsprdbootDiagLogStRgName
}

data "azurerm_storage_account" "mdwhsUatbootDiagLogStorage" {

  name                = var.mdwhsUatbootDiagLogStName
  resource_group_name = var.mdwhsUatbootDiagLogStRgName
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

data "azurerm_subnet" "MDWHsPrdBastionSubnet" {
  name                 = var.MDWHsPrdBastionSubnetName
  virtual_network_name = var.MDWHsPrdVnetName
  resource_group_name  = var.MDWHsPrdNetworkingRgName
}

data "azurerm_subnet" "MDWHsUatBastionSubnet" {
  name                 = var.MDWHsUatBastionSubnetName
  virtual_network_name = var.MDWHsUatVnetName
  resource_group_name  = var.MDWHsUatNetworkingRgName
}

####### import MDW Prd VM's #####################

data "azurerm_key_vault_secret" "adminUser1" {
  name         = "vm-admin-user1"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_subnet" "MDWHsUatVm04Subnet" {
  name                 = var.MDWHsUatVm04Subnet
  virtual_network_name = var.MDWHsUatVnetName
  resource_group_name  = var.MDWHsUatNetworkingRgName
}

data "azurerm_subnet" "MDWHsPrdVm04Subnet" {
  name                 = var.MDWHsPrdVm04Subnet
  virtual_network_name = var.MDWHsPrdVnetName
  resource_group_name  = var.MDWHsPrdNetworkingRgName
}

data "azurerm_key_vault" "MDWHsUatPrdVM04kv" {
  name                = var.MDWHsUatPrdVM04kv
  resource_group_name = var.MDWHsUatPrdVM04kvrg
}

data "azurerm_key_vault_secret" "MDWHsUatVM04PrivateIpAddress" {
  name         = "MDWHsUatVM04PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "MDWHsPrdVM04PrivateIpAddress" {
  name         = "MDWHsPrdVM04PrivateIpAddress"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "guksuthmdwirt01-ade-url" {
  name         = "guksuthmdwirt01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_key_vault_secret" "guksprhmdwirt01-ade-url" {
  name         = "guksprhmdwirt01-ade-url"
  key_vault_id = data.azurerm_key_vault.MDWHSSecrets.id
}

data "azurerm_backup_policy_vm" "Daily-2200-52W-InfraVM" {
  name                = "Daily-2200-52W-InfraVM"
  recovery_vault_name = var.MDWHsUatPrdrsv_name
  resource_group_name = var.MDWHsUatPrdrsv_rg_name
}
