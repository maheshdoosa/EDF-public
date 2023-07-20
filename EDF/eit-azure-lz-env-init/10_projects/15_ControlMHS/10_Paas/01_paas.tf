################# Resource Group - controlmHS VM Logging  #############
module "createTargetRgForcontrolmHSVmLogging" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.controlmHSVmLogsRgName
  resourceLocation  = var.controlmHSResourceLocation
  additionalTags    = module.resourceGroupTags.tagsResult
}

################# Storage Account ######################
module "vmDiag-StorageAccount" {
  source                                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"
  resourceGroupName                      = module.createTargetRgForcontrolmHSVmLogging.rgName
  resourceLocation                       = var.controlmHSResourceLocation
  storageAccountName                     = var.vmDiagSA
  minTlsVersion                          = var.vmDiagSA_tlsversion #should be static throughout
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
  containers                             = {} #no containers
  additionalTags                         = module.vmDiagSATags.tagsResult
  # depends_on = [module.createTargetRgForcontrolmHSVmLogging,  ]
}

############ Storage account for Control-M aux ################
module "createTargetRgForcntrlmHSsa" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.cntrlmHSsaRgName
  resourceLocation  = var.cntrlmHSsaResourceLocation
  additionalTags    = module.cntrlmHSRGTags.tagsResult
}

module "mgmtaddsStorageAccount" {
  source                                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"
  resourceGroupName                      = var.cntrlmHSsaRgName
  resourceLocation                       = var.cntrlmHSsaResourceLocation
  storageAccountName                     = var.cntrlmHSsa
  account_tier                           = var.cntrlmHSsa_accounttier
  storagetype                            = var.cntrlmHSsa_storagetype
  account_replication_type               = var.cntrlmHSsa_accountreptype
  minTlsVersion                          = var.cntrlmHSsa_tlsversion
  access_tier                            = var.cntrlmHSsa_accesstier
  enable_https_traffic                   = var.cntrlmHSsa_httpstraffic
  blob_public_access                     = var.cntrlmHSsa_publicaccess
  hns_enabled                            = var.cntrlmHSsa_hnsenable
  nfsv3_enabled                          = var.cntrlmHSsa_nfsv3
  large_file_share                       = var.cntrlmHSsa_largefileshare
  blob_soft_delete_retention_days        = var.cntrlmHSsa_blobsoftdelete
  container_delete_retention_policy_days = var.cntrlmHSsa_containersoftdelete
  share_soft_delete_retention_days       = var.cntrlmHSsa_sharesoftdelete
  network_acl_action                     = var.cntrlmHSsa_acl
  microsoft_trusted_services             = var.cntrlmHSsa_bypass
  routing_preference                     = var.cntrlmHSsa_routing
  publish_internet_endpoints             = var.cntrlmHSsa_publishinternet
  publish_microsoft_endpoints            = var.cntrlmHSsa_publishmicrosoft
  additionalTags                         = module.cntrlmHSsaTags.tagsResult
  # depends_on                             = [module.createTargetRgForcntrlmHSsa]
}

########### cntrlmHS AUX SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-cntrlmHS-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.cntrlmHSsaRgName
  endpoint_name                  = var.cntrlmHSauxsa_endpoint_name
  resource_Location              = var.cntrlmHSsaResourceLocation
  subnet_id                      = data.azurerm_subnet.cntrlmHSpesubnet.id //
  endpoint_SC                    = var.cntrlmHSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.cntrlmHSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.cntrlmHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.cntrlmHSsaTags.tagsResult
}

#### cntrlmHS vmDiagSA SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-cntrlmHS-vmDiagSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.controlmHSVmLogsRgName
  endpoint_name                  = var.cntrlmHSvmDiagsa_endpoint_name
  resource_Location              = var.cntrlmHSsaResourceLocation
  subnet_id                      = data.azurerm_subnet.cntrlmHSpesubnet.id //
  endpoint_SC                    = var.cntrlmHSvmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.cntrlmHSvmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.cntrlmHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

module "ctrlmauxsac" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.1.19"

  container_name     = var.ctrlmauxsac
  storageAccountName = var.cntrlmHSsa
  # depends_on         = [module.mgmtaddsStorageAccount]
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
  depends_on                 = [module.vmDiag-StorageAccount, module.mgmtaddsStorageAccount]
}
