################ Creating RG for ADE keyvault ####

module "createTargetRgForAdeKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  resourceGroupName = var.ade_kv_resource_group_name
  resourceLocation  = var.resourceLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Creating Azure Keyvault#############

module "createadekeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault"
  keyvault_name                   = var.ade_keyvault_name
  resource_Location               = var.resourceLocation
  resource_group_name             = var.ade_kv_resource_group_name
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption_adekv
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  diagnosticsetting_name          = var.diagnosticsetting_name
  log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action                  = var.default_action
  bypass                          = var.bypass
  additionalTags                  = module.AdeKVTags.tagsResult
  depends_on                      = [module.createTargetRgForAdeKV]
  #access_policies                     =   local.access_policies
}


################ Creating RG for AVM keyvault ####

module "createTargetRgForAvmKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  resourceGroupName = var.avm_kv_resource_group_name
  resourceLocation  = var.resourceLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Creating Azure Keyvault#############

module "createavmkeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault"
  keyvault_name                   = var.avm_keyvault_name
  resource_Location               = var.resourceLocation
  resource_group_name             = var.avm_kv_resource_group_name
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  diagnosticsetting_name          = var.diagnosticsetting_name
  log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action                  = var.default_action
  bypass                          = var.bypass
  additionalTags                  = module.AvmKVTags.tagsResult
  depends_on                      = [module.createTargetRgForAvmKV]
  #access_policies                     =   local.access_policies
}
