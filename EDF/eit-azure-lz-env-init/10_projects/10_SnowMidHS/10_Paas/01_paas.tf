# ################ Resource Group - snowmidHS VM Logging  #############
module "createTargetRgForsnowmidHSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.snowmidHSVmLogsRgName
  resourceLocation  = var.snowmidHSResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.7"

  resourceGroupName                      = module.createTargetRgForsnowmidHSVmLogging.rgName
  resourceLocation                       = var.snowmidHSResourceLocation
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

  containers = {} #no containers

  additionalTags = module.vmDiagSATags.tagsResult

  depends_on = [
    module.createTargetRgForsnowmidHSVmLogging,
  ]


}


############ Storage account for secgov aux ################

module "createTargetRgForsecgovHSsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.secgovHSsaRgName
  resourceLocation  = var.secgovHSsaResourceLocation

  additionalTags = module.secgovHSRGTags.tagsResult
}

module "mgmtaddsStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.secgovHSsaRgName
  resourceLocation                       = var.secgovHSsaResourceLocation
  storageAccountName                     = var.secgovHSsa
  account_tier                           = var.secgovHSsa_accounttier
  storagetype                            = var.secgovHSsa_storagetype
  account_replication_type               = var.secgovHSsa_accountreptype
  minTlsVersion                          = var.secgovHSsa_tlsversion
  access_tier                            = var.secgovHSsa_accesstier
  enable_https_traffic                   = var.secgovHSsa_httpstraffic
  blob_public_access                     = var.secgovHSsa_publicaccess
  hns_enabled                            = var.secgovHSsa_hnsenable
  nfsv3_enabled                          = var.secgovHSsa_nfsv3
  large_file_share                       = var.secgovHSsa_largefileshare
  blob_soft_delete_retention_days        = var.secgovHSsa_blobsoftdelete
  container_delete_retention_policy_days = var.secgovHSsa_containersoftdelete
  share_soft_delete_retention_days       = var.secgovHSsa_sharesoftdelete
  network_acl_action                     = var.secgovHSsa_acl
  microsoft_trusted_services             = var.secgovHSsa_bypass
  routing_preference                     = var.secgovHSsa_routing
  publish_internet_endpoints             = var.secgovHSsa_publishinternet
  publish_microsoft_endpoints            = var.secgovHSsa_publishmicrosoft
  additionalTags                         = module.secgovHSsaTags.tagsResult
  depends_on                             = [module.createTargetRgForsecgovHSsa]

}

#### secgovHS AUX SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgovHS-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.secgovHSsaRgName
  endpoint_name                  = var.secgovHSauxsa_endpoint_name
  resource_Location              = var.secgovHSsaResourceLocation
  subnet_id                      = data.azurerm_subnet.secgovHSpesubnet.id //
  endpoint_SC                    = var.secgovHSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.secgovHSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.secgovHSsaTags.tagsResult
}

#### secgovHS vmDiagSA SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgovHS-vmDiagSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.snowmidHSVmLogsRgName
  endpoint_name                  = var.secgovHSvmDiagsa_endpoint_name
  resource_Location              = var.secgovHSsaResourceLocation
  subnet_id                      = data.azurerm_subnet.secgovHSpesubnet.id //
  endpoint_SC                    = var.secgovHSvmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.secgovHSvmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

############ AVM Storage Account #########################

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

#### secgovHS avm SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgovHS-avmSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.secgovHSsaResourceLocation
  subnet_id                      = data.azurerm_subnet.secgovHSpesubnet.id //
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovHSauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.avmsaTags.tagsResult
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
  depends_on                 = [module.mgmtaddsStorageAccount, module.vmDiag-StorageAccount, module.avmsa-StorageAccount]
}
