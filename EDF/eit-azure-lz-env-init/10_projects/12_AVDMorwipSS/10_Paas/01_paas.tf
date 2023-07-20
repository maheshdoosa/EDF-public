################ Resource Group - VM Logging  #############
module "createTargetRgForAVDVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.AVDVmLogsRgName
  resourceLocation  = var.AVDResourceLocation

}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.createTargetRgForAVDVmLogging.rgName
  resourceLocation                       = var.AVDResourceLocation
  storageAccountName                     = var.vmDiagSA
  account_tier                           = var.vmDiagSA_accounttier
  storagetype                            = var.vmDiagSA_storagetype
  account_replication_type               = var.vmDiagSA_accountreptype
  minTlsVersion                          = var.vmDiagSA_tlsversion
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
  depends_on                             = [module.createTargetRgForAVDVmLogging]


}


############ Storage account for aux ################

module "createTargetRgForcusauxsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.cusauxsaRgName
  resourceLocation  = var.cusauxsaResourceLocation

  additionalTags = module.cusauxRGTags.tagsResult
}

module "cusauxStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.cusauxsaRgName
  resourceLocation                       = var.cusauxsaResourceLocation
  storageAccountName                     = var.cusauxsa
  account_tier                           = var.cusauxsa_accounttier
  storagetype                            = var.cusauxsa_storagetype
  account_replication_type               = var.cusauxsa_accountreptype
  minTlsVersion                          = var.cusauxsa_tlsversion
  access_tier                            = var.cusauxsa_accesstier
  enable_https_traffic                   = var.cusauxsa_httpstraffic
  blob_public_access                     = var.cusauxsa_publicaccess
  hns_enabled                            = var.cusauxsa_hnsenable
  nfsv3_enabled                          = var.cusauxsa_nfsv3
  large_file_share                       = var.cusauxsa_largefileshare
  blob_soft_delete_retention_days        = var.cusauxsa_blobsoftdelete
  container_delete_retention_policy_days = var.cusauxsa_containersoftdelete
  share_soft_delete_retention_days       = var.cusauxsa_sharesoftdelete
  network_acl_action                     = var.cusauxsa_acl
  microsoft_trusted_services             = var.cusauxsa_bypass
  routing_preference                     = var.cusauxsa_routing
  publish_internet_endpoints             = var.cusauxsa_publishinternet
  publish_microsoft_endpoints            = var.cusauxsa_publishmicrosoft
  additionalTags                         = module.cusauxsaTags.tagsResult
  depends_on                             = [module.createTargetRgForcusauxsa]

}

#### AUX SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-cus-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.cusauxsa_resourceGroupName
  endpoint_name                  = var.cusauxsa_endpoint_name
  resource_Location              = var.cusauxsaResourceLocation
  subnet_id                      = data.azurerm_subnet.cuspesubnet.id //
  endpoint_SC                    = var.cusauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.cusauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.cusauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.blobdnszoneid.value] //
  additionalTags                 = module.cusauxsaTags.tagsResult
}

#### vmDiag SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-cus-vmDiag" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.cusvmDiagsa_resourceGroupName
  endpoint_name                  = var.cusvmDiagsa_endpoint_name
  resource_Location              = var.cusvmDiagsaResourceLocation
  subnet_id                      = data.azurerm_subnet.cuspesubnet.id //
  endpoint_SC                    = var.cusvmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.cusvmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.cusvmDiagsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.blobdnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
