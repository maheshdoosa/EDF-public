################ Creating RG for keyvault ####

module "createTargetRgForKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  resourceGroupName = var.kv_resource_group_name
  resourceLocation  = var.resource_Location
  additionalTags    = module.KVTags.tagsResult
}

################# Creating Azure Keyvault#############

module "createkeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault"
  keyvault_name                   = var.keyvault_name
  resource_Location               = var.resource_Location
  resource_group_name             = var.kv_resource_group_name
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
  additionalTags                  = module.KVTags.tagsResult
  depends_on                      = [module.createTargetRgForKV]
  #access_policies                     =   local.access_policies
}

################ Creating RG for keyvault01 ####

module "createTargetRgForKV01" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  resourceGroupName = var.kv_resource_group_name01
  resourceLocation  = var.resource_Location01
  additionalTags    = module.KVTags.tagsResult
}

module "createkeyvault01" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault"
  keyvault_name                   = var.keyvault_name01
  resource_Location               = var.resource_Location01
  resource_group_name             = var.kv_resource_group_name01
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name01
  enabled_for_deployment          = var.enabled_for_deployment01
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption01
  enabled_for_template_deployment = var.enabled_for_template_deployment01
  soft_delete_retention_days      = var.soft_delete_retention_days01
  purge_protection_enabled        = var.purge_protection_enabled01
  diagnosticsetting_name          = var.diagnosticsetting_name01
  log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action                  = var.default_action01
  bypass                          = var.bypass01
  additionalTags                  = module.KVTags.tagsResult
  depends_on                      = [module.createTargetRgForKV01]
  access_policies                 = local.access_policies
}

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
  additionalTags                  = module.AdeKVTags.tagsResult
  depends_on                      = [module.createTargetRgForAdeKV]
  #access_policies                     =   local.access_policies
}


################ Creating RG for AVM keyvault ####

module "createTargetRgForAvmKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  resourceGroupName = var.avm_kv_resource_group_name
  resourceLocation  = var.resource_Location
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Creating Azure Keyvault#############

module "createavmkeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault"
  keyvault_name                   = var.avm_keyvault_name
  resource_Location               = var.resource_Location
  resource_group_name             = var.avm_kv_resource_group_name
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment_avmkv
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
########## PE for ntc KV ##############
module "azure-private-endpoint-dns-Integrate-ntc-kv" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.private_dns_zone_kv_name
  resource_group_name            = var.ntc_kv_resourceGroupName
  endpoint_name                  = var.ntc_Prd_endpoint_name
  resource_Location              = var.resource_Location
  subnet_id                      = data.azurerm_subnet.mgmtsubnet.id //
  endpoint_SC                    = var.ntc_Prd_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.keyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names_kv
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtssDnszone.id] //
  additionalTags                 = module.KVTags.tagsResult
}
#### PE for cred KV #############
module "azure-private-endpoint-dns-Integrate-cred-kv" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.private_dns_zone_kv_name
  resource_group_name            = var.cred_kv_resourceGroupName
  endpoint_name                  = var.cred_Prd_endpoint_name
  resource_Location              = var.resource_Location
  subnet_id                      = data.azurerm_subnet.mgmtsubnet.id //
  endpoint_SC                    = var.cred_Prd_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.credkeyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names_kv
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtssDnszone.id] //
  additionalTags                 = module.KVTags.tagsResult
}

#### PE for ade KV #############
module "azure-private-endpoint-dns-Integrate-ade-kv" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.private_dns_zone_kv_name
  resource_group_name            = var.ade_kv_resourceGroupName
  endpoint_name                  = var.ade_Prd_endpoint_name
  resource_Location              = var.resource_Location
  subnet_id                      = data.azurerm_subnet.mgmtsubnet.id //
  endpoint_SC                    = var.ade_Prd_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.adekeyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names_kv
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtssDnszone.id] //
  additionalTags                 = module.AdeKVTags.tagsResult
}

#### PE for avm KV #############
module "azure-private-endpoint-dns-Integrate-avm-kv" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate"
  private_dns_zone_name          = var.private_dns_zone_kv_name
  resource_group_name            = var.avm_kv_resource_group_name
  endpoint_name                  = var.avm_Prd_endpoint_name
  resource_Location              = var.resource_Location
  subnet_id                      = data.azurerm_subnet.mgmtsubnet.id //
  endpoint_SC                    = var.avm_Prd_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.avmkeyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names_kv
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtssDnszone.id] //
  additionalTags                 = module.AvmKVTags.tagsResult
}
