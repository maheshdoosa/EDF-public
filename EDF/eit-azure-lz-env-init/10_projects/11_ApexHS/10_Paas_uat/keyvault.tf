################ Creating RG for Apex Hs Prod keyvault ####
module "create-Target-Rg-For-ApexHs-KV" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.ApexHS_kv_resourceGroupName
  resourceLocation  = var.ApexHSResourceLocation
  additionalTags    = module.ApexHsuatresourceGroupTags.tagsResult
}

################# Creating Azure Keyvault#############
module "create-keyvault-for-ApexHs" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.1.19"
  keyvault_name                   = var.ApexHS_keyvault_name
  resource_Location               = var.ApexHSResourceLocation
  resource_group_name             = var.ApexHS_kv_resourceGroupName
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
  depends_on      = [module.create-Target-Rg-For-ApexHs-KV]
  access_policies = local.access_policies
}

################ Creating RG for Apex prd Private DNS Zone #############

module "create-Target-Rg-for-apex-Private-DNSZone" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.ApexHSPrivateDNSRgName
  resourceLocation  = var.ApexHSResourceLocation
  additionalTags    = module.ApexHsuatresourceGroupTags.tagsResult
}

############# creating private DNS zone for Apex Hs  ##############

module "azure-private-dns-zone-ApexHs" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone?ref=v1.1.19"
  private_dns_zone_name = var.private_dns_zone_name
  resource_group_name   = var.ApexHSPrivateDNSRgName
  additionalTags        = module.KVTags.tagsResult
  depends_on            = [module.create-Target-Rg-for-apex-Private-DNSZone, ]
}

############# private DNS zone linking with Vnet ##############
module "azure-private-dns-zone-vnet-link" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link?ref=v1.1.19"
  vnet_dns_link_name    = var.vnet_dns_link_name
  resource_group_name   = var.ApexHSPrivateDNSRgName
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = data.azurerm_virtual_network.ApexHsPrdVnet.id
  depends_on            = [module.azure-private-dns-zone-ApexHs]
}


########### Apex Prod KV private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-ApexHsPrd" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.ApexHS_kv_resourceGroupName
  endpoint_name                  = var.ApexHs_Prd_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.ApexHsPrdsubnet.id //
  endpoint_SC                    = var.ApexHs_Prd_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.ApexHsPrdkeyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  #  private_dns_zone_ids           = [data.azurerm_private_dns_zone.ApexHsDnszone.id] //
  private_dns_zone_ids = [data.azurerm_key_vault_secret.dnszone.value]
  additionalTags       = module.KVTags.tagsResult
  depends_on           = [module.azure-private-dns-zone-ApexHs, module.azure-private-dns-zone-vnet-link, module.create-keyvault-for-ApexHs]
}
