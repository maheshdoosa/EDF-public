###############Resource Group - GenCoreHS VM Logging  #############
module "createTargetRggensa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.gennpLogsRgName
  resourceLocation  = var.gennpResourceLocation
  additionalTags    = module.resourceGroupgennplogsTags.tagsResult

}

module "vmDiag-StorageAccount" {
  source                                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"
  resourceGroupName                      = module.createTargetRggensa.rgName
  resourceLocation                       = var.gennpResourceLocation
  storageAccountName                     = var.vmDiagSA
  minTlsVersion                          = var.vmDiagSA_tlsversion
  account_replication_type               = var.vmDiagSA_accountreptype
  account_tier                           = var.vmDiagSA_accounttier
  storagetype                            = var.vmDiagSA_storagetype
  enable_https_traffic                   = var.vmDiagSA_httpstraffic
  blob_public_access                     = var.vmDiagSA_publicaccess
  hns_enabled                            = var.vmDiagSA_hnsenable
  nfsv3_enabled                          = var.vmDiagSA_nfsv3
  large_file_share                       = var.vmDiagSA_largefileshare
  blob_soft_delete_retention_days        = var.vmDiagSA_blobsoftdelete
  container_delete_retention_policy_days = var.vmDiagSA_containersoftdelete
  share_soft_delete_retention_days       = var.vmDiagSA_sharesoftdelete
  routing_preference                     = var.vmDiagSA_routing
  publish_internet_endpoints             = var.vmDiagSA_publishinternet
  publish_microsoft_endpoints            = var.vmDiagSA_publishmicrosoft
  network_acl_action                     = var.vmDiagSA_acl
  microsoft_trusted_services             = var.vmDiagSA_bypass

  additionalTags = module.vmDiagSATags.tagsResult
  containers     = {}

}

module "createTargetRgscriptsgensa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.gennpscriptsRgName
  resourceLocation  = var.gennpResourceLocation

  additionalTags = module.resourceGroupgennplogsTags.tagsResult
}

module "prepvmscripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.1.19"

  resourceGroupName                      = module.createTargetRgscriptsgensa.rgName
  resourceLocation                       = var.gennpResourceLocation
  storageAccountName                     = var.vmprepscriptsSA
  minTlsVersion                          = var.scriptsSA_tlsversion
  account_replication_type               = var.scriptsSA_accountreptype
  account_tier                           = var.scriptsSA_accounttier
  storagetype                            = var.scriptsSA_storagetype
  enable_https_traffic                   = var.scriptsSA_httpstraffic
  blob_public_access                     = var.scriptsSA_publicaccess
  hns_enabled                            = var.scriptsSA_hnsenable
  nfsv3_enabled                          = var.scriptsSA_nfsv3
  large_file_share                       = var.scriptsSA_largefileshare
  blob_soft_delete_retention_days        = var.scriptsSA_blobsoftdelete
  container_delete_retention_policy_days = var.scriptsSA_containersoftdelete
  share_soft_delete_retention_days       = var.scriptsSA_sharesoftdelete
  routing_preference                     = var.scriptsSA_routing
  publish_internet_endpoints             = var.scriptsSA_publishinternet
  publish_microsoft_endpoints            = var.scriptsSA_publishmicrosoft
  network_acl_action                     = var.scriptsSA_acl
  microsoft_trusted_services             = var.scriptsSA_bypass

  containers = {
    container1 = var.container
  }
  additionalTags = module.scriptSATags.tagsResult
  depends_on     = [module.createTargetRgscriptsgensa]
}
#### gencoreHS vmDiag SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgovHS-vmDiag" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.gennpLogsRgName
  endpoint_name                  = var.vmDiagsa_endpoint_name
  resource_Location              = var.gennpResourceLocation
  subnet_id                      = data.azurerm_subnet.gencoreHSpesubnet.id //
  endpoint_SC                    = var.vmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.vmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### gencoreHS scripts SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgovHS-scriptsSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.gennpscriptsRgName
  endpoint_name                  = var.scriptsSA_endpoint_name
  resource_Location              = var.gennpResourceLocation
  subnet_id                      = data.azurerm_subnet.gencoreHSpesubnet.id //
  endpoint_SC                    = var.scriptsSA_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.scriptsSA.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.scriptSATags.tagsResult
}
################ Storage Account diagnostic log configuration #######################################
module "sadiagsettings" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-diagnostic-settings?ref=v1.1.19"
  for_each                   = local.sa_diag_settings
  diag_settings_name         = each.key
  resource_id                = each.value.resource_ids
  log_analytics_workspace_id = each.value.law_workspace_id
  diagnostic_logs            = each.value.diagnostic_log
  diagnostic_metrics         = each.value.diagnostic_metrics
  depends_on                 = [module.prepvmscripts-StorageAccount, module.vmDiag-StorageAccount]
}

module "avmscripts-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName        = var.avmsargname
  resourceLocation         = var.gennpResourceLocation
  storageAccountName       = var.avmsaname
  minTlsVersion            = var.avmsa_tlsversion
  account_replication_type = var.avmsa_accountreptype
  account_tier             = var.avmsa_accounttier
  storagetype              = var.avmsa_storagetype
  enable_https_traffic     = var.avmsa_httpstraffic
  blob_public_access       = var.avmsa_publicaccess
  hns_enabled              = var.avmsa_hnsenable
  nfsv3_enabled            = var.avmsa_nfsv3
  large_file_share         = var.avmsa_largefileshare
  # blob_soft_delete_retention_days        = var.avmsa_blobsoftdelete
  # container_delete_retention_policy_days = var.avmsa_containersoftdelete
  # share_soft_delete_retention_days       = var.avmsa_sharesoftdelete
  routing_preference          = var.avmsa_routing
  publish_internet_endpoints  = var.avmsa_publishinternet
  publish_microsoft_endpoints = var.avmsa_publishmicrosoft
  network_acl_action          = var.avmsa_acl
  microsoft_trusted_services  = var.avmsa_bypass
  access_tier                 = var.avmsa_accesstier

  # containers = {
  #   container1 = var.container
  # }
  additionalTags = module.scriptSATags.tagsResult
  depends_on     = [module.createTargetRgscriptsgensa]
}


module "azure-private-endpoint-dns-Integrate-gendianmdsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.avmsargname
  endpoint_name                  = var.gencoresa_endpoint_name
  resource_Location              = var.gennpResourceLocation
  subnet_id                      = data.azurerm_subnet.gencoreHSpesubnet.id //
  endpoint_SC                    = var.scriptsSA_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}
