############ AVM Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.avmsaRgName
  resourceLocation  = var.lawsaResourceLocation
  additionalTags    = module.avmsaresourceGroupTags.tagsResult
}

module "avmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName           = var.avmsaRgName
  resourceLocation            = var.lawsaResourceLocation
  storageAccountName          = var.avmsa
  account_tier                = var.avmsa_accounttier
  storagetype                 = var.avmsa_storagetype
  account_replication_type    = var.avmsa_accountreptype
  minTlsVersion               = var.avmsa_tlsversion
  access_tier                 = var.avmsa_accesstier
  enable_https_traffic        = var.avmsa_httpstraffic
  blob_public_access          = var.avmsa_publicaccess
  hns_enabled                 = var.avmsa_hnsenable
  nfsv3_enabled               = var.avmsa_nfsv3
  large_file_share            = var.avmsa_largefileshare
  network_acl_action          = var.avmsa_acl
  microsoft_trusted_services  = var.avmsa_bypass
  routing_preference          = var.avmsa_routing
  publish_internet_endpoints  = var.avmsa_publishinternet
  publish_microsoft_endpoints = var.avmsa_publishmicrosoft
  additionalTags              = module.avmsaTags.tagsResult
  depends_on                  = [module.createTargetRgForavmsa]
}
############ lawsa Storage Account #######################

module "createTargetRgForlawsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lawsaRgName
  resourceLocation  = var.lawsaResourceLocation
  additionalTags    = module.lawsaresourceGroupTags.tagsResult
}

module "lawsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.lawsaRgName
  resourceLocation                       = var.lawsaResourceLocation
  storageAccountName                     = var.lawsa
  account_tier                           = var.lawsa_accounttier
  storagetype                            = var.lawsa_storagetype
  account_replication_type               = var.lawsa_accountreptype
  minTlsVersion                          = var.lawsa_tlsversion
  access_tier                            = var.lawsa_accesstier
  enable_https_traffic                   = var.lawsa_httpstraffic
  blob_public_access                     = var.lawsa_publicaccess
  hns_enabled                            = var.lawsa_hnsenable
  nfsv3_enabled                          = var.lawsa_nfsv3
  large_file_share                       = var.lawsa_largefileshare
  blob_soft_delete_retention_days        = var.lawsa_blobsoftdelete
  container_delete_retention_policy_days = var.lawsa_containersoftdelete
  share_soft_delete_retention_days       = var.lawsa_sharesoftdelete
  network_acl_action                     = var.lawsa_acl
  microsoft_trusted_services             = var.lawsa_bypass
  routing_preference                     = var.lawsa_routing
  publish_internet_endpoints             = var.lawsa_publishinternet
  publish_microsoft_endpoints            = var.lawsa_publishmicrosoft
  additionalTags                         = module.lawsaTags.tagsResult
  depends_on                             = [module.createTargetRgForlawsa]
}
########### EamCi HS avmsa private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-Eamavmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.lawsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}

########### EamCi HS lawsa private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-Eamlawsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.lawsaRgName
  endpoint_name                  = var.lawsa_endpoint_name
  resource_Location              = var.lawsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.lawsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.lawsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
################# diagnostic log configuration #######################################
module "sadiagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.sa_diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.avmsa-StorageAccount, module.lawsa-StorageAccount]
}
