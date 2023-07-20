########## importing Bastion resource manually created AZT-3956 ######################

## This subnet has created through code we just data sourcing for bastion

data "azurerm_subnet" "bastion-subnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "eit-uks-alz-hs-mgmt-vnet-01"
  resource_group_name  = "eit-uks-alz-hs-mgmt-vnet-rg"
}

data "azurerm_key_vault_secret" "centaudit-laworkspaceResourceId" {
  name         = "centaudit-laworkspaceResourceId"
  key_vault_id = data.azurerm_key_vault.kvmanagementHsSecrets.id
}

## public IP import which has been created at that time of bastion deployment
module "createbastion_pip" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ip?ref=v1.1.19"
  ipName            = "eit-uks-alz-hs-bastion-pip-01"
  location          = var.lzHubManagementResourceLocation
  resourceGroupName = "eit-uks-alz-hs-mgmt-vnet-rg"
  allocationMethod  = "Static"
  sku               = "Standard"
}

## import bastion host
module "bastiondeployment-hs" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-bastion?ref=v1.1.1"
  bastionname = "eit-uks-alz-hs-mgmt-bastion-01"
  location    = var.lzHubManagementResourceLocation
  rgname      = "eit-uks-alz-hs-mgmt-vnet-rg"
  ipname      = "IpConf"
  subnetid    = data.azurerm_subnet.bastion-subnet.id
  pipid       = module.createbastion_pip.ipId

  diag_settings_name         = "bastion-log"
  log_analytics_workspace_id = data.azurerm_key_vault_secret.centaudit-laworkspaceResourceId.value
  target_resource_id         = module.bastiondeployment-hs.bastionid

  diagnostic_logs = [
    {
      category = "BastionAuditLogs"
      enabled  = true
      retention_policy = {
        enabled = true
        days    = 0
    } }
  ]

  diagnostic_metrics = [
    {
      category = "AllMetrics"
      enabled  = false
      retention_policy = {
        enabled = false
        days    = 0
    } }
  ]
}
