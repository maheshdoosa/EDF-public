################ AFS managementSs #############

module "azure-storage-sync-AFS" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-file-sync?ref=v1.0.0"
  storageSyncName      = var.lzmanagementSsAFSSaSyncName
  resourceGroupName    = var.lzmanagementSsAFSVmRgName
  resourceLocation     = var.lzHubManagementResourceLocation
  storageSyncGroupName = var.lzmanagementSsAFSSaSyncName
  storage_sync_id      = data.azurerm_key_vault_secret.afs-sync-group-id.value
  additionalTags       = module.AFSSaSync01Tags.tagsResult
}

module "azurestorageaccountAFS" {
  source                                 = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"
  resourceGroupName                      = var.lzmanagementSsAFSVmRgName
  resourceLocation                       = var.lzHubManagementResourceLocation
  storageAccountName                     = var.lzmanagementSsAFSSaName
  account_tier                           = var.account_tier
  storagetype                            = var.storagetype
  account_replication_type               = var.account_replication_type
  minTlsVersion                          = var.minTlsVersion
  access_tier                            = var.access_tier
  enable_https_traffic                   = var.enable_https_traffic
  blob_public_access                     = var.blob_public_access
  hns_enabled                            = var.hns_enabled
  nfsv3_enabled                          = var.nfsv3_enabled
  large_file_share                       = var.large_file_share
  blob_soft_delete_retention_days        = var.blob_soft_delete_retention_days
  container_delete_retention_policy_days = var.container_delete_retention_policy_days
  share_soft_delete_retention_days       = var.share_soft_delete_retention_days
  network_acl_action                     = var.network_acl_action
  microsoft_trusted_services             = var.microsoft_trusted_services
  routing_preference                     = var.routing_preference
  publish_internet_endpoints             = var.publish_internet_endpoints
  publish_microsoft_endpoints            = var.publish_microsoft_endpoints

  additionalTags = module.AFSSa01Tags.tagsResult
  depends_on = [
    module.azure-storage-sync-AFS
  ]

}

module "PrivateEndPoints" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint?ref=v1.0.0"

  endPointName                = var.lzmanagementSsAFSPrivateEndpoint
  endPointLocation            = var.lzHubManagementResourceLocation
  resourceGroupName           = var.lzmanagementSsAFSVmRgName
  subnetId                    = data.azurerm_subnet.AFSSysSubnet.id
  azMonitorPrivateLinkScopeId = data.azurerm_storage_account.azAFSsa.id
  subResourceName             = var.lzmanagementSsAFSSubResourceName
  privateServiceConnName      = var.lzmanagementSsAFSServiceConnection
  depends_on = [
    module.safileshare-AFS
  ]
}

module "safileshare-AFS" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-fileshare?ref=v1.0.0"
  fileshare_name     = var.lzmanagementSsAFSFileShare
  storageAccountName = var.lzmanagementSsAFSSaName
  fileshare_quota    = var.fileshare_quota
  depends_on = [module.azurestorageaccountAFS
  ]
}

module "cloudsyncendpoint-AFS" {
  source                       = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-filesync-cloudendpoint?ref=v1.0.0"
  storageSyncCloudEndpointName = var.lzmanagementSsAFSFileShare
  storage_sync_group_id        = data.azurerm_storage_sync_group.AFSSaSyncGroup.id
  fileshare_name               = var.lzmanagementSsAFSFileShare
  storage_account_id           = data.azurerm_storage_account.AFSSaName.id
  depends_on = [
    module.safileshare-AFS, module.azure-storage-sync-AFS, module.PrivateEndPoints
  ]
}
