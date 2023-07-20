################# Resource Group - ApexHS-Dev VM Logging  #############
module "createTargetRgForApexHSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ApexHSVmLogsRgName
  resourceLocation  = var.ApexHSResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.createTargetRgForApexHSVmLogging.rgName
  resourceLocation                       = var.ApexHSResourceLocation
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
  depends_on                             = [module.createTargetRgForApexHSVmLogging, ]
}



################# Resource Group - ApexHS-TEST VM Logging  #############

module "createTargetRgForApexHStstVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.ApexHStstVmLogsRgName
  resourceLocation  = var.ApexHSResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}

module "vmDiag-StorageAccountApexHStst" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = module.createTargetRgForApexHStstVmLogging.rgName
  resourceLocation                       = var.ApexHSResourceLocation
  storageAccountName                     = var.vmDiagtstSA
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
  depends_on                             = [module.createTargetRgForApexHStstVmLogging, ]
}
############ AVM Storage Account #######################
/*
module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

  resourceGroupName = var.avmsaRgName
  resourceLocation  = var.avmsaResourceLocation
  additionalTags    = module.avmsaresourceGroupTags.tagsResult
}

module "avmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.2"

  resourceGroupName                      = var.avmsaRgName
  resourceLocation                       = var.avmsaResourceLocation
  storageAccountName                     = var.avmsa
  account_tier                           = var.avmsa_accounttier
  storagetype                            = var.avmsa_storagetype
  account_replication_type               = var.avmsa_accountreptype
  minTlsVersion                          = var.avmsa_tlsversion
  access_tier                            = var.avmsa_accesstier
  enable_https_traffic                   = var.avmsa_httpstraffic
  blob_public_access                     = var.avmsa_publicaccess
  hns_enabled                            = var.avmsa_hnsenable
  nfsv3_enabled                          = var.avmsa_nfsv3
  large_file_share                       = var.avmsa_largefileshare
  network_acl_action                     = var.avmsa_acl
  microsoft_trusted_services             = var.avmsa_bypass
  routing_preference                     = var.avmsa_routing
  publish_internet_endpoints             = var.avmsa_publishinternet
  publish_microsoft_endpoints            = var.avmsa_publishmicrosoft
  additionalTags                         = module.avmsaTags.tagsResult
  depends_on                             = [module.createTargetRgForavmsa]
} */
############ auxtstSA Storage Account #######################

module "createTargetRgForauxtstSA" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.auxtstSARgName
  resourceLocation  = var.auxtstSAResourceLocation
  additionalTags    = module.saresourceGroupTags.tagsResult
}

module "auxtst-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.auxtstSARgName
  resourceLocation                       = var.auxtstSAResourceLocation
  storageAccountName                     = var.auxtstSA
  account_tier                           = var.auxtstSA_accounttier
  storagetype                            = var.auxtstSA_storagetype
  account_replication_type               = var.auxtstSA_accountreptype
  minTlsVersion                          = var.auxtstSA_tlsversion
  access_tier                            = var.auxtstSA_accesstier
  enable_https_traffic                   = var.auxtstSA_httpstraffic
  blob_public_access                     = var.auxtstSA_publicaccess
  hns_enabled                            = var.auxtstSA_hnsenable
  nfsv3_enabled                          = var.auxtstSA_nfsv3
  large_file_share                       = var.auxtstSA_largefileshare
  blob_soft_delete_retention_days        = var.auxtstSA_blobsoftdelete
  container_delete_retention_policy_days = var.auxtstSA_containersoftdelete
  share_soft_delete_retention_days       = var.auxtstSA_sharesoftdelete
  network_acl_action                     = var.auxtstSA_acl
  microsoft_trusted_services             = var.auxtstSA_bypass
  routing_preference                     = var.auxtstSA_routing
  publish_internet_endpoints             = var.auxtstSA_publishinternet
  publish_microsoft_endpoints            = var.auxtstSA_publishmicrosoft
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.createTargetRgForauxtstSA]
}
############ auxdevsa Storage Account #######################

module "createTargetRgForauxdevsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.auxdevsaRgName
  resourceLocation  = var.auxdevsaResourceLocation
  additionalTags    = module.saresourceGroupTags.tagsResult
}

module "auxdev-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.auxdevsaRgName
  resourceLocation                       = var.auxdevsaResourceLocation
  storageAccountName                     = var.auxdevsa
  account_tier                           = var.auxdevsa_accounttier
  storagetype                            = var.auxdevsa_storagetype
  account_replication_type               = var.auxdevsa_accountreptype
  minTlsVersion                          = var.auxdevsa_tlsversion
  access_tier                            = var.auxdevsa_accesstier
  enable_https_traffic                   = var.auxdevsa_httpstraffic
  blob_public_access                     = var.auxdevsa_publicaccess
  hns_enabled                            = var.auxdevsa_hnsenable
  nfsv3_enabled                          = var.auxdevsa_nfsv3
  large_file_share                       = var.auxdevsa_largefileshare
  blob_soft_delete_retention_days        = var.auxdevsa_blobsoftdelete
  container_delete_retention_policy_days = var.auxdevsa_containersoftdelete
  share_soft_delete_retention_days       = var.auxdevsa_sharesoftdelete
  network_acl_action                     = var.auxdevsa_acl
  microsoft_trusted_services             = var.auxdevsa_bypass
  routing_preference                     = var.auxdevsa_routing
  publish_internet_endpoints             = var.auxdevsa_publishinternet
  publish_microsoft_endpoints            = var.auxdevsa_publishmicrosoft
  additionalTags                         = module.vmDiagSATags.tagsResult
  depends_on                             = [module.createTargetRgForauxdevsa]
}
#### Apex vmDiagDev SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-vmDiagDev" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.ApexHSVmLogsRgName
  endpoint_name                  = var.vmDiagDev_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.apextstpesubnet.id //
  endpoint_SC                    = var.vmDiagDev_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.vmDiagDevsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### Apex vmDiagtst SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-vmDiagtst" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.ApexHStstVmLogsRgName
  endpoint_name                  = var.vmDiagtst_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.apextstpesubnet.id //
  endpoint_SC                    = var.vmDiagtst_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.vmDiagtstsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### Apex auxdev SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-auxdev" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.auxdevsaRgName
  endpoint_name                  = var.auxdev_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.apextstpesubnet.id //
  endpoint_SC                    = var.auxdev_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.auxdevsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}
#### Apex auxtst SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-auxtst" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.auxtstSARgName
  endpoint_name                  = var.auxtst_endpoint_name
  resource_Location              = var.ApexHSResourceLocation
  subnet_id                      = data.azurerm_subnet.apextstpesubnet.id //
  endpoint_SC                    = var.auxtst_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.auxtstsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value] //
  additionalTags                 = module.vmDiagSATags.tagsResult
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
  depends_on                 = [module.vmDiag-StorageAccount, module.vmDiag-StorageAccountApexHStst, module.auxtst-StorageAccount, module.auxdev-StorageAccount]
}
