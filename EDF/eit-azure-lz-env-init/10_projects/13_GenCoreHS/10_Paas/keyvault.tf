
################ Creating RG for keyvault ####
module "createTargetRgForKV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.kv_resource_group_name
  resourceLocation  = var.resource_Location
  additionalTags    = module.KVTags.tagsResult
}

################# Creating Azure Keyvault#############

module "createkeyvault" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.1.19"
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
  # diagnosticsetting_name          = var.diagnosticsetting_name
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action  = var.default_action
  bypass          = var.bypass
  additionalTags  = module.KVTags.tagsResult
  depends_on      = [module.createTargetRgForKV]
  access_policies = local.access_policies
}

############# creating private DNS zone ##############

module "azure-private-dns-zone" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone?ref=v1.1.19"
  private_dns_zone_name = var.private_dns_zone_name
  resource_group_name   = var.kv_resource_group_name
  additionalTags        = module.KVTags.tagsResult
  depends_on            = [module.createkeyvault]
}

# ############# private DNS zone linking with Vnet ##############
# module "azure-private-dns-zone-vnet-link" {
#   source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link"
#   vnet_dns_link_name    = var.vnet_dns_link_name
#   resource_group_name   = var.kv_resource_group_name
#   private_dns_zone_name = var.private_dns_zone_name
#   virtual_network_id    = data.azurerm_virtual_network.vnet.id
#   depends_on            = [module.azure-private-dns-zone]
# }

########### private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.kv_resource_group_name
  endpoint_name                  = var.endpoint_name
  resource_Location              = var.resource_Location
  subnet_id                      = data.azurerm_subnet.subnet.id
  endpoint_SC                    = var.endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.keyvault.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [local.dnszoneid]
  # private_dns_zone_ids           = [data.azurerm_private_dns_zone.dnszone.id]
  additionalTags = module.KVTags.tagsResult
  depends_on     = [module.createkeyvault]
  # depends_on                     = [module.azure-private-dns-zone-vnet-link]
}
