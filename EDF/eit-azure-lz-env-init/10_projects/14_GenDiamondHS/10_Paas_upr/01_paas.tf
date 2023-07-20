module "StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName        = var.genuprSARgName
  resourceLocation         = var.genuprSAResourceLocation
  storageAccountName       = var.genuprSA
  account_tier             = var.genuprSA_accounttier
  storagetype              = var.genuprSA_storagetype
  account_replication_type = var.genuprSA_accountreptype
  minTlsVersion            = var.genuprSA_tlsversion
  access_tier              = var.genuprSA_accesstier
  enable_https_traffic     = var.genuprSA_httpstraffic
  blob_public_access       = var.genuprSA_publicaccess
  hns_enabled              = var.genuprSA_hnsenable
  nfsv3_enabled            = var.genuprSA_nfsv3
  large_file_share         = var.genuprSA_largefileshare
  # blob_soft_delete_retention_days        = var.genuprSA_blobsoftdelete
  # container_delete_retention_policy_days = var.genuprSA_containersoftdelete
  # share_soft_delete_retention_days       = var.genuprSA_sharesoftdelete
  network_acl_action          = var.genuprSA_acl
  microsoft_trusted_services  = var.genuprSA_bypass
  routing_preference          = var.genuprSA_routing
  publish_internet_endpoints  = var.genuprSA_publishinternet
  publish_microsoft_endpoints = var.genuprSA_publishmicrosoft
  additionalTags              = module.subAuditLogsSATags.tagsResult
}


module "azure-private-endpoint-dns-Integrate-gendianmdsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.genuprSARgName
  endpoint_name                  = var.genuprsa_endpoint_name
  resource_Location              = var.genuprSAResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.genuprsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.genuprpep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}