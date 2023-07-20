
################ Creating RG for MDWHS TEST keyvault #############

module "create-Target-Rg-MDWHs-Tst-kv" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.MDWHsTstkvRgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Tst-KVTags.tagsResult
}


module "create-keyvault-MDWHs-Tst" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.1.19"
  keyvault_name                   = var.MDWHsTstkvName
  resource_Location               = var.MDWHsResourceLocation
  resource_group_name             = var.MDWHsTstkvRgName
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  sku_name                        = var.sku_name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  # diagnosticsetting_name          = var.KV_diagnosticsetting_name
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action  = var.default_action
  bypass          = var.bypass
  additionalTags  = module.MDWHs-Tst-KVTags.tagsResult
  access_policies = local.access_policies
  depends_on      = [module.create-Target-Rg-MDWHs-Tst-kv]
}

################ Creating RG for MDWHS Private DNS Zone #############

module "create-Target-Rg-MDWHs-Private-DNSZone" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.MDWHsPrivateDNSRgName
  resourceLocation  = var.MDWHsResourceLocation
  additionalTags    = module.MDWHs-Tst-KVTags.tagsResult
}

############# creating private DNS zone ##############

module "azure-private-dns-zone-MDWHs" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone?ref=v1.1.19"
  private_dns_zone_name = var.private_dns_zone_name
  resource_group_name   = var.MDWHsPrivateDNSRgName
  additionalTags        = module.MDWHs-Tst-DNSTags.tagsResult
  depends_on            = [module.create-Target-Rg-MDWHs-Private-DNSZone, ]
}

############# private DNS zone linking with ADO Vnet ##############
## A virtual network cannot be linked to multiple zones with overlapping namespaces. You tried to link virtual network with 'privatelink.vaultcore.azure.net' and 'privatelink.vaultcore.azure.net' zones."

module "azure-private-dns-zone-ADO-vnet-link" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link?ref=v1.1.19"
  vnet_dns_link_name    = var.vnet_dns_link_name
  resource_group_name   = var.MDWHsPrivateDNSRgName
  private_dns_zone_name = var.private_dns_zone_name
  virtual_network_id    = data.azurerm_virtual_network.MDWHsTstVnet.id
  depends_on            = [module.azure-private-dns-zone-MDWHs]
}


########### KV private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-MDWHsTst" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.MDWHsTstkvRgName
  endpoint_name                  = var.MDWHs_Tst_endpoint_name
  resource_Location              = var.MDWHsResourceLocation
  subnet_id                      = data.azurerm_subnet.MDWHsTstsubnet.id //
  endpoint_SC                    = var.MDWHs_Tst_endpoint_SC
  private_connection_resource_id = data.azurerm_key_vault.MDWHsTstkeyvault.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.MDWHsDnszone.id] //
  additionalTags                 = module.MDWHs-Tst-KVTags.tagsResult
  depends_on                     = [module.azure-private-dns-zone-MDWHs, module.azure-private-dns-zone-ADO-vnet-link, module.create-keyvault-MDWHs-Tst]
}
