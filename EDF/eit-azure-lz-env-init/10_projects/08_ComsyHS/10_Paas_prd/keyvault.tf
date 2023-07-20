################ Creating RG for Comsy Hs Prod keyvault ####
module "create-Target-Rg-For-ComsyHs-KV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.ComsyHS_kv_resourceGroupName
  resourceLocation  = var.ComsyHSResourceLocation
  additionalTags    = module.ComsyHs-Prd-kv-resourceGroupTags.tagsResult
}

################# Creating Azure Keyvault#############
module "create-keyvault-for-ComsyHs" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.1.19"
  keyvault_name                   = var.ComsyHS_keyvault_name
  resource_Location               = var.ComsyHSResourceLocation
  resource_group_name             = var.ComsyHS_kv_resourceGroupName
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  # diagnosticsetting_name          = var.diagnosticsetting_name
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceResourceId.value
  default_action  = var.default_action
  bypass          = var.bypass
  additionalTags  = module.KVTags.tagsResult
  depends_on      = [module.create-Target-Rg-For-ComsyHs-KV]
  access_policies = local.access_policies
}




########### Comsy Prod KV private End Point integrating with Apex DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-ComsyHsPrd" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.ComsyHS_kv_resourceGroupName
  endpoint_name                  = var.ComsyHs_Prd_endpoint_name
  resource_Location              = var.ComsyHSResourceLocation
  subnet_id                      = data.azurerm_subnet.ComsyHsPrdsubnet.id //
  endpoint_SC                    = var.ComsyHs_Prd_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.ComsyHsPrdkeyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  #  private_dns_zone_ids           = [data.azurerm_private_dns_zone.ComsyHsDnszone.id] //
  private_dns_zone_ids = [data.azurerm_key_vault_secret.dnszone.value]
  additionalTags       = module.KVTags.tagsResult
  depends_on           = [module.create-keyvault-for-ComsyHs]
}
