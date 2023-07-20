# ################ Resource Group - snowmidSS VM Logging  #############
module "createTargetRgForSnowmidSSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.snowmidSSVmLogsRgName
  resourceLocation  = var.snowmidSSResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.0"

  resourceGroupName  = module.createTargetRgForSnowmidSSVmLogging.rgName
  resourceLocation   = var.snowmidSSResourceLocation
  storageAccountName = var.vmDiagSA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = {} #no containers

  additionalTags = module.vmDiagSATags.tagsResult

  depends_on = [
    module.createTargetRgForSnowmidSSVmLogging,
  ]
}


############ Storage account for aux ################

module "createTargetRgForsecgovauxsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.secgovauxsaRgName
  resourceLocation  = var.secgovauxsaResourceLocation

  additionalTags = module.secgovauxRGTags.tagsResult
}

module "secgovauxStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.secgovauxsaRgName
  resourceLocation                       = var.secgovauxsaResourceLocation
  storageAccountName                     = var.secgovauxsa
  account_tier                           = var.secgovauxsa_accounttier
  storagetype                            = var.secgovauxsa_storagetype
  account_replication_type               = var.secgovauxsa_accountreptype
  minTlsVersion                          = var.secgovauxsa_tlsversion
  access_tier                            = var.secgovauxsa_accesstier
  enable_https_traffic                   = var.secgovauxsa_httpstraffic
  blob_public_access                     = var.secgovauxsa_publicaccess
  hns_enabled                            = var.secgovauxsa_hnsenable
  nfsv3_enabled                          = var.secgovauxsa_nfsv3
  large_file_share                       = var.secgovauxsa_largefileshare
  blob_soft_delete_retention_days        = var.secgovauxsa_blobsoftdelete
  container_delete_retention_policy_days = var.secgovauxsa_containersoftdelete
  share_soft_delete_retention_days       = var.secgovauxsa_sharesoftdelete
  network_acl_action                     = var.secgovauxsa_acl
  microsoft_trusted_services             = var.secgovauxsa_bypass
  routing_preference                     = var.secgovauxsa_routing
  publish_internet_endpoints             = var.secgovauxsa_publishinternet
  publish_microsoft_endpoints            = var.secgovauxsa_publishmicrosoft
  additionalTags                         = module.secgovauxsaTags.tagsResult
  depends_on                             = [module.createTargetRgForsecgovauxsa]

}

#### AUX SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgov-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.secgovauxsa_resourceGroupName
  endpoint_name                  = var.secgovauxsa_endpoint_name
  resource_Location              = var.secgovauxsaResourceLocation
  subnet_id                      = data.azurerm_subnet.secgovpesubnet.id //
  endpoint_SC                    = var.secgovauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.secgovauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.blobdnszoneid.value] //
  additionalTags                 = module.secgovauxsaTags.tagsResult
}

#### vmDiag SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-secgov-vmDiagsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.snowmidSSVmLogsRgName
  endpoint_name                  = var.secgovvmDiagsa_endpoint_name
  resource_Location              = var.secgovauxsaResourceLocation
  subnet_id                      = data.azurerm_subnet.secgovpesubnet.id //
  endpoint_SC                    = var.secgovvmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.secgovvmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.secgovauxsa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.blobdnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
