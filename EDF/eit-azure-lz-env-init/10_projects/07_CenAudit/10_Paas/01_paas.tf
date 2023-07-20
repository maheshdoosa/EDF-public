################ Resource Group - centralAudit Subscription Logging  #############
module "createTargetRgForcenadtSubLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"

  resourceGroupName = var.cenadtSubLogsRgName
  resourceLocation  = var.cenadtResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}
module "subLogs-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.subLogsSARgName
  resourceLocation                       = var.subLogsSAResourceLocation
  storageAccountName                     = var.subLogsSA
  account_tier                           = var.subLogsSA_accounttier
  storagetype                            = var.subLogsSA_storagetype
  account_replication_type               = var.subLogsSA_accountreptype
  minTlsVersion                          = var.subLogsSA_tlsversion
  access_tier                            = var.subLogsSA_accesstier
  enable_https_traffic                   = var.subLogsSA_httpstraffic
  blob_public_access                     = var.subLogsSA_publicaccess
  hns_enabled                            = var.subLogsSA_hnsenable
  nfsv3_enabled                          = var.subLogsSA_nfsv3
  large_file_share                       = var.subLogsSA_largefileshare
  blob_soft_delete_retention_days        = var.subLogsSA_blobsoftdelete
  container_delete_retention_policy_days = var.subLogsSA_containersoftdelete
  share_soft_delete_retention_days       = var.subLogsSA_sharesoftdelete
  network_acl_action                     = var.subLogsSA_acl
  microsoft_trusted_services             = var.subLogsSA_bypass
  routing_preference                     = var.subLogsSA_routing
  publish_internet_endpoints             = var.subLogsSA_publishinternet
  publish_microsoft_endpoints            = var.subLogsSA_publishmicrosoft
  additionalTags                         = module.subAuditLogsSATags.tagsResult
  depends_on                             = [module.createTargetRgForcenadtSubLogging]
}

module "EnforceImmutability" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage/immutability?ref=v1.1.19"
  resourceGroupName  = module.createTargetRgForcenadtSubLogging.rgName
  storageAccountName = var.subLogsSA

  containers = {
    container1 = "insights-activity-logs" #container created automatically
  }

  immutabilityPeriod = var.subLogsSAImmutabilityRetentionPeriod

  tenantId        = data.azurerm_key_vault_secret.tenantId.value
  subscriptionId  = data.azurerm_key_vault_secret.subscriptionId.value
  spApplicationId = data.azurerm_key_vault_secret.contributorSpId.value
  spSecret        = data.azurerm_key_vault_secret.contributorSpSecret.value

  depends_on = [
    module.subLogs-StorageAccount,
  ]
}

################ Resource Group - Boot Diag SA  #############
module "createTargetRgForvmBootDiagSA" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.1.19"
  resourceGroupName = var.lzcenadtHSbootdiagsaRgName
  resourceLocation  = var.lzHubcenadtResourceLocation
  additionalTags    = module.vmDiagSATags.tagsResult
}
module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.vmDiagSARgName
  resourceLocation                       = var.vmDiagSAResourceLocation
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
  depends_on                             = [module.createTargetRgForvmBootDiagSA]
}
########### Cenadt HS vmDiagSA private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-mgmtPrdSS" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = module.createTargetRgForvmBootDiagSA.rgName
  endpoint_name                  = var.sa_endpoint_name
  resource_Location              = var.resource_Location
  subnet_id                      = data.azurerm_subnet.subnet.id //
  endpoint_SC                    = var.sa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.sapep.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [local.sadnszoneid] //
  additionalTags                 = module.vmDiagSATags.tagsResult
  depends_on                     = [module.vmDiag-StorageAccount]
}
########### Cenadt HS subLogsSA private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-subLogsSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.subLogsSARgName
  endpoint_name                  = var.subLogsSA_endpoint_name
  resource_Location              = var.vmDiagSAResourceLocation
  subnet_id                      = data.azurerm_subnet.subnet.id //
  endpoint_SC                    = var.subLogsSA_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.subLogsSA.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.sadnszoneid.value]
}


############ AVM Storage Account #######################

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
########### Cenadt HS avmsa private End Point integration with DNS Zone ##############
module "azure-private-endpoint-dns-Integrate-avmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.sa_private_dns_zone_name
  resource_group_name            = var.avmsaRgName
  endpoint_name                  = var.avmsa_endpoint_name
  resource_Location              = var.vmDiagSAResourceLocation
  subnet_id                      = data.azurerm_subnet.subnet.id //
  endpoint_SC                    = var.avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.avmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.sapep_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.sadnszoneid.value]
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
  depends_on                 = [module.subLogs-StorageAccount, module.vmDiag-StorageAccount, module.avmsa-StorageAccount]
}
