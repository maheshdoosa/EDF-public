# ################ Resource Group - managedSS VM Logging  #############
module "createTargetRgForLzmanagedSSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzmanagedSSVmLogsRgName
  resourceLocation  = var.lzHubManagedResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult

}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.0"

  resourceGroupName  = module.createTargetRgForLzmanagedSSVmLogging.rgName
  resourceLocation   = var.lzHubManagedResourceLocation
  storageAccountName = var.vmDiagSA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = {} #no containers

  additionalTags = module.vmDiagSATags.tagsResult

  depends_on = [
    module.createTargetRgForLzmanagedSSVmLogging,
  ]
}

module "createTargetRgForLzmanagedSSaux" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.managedSSsaRgName
  resourceLocation  = var.managedSSsaRgLocation

  additionalTags = module.resourceGroupTags.tagsResult

}

module "managedauxStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.managedSSsaRgName
  resourceLocation                       = var.managedSSsaRgLocation
  storageAccountName                     = var.managedSSsa
  account_tier                           = var.managedSSsa_accounttier
  storagetype                            = var.managedSSsa_storagetype
  account_replication_type               = var.managedSSsa_accountreptype
  minTlsVersion                          = var.managedSSsa_tlsversion
  access_tier                            = var.managedSSsa_accesstier
  enable_https_traffic                   = var.managedSSsa_httpstraffic
  blob_public_access                     = var.managedSSsa_publicaccess
  hns_enabled                            = var.managedSSsa_hnsenable
  nfsv3_enabled                          = var.managedSSsa_nfsv3
  large_file_share                       = var.managedSSsa_largefileshare
  blob_soft_delete_retention_days        = var.managedSSsa_blobsoftdelete
  container_delete_retention_policy_days = var.managedSSsa_containersoftdelete
  share_soft_delete_retention_days       = var.managedSSsa_sharesoftdelete
  network_acl_action                     = var.managedSSsa_acl
  microsoft_trusted_services             = var.managedSSsa_bypass
  routing_preference                     = var.managedSSsa_routing
  publish_internet_endpoints             = var.managedSSsa_publishinternet
  publish_microsoft_endpoints            = var.managedSSsa_publishmicrosoft
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.createTargetRgForLzmanagedSSaux]

}

####  Managed vmDiagSA SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-managed-vmDiagSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.lzmanagedSSVmLogsRgName
  endpoint_name                  = var.managedSSvmDiagsa_endpoint_name
  resource_Location              = var.lzHubManagedResourceLocation
  subnet_id                      = data.azurerm_subnet.managedSSpesubnet.id //
  endpoint_SC                    = var.managedSSvmDiagsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.managedSSvmDiagsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.SScentralblobdnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

####  Managed aux SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-managed-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.lzmanagedSSVmLogsRgName
  endpoint_name                  = var.managedSSauxsa_endpoint_name
  resource_Location              = var.lzHubManagedResourceLocation
  subnet_id                      = data.azurerm_subnet.managedSSpesubnet.id //
  endpoint_SC                    = var.managedSSauxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.managedSSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.SScentralblobdnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

############ RG for restore SA ##############

module "createTargetRgForLzmanagedSSrestoresa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.managedSSrestoresaRgName
  resourceLocation  = var.managedSSrestoresaRgLocation

  additionalTags = module.resourceGroupTags.tagsResult

}


module "managedSSrestoreStorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.managedSSrestoresaRgName
  resourceLocation                       = var.managedSSrestoresaRgLocation
  storageAccountName                     = var.managedSSrestoresa
  account_tier                           = var.managedSSrestoresa_accounttier
  storagetype                            = var.managedSSrestoresa_storagetype
  account_replication_type               = var.managedSSrestoresa_accountreptype
  minTlsVersion                          = var.managedSSrestoresa_tlsversion
  access_tier                            = var.managedSSrestoresa_accesstier
  enable_https_traffic                   = var.managedSSrestoresa_httpstraffic
  blob_public_access                     = var.managedSSrestoresa_publicaccess
  hns_enabled                            = var.managedSSrestoresa_hnsenable
  nfsv3_enabled                          = var.managedSSrestoresa_nfsv3
  large_file_share                       = var.managedSSrestoresa_largefileshare
  blob_soft_delete_retention_days        = var.managedSSrestoresa_blobsoftdelete
  container_delete_retention_policy_days = var.managedSSrestoresa_containersoftdelete
  share_soft_delete_retention_days       = var.managedSSrestoresa_sharesoftdelete
  network_acl_action                     = var.managedSSrestoresa_acl
  microsoft_trusted_services             = var.managedSSrestoresa_bypass
  routing_preference                     = var.managedSSrestoresa_routing
  publish_internet_endpoints             = var.managedSSrestoresa_publishinternet
  publish_microsoft_endpoints            = var.managedSSrestoresa_publishmicrosoft
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.createTargetRgForLzmanagedSSrestoresa]

}

####  Managed restore SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-managed-restoresa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.managedSSrestoresaRgName
  endpoint_name                  = var.managedSSrestoresa_endpoint_name
  resource_Location              = var.lzHubManagedResourceLocation
  subnet_id                      = data.azurerm_subnet.managedSSpesubnet.id //
  endpoint_SC                    = var.managedSSrestoresa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.managedSSrestoresa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.SScentralblobdnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
