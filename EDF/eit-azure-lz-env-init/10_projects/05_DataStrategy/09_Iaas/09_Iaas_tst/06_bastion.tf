
############ importing MDW Dev Bastion Host Resource group ###########
module "create-dev-bastion_rg" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.mdw_dev_bastion_rg_name
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Tst-resourceGroupTags.tagsResult //

}

########### importing MDW Tst Bastion Host Resource group ###########
module "create-tst-bastion_rg" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.mdw_tst_bastion_rg_name
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Tst-resourceGroupTags.tagsResult //

}

############ importing MDW Dev Bastion Host Public IP ###########

module "create-dev-bastion_pip" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ip?ref=v1.1.19"
  ipName            = var.mdw-dev-bastion_pip_name
  location          = var.MDWHsResourceLocation
  resourceGroupName = var.mdw_dev_bastion_rg_name
  allocationMethod  = "Static" //should be static allways
  sku               = var.mdw_bastion_pip_sku
  depends_on        = [module.create-dev-bastion_rg]
}

############ importing MDW Tst Bastion Host Public IP ###########

module "create-tst-bastion_pip" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ip?ref=v1.1.19"
  ipName            = var.mdw-tst-bastion_pip_name
  location          = var.MDWHsResourceLocation
  resourceGroupName = var.mdw_tst_bastion_rg_name
  allocationMethod  = "Static" //should be static allways
  sku               = var.mdw_bastion_pip_sku
  depends_on        = [module.create-tst-bastion_rg]
}

############ importing MDW Dev Bastion Host  ###########

module "create-dev-bastion-host" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-bastion?ref=v1.1.1"
  bastionname = var.mdw_dev_bastion_host_name
  location    = var.MDWHsResourceLocation
  rgname      = var.mdw_dev_bastion_rg_name
  ipname      = var.mdw_bastion_host_ipname
  subnetid    = data.azurerm_subnet.MDWHsDevBastionSubnet.id
  pipid       = module.create-dev-bastion_pip.ipId
  depends_on  = [module.create-dev-bastion_pip]

  diag_settings_name         = var.mdw_dev_bastion_diag_name
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
  target_resource_id         = module.create-dev-bastion-host.bastionid

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

############ importing MDW Tst Bastion Host ###########

module "create-tst-bastion-host" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-bastion?ref=v1.1.1"
  bastionname = var.mdw_tst_bastion_host_name
  location    = var.MDWHsResourceLocation
  rgname      = var.mdw_tst_bastion_rg_name
  ipname      = var.mdw_bastion_host_ipname
  subnetid    = data.azurerm_subnet.MDWHsTstBastionSubnet.id
  pipid       = module.create-tst-bastion_pip.ipId
  depends_on  = [module.create-tst-bastion_pip]

  diag_settings_name         = var.mdw_tst_bastion_diag_name
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
  target_resource_id         = module.create-tst-bastion-host.bastionid

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
