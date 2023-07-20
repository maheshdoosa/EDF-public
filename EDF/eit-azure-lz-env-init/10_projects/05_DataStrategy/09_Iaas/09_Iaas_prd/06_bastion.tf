
############ importing MDW PRD Bastion Host Resource group ###########
module "create-prd-bastion_rg" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.mdw_prd_bastion_rg_name
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Prd-resourceGroupTags.tagsResult

}

########### importing MDW UAT Bastion Host Resource group ###########
module "create-uat-bastion_rg" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.mdw_uat_bastion_rg_name
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Uat-resourceGroupTags.tagsResult

}

############ importing MDW Dev Bastion Host Public IP ###########

module "create-prd-bastion_pip" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ip?ref=v1.1.19"
  ipName            = var.mdw-prd-bastion_pip_name
  location          = var.MDWHsResourceLocation
  resourceGroupName = var.mdw_prd_bastion_rg_name
  allocationMethod  = "Static" //should be static allways
  sku               = var.mdw_bastion_pip_sku
  depends_on        = [module.create-prd-bastion_rg]
}

############ importing MDW UAT Bastion Host Public IP ###########

module "create-uat-bastion_pip" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ip?ref=v1.1.19"
  ipName            = var.mdw-uat-bastion_pip_name
  location          = var.MDWHsResourceLocation
  resourceGroupName = var.mdw_uat_bastion_rg_name
  allocationMethod  = "Static" //should be static allways
  sku               = var.mdw_bastion_pip_sku
  depends_on        = [module.create-uat-bastion_rg]
}

############ importing MDW prd Bastion Host  ###########

module "create-prd-bastion-host" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-bastion?ref=v1.1.1"
  bastionname = var.mdw_prd_bastion_host_name
  location    = var.MDWHsResourceLocation
  rgname      = var.mdw_prd_bastion_rg_name
  ipname      = var.mdw_bastion_host_ipname
  subnetid    = data.azurerm_subnet.MDWHsPrdBastionSubnet.id
  pipid       = module.create-prd-bastion_pip.ipId
  depends_on  = [module.create-prd-bastion_pip]

  diag_settings_name         = var.mdw_prd_bastion_diag_name
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
  target_resource_id         = module.create-prd-bastion-host.bastionid

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

############ importing MDW uat Bastion Host ###########

module "create-uat-bastion-host" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-bastion?ref=v1.1.1"
  bastionname = var.mdw_uat_bastion_host_name
  location    = var.MDWHsResourceLocation
  rgname      = var.mdw_uat_bastion_rg_name
  ipname      = var.mdw_bastion_host_ipname
  subnetid    = data.azurerm_subnet.MDWHsUatBastionSubnet.id
  pipid       = module.create-uat-bastion_pip.ipId
  depends_on  = [module.create-uat-bastion_pip]

  diag_settings_name         = var.mdw_uat_bastion_diag_name
  log_analytics_workspace_id = data.azurerm_key_vault_secret.laworkspaceId02.value
  target_resource_id         = module.create-uat-bastion-host.bastionid

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
