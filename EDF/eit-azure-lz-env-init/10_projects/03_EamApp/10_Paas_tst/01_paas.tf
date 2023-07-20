############ AVM Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.avmsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.avmsaresourceGroupTags.tagsResult
}

module "avmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName           = var.avmsaRgName
  resourceLocation            = var.avmsaResourceLocation
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

############ sharedsa Storage Account #######################

module "createTargetRgForsharedsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.sharedsaRgName
  resourceLocation  = var.sharedsaResourceLocation
  additionalTags    = module.sharedsaresourceGroupTags.tagsResult
}

module "sharedsa01-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.sharedsa01RgName
  resourceLocation                       = var.sharedsa01ResourceLocation
  storageAccountName                     = var.sharedsa01
  account_tier                           = var.sharedsa01_accounttier
  storagetype                            = var.sharedsa01_storagetype
  account_replication_type               = var.sharedsa01_accountreptype
  minTlsVersion                          = var.sharedsa01_tlsversion
  access_tier                            = var.sharedsa01_accesstier
  enable_https_traffic                   = var.sharedsa01_httpstraffic
  blob_public_access                     = var.sharedsa01_publicaccess
  hns_enabled                            = var.sharedsa01_hnsenable
  nfsv3_enabled                          = var.sharedsa01_nfsv3
  large_file_share                       = var.sharedsa01_largefileshare
  network_acl_action                     = var.sharedsa01_acl
  microsoft_trusted_services             = var.sharedsa01_bypass
  routing_preference                     = var.sharedsa01_routing
  publish_internet_endpoints             = var.sharedsa01_publishinternet
  publish_microsoft_endpoints            = var.sharedsa01_publishmicrosoft
  additionalTags                         = module.sharedsa01Tags.tagsResult
  blob_soft_delete_retention_days        = var.blobsoftdelete
  container_delete_retention_policy_days = var.containersoftdelete
  share_soft_delete_retention_days       = var.sharesoftdelete
  depends_on                             = [module.createTargetRgForsharedsa]
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
  depends_on                 = [module.avmsa-StorageAccount, module.sharedsa01-StorageAccount]
}

########### AVM SA Private Endpoint ##############
module "azure-private-endpoint-dns-Integrate-avmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.avmsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
