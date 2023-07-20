################ Creating RG for ADE keyvault ####

module "createTargetRgForAdeKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  resourceGroupName = var.ade_kv_resource_group_name
  resourceLocation  = var.resource_Location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Creating Azure Keyvault#############

module "createadekeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault"
  keyvault_name                   = var.ade_keyvault_name
  resource_Location               = var.resource_Location
  resource_group_name             = var.ade_kv_resource_group_name
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name_adekv
  enabled_for_deployment          = var.enabled_for_deployment_adekv
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption_adekv
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  diagnosticsetting_name          = var.diagnosticsetting_name
  log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action                  = var.default_action
  bypass                          = var.bypass
  additionalTags                  = module.ADEKVTags.tagsResult
  depends_on                      = [module.createTargetRgForAdeKV]
  #access_policies                     =   local.access_policies
}
