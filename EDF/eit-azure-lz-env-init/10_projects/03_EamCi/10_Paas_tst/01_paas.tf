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
############ law Storage Account #######################

module "createTargetRgForlawsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.lawsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.lawsaresourceGroupTags.tagsResult
}

module "lawsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.lawsaRgName
  resourceLocation                       = var.avmsaResourceLocation
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
############ Jbox Storage Account #######################

module "createTargetRgForjboxsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.jboxsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.jboxsaresourceGroupTags.tagsResult
}

module "jboxsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.jboxsaRgName
  resourceLocation                       = var.avmsaResourceLocation
  storageAccountName                     = var.jboxsa
  account_tier                           = var.jboxsa_accounttier
  storagetype                            = var.jboxsa_storagetype
  account_replication_type               = var.jboxsa_accountreptype
  minTlsVersion                          = var.jboxsa_tlsversion
  access_tier                            = var.jboxsa_accesstier
  enable_https_traffic                   = var.jboxsa_httpstraffic
  blob_public_access                     = var.jboxsa_publicaccess
  hns_enabled                            = var.jboxsa_hnsenable
  nfsv3_enabled                          = var.jboxsa_nfsv3
  large_file_share                       = var.jboxsa_largefileshare
  blob_soft_delete_retention_days        = var.jboxsa_blobsoftdelete
  container_delete_retention_policy_days = var.jboxsa_containersoftdelete
  share_soft_delete_retention_days       = var.jboxsa_sharesoftdelete
  network_acl_action                     = var.jboxsa_acl
  microsoft_trusted_services             = var.jboxsa_bypass
  routing_preference                     = var.jboxsa_routing
  publish_internet_endpoints             = var.jboxsa_publishinternet
  publish_microsoft_endpoints            = var.jboxsa_publishmicrosoft
  additionalTags                         = module.jboxsaTags.tagsResult
  depends_on                             = [module.createTargetRgForjboxsa]
}
############ devwssa Storage Account #######################

module "createTargetRgFordevwssa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.devwssaRgName
  resourceLocation  = var.devwssaResourceLocation
  additionalTags    = module.devwssaresourceGroupTags.tagsResult
}

module "devws-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.devwssaRgName
  resourceLocation                       = var.avmsaResourceLocation
  storageAccountName                     = var.devwssa
  account_tier                           = var.devwssa_accounttier
  storagetype                            = var.devwssa_storagetype
  account_replication_type               = var.devwssa_accountreptype
  minTlsVersion                          = var.devwssa_tlsversion
  access_tier                            = var.devwssa_accesstier
  enable_https_traffic                   = var.devwssa_httpstraffic
  blob_public_access                     = var.devwssa_publicaccess
  hns_enabled                            = var.devwssa_hnsenable
  nfsv3_enabled                          = var.devwssa_nfsv3
  large_file_share                       = var.devwssa_largefileshare
  blob_soft_delete_retention_days        = var.devwssa_blobsoftdelete
  container_delete_retention_policy_days = var.devwssa_containersoftdelete
  share_soft_delete_retention_days       = var.devwssa_sharesoftdelete
  network_acl_action                     = var.devwssa_acl
  microsoft_trusted_services             = var.devwssa_bypass
  routing_preference                     = var.devwssa_routing
  publish_internet_endpoints             = var.devwssa_publishinternet
  publish_microsoft_endpoints            = var.devwssa_publishmicrosoft
  additionalTags                         = module.devwssaTags.tagsResult
  depends_on                             = [module.createTargetRgFordevwssa]
}
########### EamtstCi HS avmsa private End Point integration with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-Eamavmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.avmsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}

########### EamtstCi HS lawsa private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-Eamlawsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.lawsaRgName
  endpoint_name                  = var.lawsa_endpoint_name
  resource_Location              = var.avmsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.lawsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.lawsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
########### EamtstCi HS jboxsa private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-jboxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.jboxsaRgName
  endpoint_name                  = var.jboxsa_endpoint_name
  resource_Location              = var.avmsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.jboxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.jboxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
########### EamtstCi HS devwssa private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-devwssa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.devwssaRgName
  endpoint_name                  = var.devwssa_endpoint_name
  resource_Location              = var.avmsaResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.devwssa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.devwssa.id //
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
  depends_on                 = [module.avmsa-StorageAccount, module.lawsa-StorageAccount, module.jboxsa-StorageAccount]
}
