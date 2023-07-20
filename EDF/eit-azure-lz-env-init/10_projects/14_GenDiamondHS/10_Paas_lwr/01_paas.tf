module "StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName        = var.genlwrSARgName
  resourceLocation         = var.genlwrSAResourceLocation
  storageAccountName       = var.genlwrSA
  account_tier             = var.genlwrSA_accounttier
  storagetype              = var.genlwrSA_storagetype
  account_replication_type = var.genlwrSA_accountreptype
  minTlsVersion            = var.genlwrSA_tlsversion
  access_tier              = var.genlwrSA_accesstier
  enable_https_traffic     = var.genlwrSA_httpstraffic
  blob_public_access       = var.genlwrSA_publicaccess
  hns_enabled              = var.genlwrSA_hnsenable
  nfsv3_enabled            = var.genlwrSA_nfsv3
  large_file_share         = var.genlwrSA_largefileshare
  # blob_soft_delete_retention_days        = var.genlwrSA_blobsoftdelete
  # container_delete_retention_policy_days = var.genlwrSA_containersoftdelete
  # share_soft_delete_retention_days       = var.genlwrSA_sharesoftdelete
  network_acl_action          = var.genlwrSA_acl
  microsoft_trusted_services  = var.genlwrSA_bypass
  routing_preference          = var.genlwrSA_routing
  publish_internet_endpoints  = var.genlwrSA_publishinternet
  publish_microsoft_endpoints = var.genlwrSA_publishmicrosoft
  additionalTags              = module.genlwrSATags.tagsResult

}



module "azure-private-endpoint-dns-Integrate-gendianmdsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.genlwrSARgName
  endpoint_name                  = var.genlwrsa_endpoint_name
  resource_Location              = var.genlwrSAResourceLocation
  subnet_id                      = data.azurerm_subnet.pesubnet.id //
  endpoint_SC                    = var.genlwrsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.genlwrpep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
}