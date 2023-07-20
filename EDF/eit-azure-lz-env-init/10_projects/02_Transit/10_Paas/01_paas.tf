################ Resource Group - transit Subscription Logging  #############
module "createTargetRgForLzTransitSubLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzTransitSubLogsRgName
  resourceLocation  = var.lzTransitResourceLocation

  additionalTags = module.resourceGroupTags.tagsResult
}
module "subLogs-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.0"

  resourceGroupName  = module.createTargetRgForLzTransitSubLogging.rgName
  resourceLocation   = var.lzTransitResourceLocation
  storageAccountName = var.subLogsSA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = {} #no container to be created

  additionalTags = module.subAuditLogsSATags.tagsResult
}
module "EnforceImmutability" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage/immutability?ref=v1.0.0"
  resourceGroupName  = module.createTargetRgForLzTransitSubLogging.rgName
  storageAccountName = var.subLogsSA

  containers = {
    container1 = "insights-activity-logs" #container created automatically
  }

  immutabilityPeriod = var.subLogsSAImmutabilityRententionPeriod

  tenantId        = data.azurerm_key_vault_secret.tenantId.value
  subscriptionId  = data.azurerm_key_vault_secret.subscriptionId.value
  spApplicationId = data.azurerm_key_vault_secret.contributorSpId.value
  spSecret        = data.azurerm_key_vault_secret.contributorSpSecret.value
}

############ AVM Storage Account #######################

module "createTargetRgForavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

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


module "createexpressroutekv01" {
  source                          = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-keyvault?ref=v1.0.10"
  keyvault_name                   = var.keyvault_name02
  resource_Location               = var.resource_Location01
  resource_group_name             = var.kv_resource_group_name02
  tenant_id                       = data.azurerm_key_vault_secret.tenantId.value
  sku_name                        = var.sku_name02
  enabled_for_deployment          = var.enabled_for_deployment02
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption02
  enabled_for_template_deployment = var.enabled_for_template_deployment02
  soft_delete_retention_days      = var.soft_delete_retention_days02
  purge_protection_enabled        = var.purge_protection_enabled02
  # diagnosticsetting_name          = var.diagnosticsetting_name01
  # log_analytics_workspace_id      = data.azurerm_key_vault_secret.laworkspaceId.value
  default_action = var.default_action02
  bypass         = var.bypass02
  additionalTags = module.expressrouteTags.tagsResult
  #depends_on                      = [module.createTargetRgForKV01]
}

# ########### AVM SA Private Endpoint ##############
# module "azure-private-endpoint-dns-Integrate-avmsa" {
#   source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
#   private_dns_zone_name          = var.sa_private_dns_zone_name
#   resource_group_name            = var.avmsaRgName
#   endpoint_name                  = var.avmsa_endpoint_name
#   resource_Location              = var.avmsaResourceLocation
#   subnet_id                      = data.azurerm_subnet.pesubnet.id
#   endpoint_SC                    = var.avmsa_endpoint_SC
#   private_connection_resource_id = data.azurerm_storage_account.avmsa.id
#   is_manual_connection           = var.is_manual_connection
#   subresource_names              = var.sapep_subresource_names
#   private_dns_zone_ids           = [data.azurerm_key_vault_secret.HScentraldnszoneid.value]
# }

