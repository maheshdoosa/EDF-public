###############Resource Group - GenCoreHS VM Logging  #############
module "createTargetRggensa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.genprdvmLogsRgName
  resourceLocation  = var.genprdResourceLocation
  additionalTags    = module.resourceGroupgenprdlogsTags.tagsResult

}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.createTargetRggensa.rgName
  resourceLocation                       = var.genprdResourceLocation
  storageAccountName                     = var.vmDiagSA
  minTlsVersion                          = "TLS1_2" #should be static throughout
  account_tier                           = var.vmDiagSA_accounttier
  storagetype                            = var.vmDiagSA_storagetype
  account_replication_type               = var.vmDiagSA_accountreptype
  access_tier                            = var.vmDiagSA_accesstier
  enable_https_traffic                   = var.vmDiagSA_httpstraffic
  blob_public_access                     = var.vmDiagSA_publicaccess
  hns_enabled                            = var.vmDiagSA_hnsenable
  nfsv3_enabled                          = var.vmDiagSA_nfsv3
  large_file_share                       = var.vmDiagSA_largefileshare
  blob_soft_delete_retention_days        = var.vmDiagSA_blobsoftdelete
  container_delete_retention_policy_days = var.vmDiagSA_containersoftdelete
  share_soft_delete_retention_days       = var.vmDiagSA_sharesoftdelete
  network_acl_action                     = var.vmDiagSA_acl
  microsoft_trusted_services             = var.vmDiagSA_bypass
  routing_preference                     = var.vmDiagSA_routing
  publish_internet_endpoints             = var.vmDiagSA_publishinternet
  publish_microsoft_endpoints            = var.vmDiagSA_publishmicrosoft
  additionalTags                         = module.vmDiagSATags.tagsResult

}

module "createTargetRgscriptsgensa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.genprdscriptsRgName
  resourceLocation  = var.genprdResourceLocation

  additionalTags = module.resourceGroupgenprdlogsTags.tagsResult
}

module "prepvmscripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"

  resourceGroupName                      = module.createTargetRgscriptsgensa.rgName
  resourceLocation                       = var.genprdResourceLocation
  storageAccountName                     = var.vmprepscriptsSA
  account_replication_type               = var.auxscripts_account_replication_type
  account_tier                           = var.auxscripts_account_tier
  minTlsVersion                          = var.auxscripts_minTlsVersion
  storagetype                            = var.auxscripts_storagetype
  enable_https_traffic                   = var.auxscripts_enable_https_traffic
  blob_public_access                     = var.auxscripts_blob_public_access
  hns_enabled                            = var.auxscripts_hns_enabled
  nfsv3_enabled                          = var.auxscripts_nfsv3_enabled
  large_file_share                       = var.auxscripts_large_file_share
  blob_soft_delete_retention_days        = var.auxscripts_blob_soft_delete_retention_days
  container_delete_retention_policy_days = var.auxscripts_container_delete_retention_policy_days
  share_soft_delete_retention_days       = var.auxscripts_share_soft_delete_retention_days
  routing_preference                     = var.auxscripts_routing_preference
  publish_internet_endpoints             = var.auxscripts_publish_internet_endpoints
  publish_microsoft_endpoints            = var.auxscripts_publish_microsoft_endpoints
  network_acl_action                     = var.auxscripts_network_acl_action
  microsoft_trusted_services             = var.auxscripts_microsoft_trusted_services
  containers = {
    container1 = var.container
  }
  additionalTags = module.scriptSATags.tagsResult
  depends_on     = [module.createTargetRgscriptsgensa]
}

########## vmDiagSA SA PE ################
module "azure-private-endpoint-dns-Integrate-genProdHS-vmDiagSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.genprdvmLogsRgName
  endpoint_name                  = var.genProdHSvmDiagsa_endpoint_name
  resource_Location              = var.genprdResourceLocation
  subnet_id                      = data.azurerm_subnet.subnet.id
  endpoint_SC                    = var.genprodHSvmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.genprodHSvmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_name
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.sadnszone.id] //
  additionalTags                 = module.scriptSATags.tagsResult
}

########## AUX SA PE ################
module "azure-private-endpoint-dns-Integrate-genProdHS-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.genprdscriptsRgName
  endpoint_name                  = var.genProdHSauxsa_endpoint_name
  resource_Location              = var.genprdResourceLocation
  subnet_id                      = data.azurerm_subnet.subnet.id
  endpoint_SC                    = var.genprodHSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.genprodHSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.genprodHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.sadnszone.id]
  additionalTags                 = module.scriptSATags.tagsResult
}
############ avmsa Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.avmsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.resourceGroupgenprdlogsTags.tagsResult
}

module "avmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName        = var.avmsaRgName
  resourceLocation         = var.avmsaResourceLocation
  storageAccountName       = var.avmsa
  account_tier             = var.avmsa_accounttier
  storagetype              = var.avmsa_storagetype
  account_replication_type = var.avmsa_accountreptype
  minTlsVersion            = var.avmsa_tlsversion
  access_tier              = var.avmsa_accesstier
  enable_https_traffic     = var.avmsa_httpstraffic
  blob_public_access       = var.avmsa_publicaccess
  hns_enabled              = var.avmsa_hnsenable
  nfsv3_enabled            = var.avmsa_nfsv3
  large_file_share         = var.avmsa_largefileshare
  # blob_soft_delete_retention_days        = var.avmsa_blobsoftdelete
  # container_delete_retention_policy_days = var.avmsa_containersoftdelete
  # share_soft_delete_retention_days       = var.avmsa_sharesoftdelete
  network_acl_action          = var.avmsa_acl
  microsoft_trusted_services  = var.avmsa_bypass
  routing_preference          = var.avmsa_routing
  publish_internet_endpoints  = var.avmsa_publishinternet
  publish_microsoft_endpoints = var.avmsa_publishmicrosoft
  additionalTags              = module.vmDiagSATags.tagsResult
  depends_on                  = [module.createTargetRgForavmsa]
}
########## AVM SA PE ################
module "azure-private-endpoint-dns-Integrate-genProdHS-avmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.genprdResourceLocation
  subnet_id                      = data.azurerm_subnet.subnet.id
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.genprodHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.sadnszone.id]
  additionalTags                 = module.scriptSATags.tagsResult
}
################# Storage Account diagnostic log configuration #######################################
module "sadiagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.sa_diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.prepvmscripts-StorageAccount, module.vmDiag-StorageAccount, module.avmsa-StorageAccount]
}
