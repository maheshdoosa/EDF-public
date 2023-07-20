module "StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName        = var.genstgSARgName
  resourceLocation         = var.genstgSAResourceLocation
  storageAccountName       = var.genstgSA
  account_tier             = var.genstgSA_accounttier
  storagetype              = var.genstgSA_storagetype
  account_replication_type = var.genstgSA_accountreptype
  minTlsVersion            = var.genstgSA_tlsversion
  access_tier              = var.genstgSA_accesstier
  enable_https_traffic     = var.genstgSA_httpstraffic
  blob_public_access       = var.genstgSA_publicaccess
  hns_enabled              = var.genstgSA_hnsenable
  nfsv3_enabled            = var.genstgSA_nfsv3
  large_file_share         = var.genstgSA_largefileshare
  # blob_soft_delete_retention_days        = var.genstgSA_blobsoftdelete
  # container_delete_retention_policy_days = var.genstgSA_containersoftdelete
  # share_soft_delete_retention_days       = var.genstgSA_sharesoftdelete
  network_acl_action          = var.genstgSA_acl
  microsoft_trusted_services  = var.genstgSA_bypass
  routing_preference          = var.genstgSA_routing
  publish_internet_endpoints  = var.genstgSA_publishinternet
  publish_microsoft_endpoints = var.genstgSA_publishmicrosoft
  additionalTags              = module.genstgSATags.tagsResult

}



module "azure-private-endpoint-dns-Integrate-gendianmdsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.genstgSARgName
  endpoint_name                  = var.genstgsa_endpoint_name
  resource_Location              = var.genstgSAResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.genstgsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.genstgpep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}