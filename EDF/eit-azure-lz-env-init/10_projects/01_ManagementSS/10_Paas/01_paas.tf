# ################ Resource Group - managementSS VM Logging  #############
module "createTargetRgForLzmanagementSSVmLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzmanagementSSVmLogsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.vmDiagSATags.tagsResult
}

module "vmDiag-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.0"

  resourceGroupName  = module.createTargetRgForLzmanagementSSVmLogging.rgName
  resourceLocation   = var.lzHubManagementResourceLocation
  storageAccountName = var.vmDiagSA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = {} #no containers

  additionalTags = module.vmDiagSATags.tagsResult

  depends_on = [
    module.createTargetRgForLzmanagementSSVmLogging,
  ]
}

################ Resource Group - managementSS Subscription Logging  #############
module "createTargetRgForLzmanagementSSSubLogging" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzmanagementSSSubLogsRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.subAuditLogsSATags.tagsResult
}
module "subLogs-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.0.0"

  resourceGroupName  = module.createTargetRgForLzmanagementSSSubLogging.rgName
  resourceLocation   = var.lzHubManagementResourceLocation
  storageAccountName = var.subLogsSA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = {
    container1 = "insights-activity-logs" #container created automatically
  }

  additionalTags = module.subAuditLogsSATags.tagsResult

  depends_on = [
    module.createTargetRgForLzmanagementSSSubLogging,
  ]
}
module "EnforceImmutability" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage/immutability?ref=v1.0.0"
  resourceGroupName  = module.createTargetRgForLzmanagementSSSubLogging.rgName
  storageAccountName = var.subLogsSA

  containers = {
    container1 = "insights-activity-logs" #container created automatically
  }

  immutabilityPeriod = var.subLogsSAImmutabilityRententionPeriod

  tenantId        = data.azurerm_key_vault_secret.tenantId.value
  subscriptionId  = data.azurerm_key_vault_secret.subscriptionId.value
  spApplicationId = data.azurerm_key_vault_secret.contributorSpId.value
  spSecret        = data.azurerm_key_vault_secret.contributorSpSecret.value

  depends_on = [
    module.subLogs-StorageAccount,
  ]
}

################ Creating RG for Apex prd Private DNS Zone #############
/*
module "create-Target-Rg-for-apex-Private-DNSZone" {
    source                      =   "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
    resourceGroupName           =   var.ApexHSPrivateDNSRgName
    resourceLocation            =   var.ApexHSResourceLocation
    additionalTags              =   module.ApexHsuatresourceGroupTags.tagsResult
}
############# creating private DNS zone for Apex Hs  ##############
module "azure-private-dns-zone-ApexHs" {
  source                        = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone"
  private_dns_zone_name         =   var.private_dns_zone_name
  resource_group_name           =   var.ApexHSPrivateDNSRgName
  additionalTags                =   module.KVTags.tagsResult
  depends_on                    =   [module.create-Target-Rg-for-apex-Private-DNSZone,]
}

############# private DNS zone linking with Vnet ##############
module "azure-private-dns-zone-vnet-link" {
  source                        = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-dns-zone-vnet-link"
  vnet_dns_link_name            =   var.vnet_dns_link_name
  resource_group_name           =   var.mgmtPrivateDNSRgName
  private_dns_zone_name         =   var.private_dns_zone_name
  virtual_network_id            =   data.azurerm_virtual_network.mgmtPrdSSVnet.id
}
*/

########### Mgmt SS vmDiagSA private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-mgmtPrdSS" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.mgmt_vmsa_resourceGroupName
  endpoint_name                  = var.mgmt_vmsa_endpoint_name
  resource_Location              = var.lzHubManagementResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtSSPrdsubnet.id //
  endpoint_SC                    = var.mgmt_vmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtPrdSSvmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtsaDnszone.id] //
  additionalTags                 = module.vmDiagSATags.tagsResult
}

########### Mgmt SS subLogsSA private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-mgmtPrdSS-subLogsSA" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.mgmt_sublogsa_resourceGroupName
  endpoint_name                  = var.mgmt_sublogsa_endpoint_name
  resource_Location              = var.lzHubManagementResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtSSPrdsubnet.id //
  endpoint_SC                    = var.mgmt_sublogsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtPrdSSsublogsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtsaDnszone.id] //
  additionalTags                 = module.subAuditLogsSATags.tagsResult
}

####### Storage account Management AVM ######################

module "createTargetRgFormgmtavmsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.mgmtavmsaRgName
  resourceLocation  = var.mgmtavmsaResourceLocation

  additionalTags = module.mgmtavmsaresourceGroupTags.tagsResult
}

module "mgmtavmsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.mgmtavmsaRgName
  resourceLocation                       = var.mgmtavmsaResourceLocation
  storageAccountName                     = var.mgmtavmsa
  account_tier                           = var.mgmtavmsa_accounttier
  storagetype                            = var.mgmtavmsa_storagetype
  account_replication_type               = var.mgmtavmsa_accountreptype
  minTlsVersion                          = var.mgmtavmsa_tlsversion
  access_tier                            = var.mgmtavmsa_accesstier
  enable_https_traffic                   = var.mgmtavmsa_httpstraffic
  blob_public_access                     = var.mgmtavmsa_publicaccess
  hns_enabled                            = var.mgmtavmsa_hnsenable
  nfsv3_enabled                          = var.mgmtavmsa_nfsv3
  large_file_share                       = var.mgmtavmsa_largefileshare
  blob_soft_delete_retention_days        = var.mgmtavmsa_blobsoftdelete
  container_delete_retention_policy_days = var.mgmtavmsa_containersoftdelete
  share_soft_delete_retention_days       = var.mgmtavmsa_sharesoftdelete
  network_acl_action                     = var.mgmtavmsa_acl
  microsoft_trusted_services             = var.mgmtavmsa_bypass
  routing_preference                     = var.mgmtavmsa_routing
  publish_internet_endpoints             = var.mgmtavmsa_publishinternet
  publish_microsoft_endpoints            = var.mgmtavmsa_publishmicrosoft
  additionalTags                         = module.mgmtavmsaTags.tagsResult
  depends_on                             = [module.createTargetRgFormgmtavmsa]

}
module "mgmtavmsa-ca" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtavmsaca
  storageAccountName = var.mgmtavmsa
  depends_on         = [module.mgmtavmsa-StorageAccount]
}


############ Storage account for NTC ################

module "createTargetRgFormgmtntcsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.mgmtntcsaRgName
  resourceLocation  = var.mgmtavmsaResourceLocation

  additionalTags = module.mgmtntcsaresourceGroupTags.tagsResult
}

module "mgmtntcsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.mgmtntcsaRgName
  resourceLocation                       = var.mgmtntcsaResourceLocation
  storageAccountName                     = var.mgmtntcsa
  account_tier                           = var.mgmtntcsa_accounttier
  storagetype                            = var.mgmtntcsa_storagetype
  account_replication_type               = var.mgmtntcsa_accountreptype
  minTlsVersion                          = var.mgmtntcsa_tlsversion
  access_tier                            = var.mgmtntcsa_accesstier
  enable_https_traffic                   = var.mgmtntcsa_httpstraffic
  blob_public_access                     = var.mgmtntcsa_publicaccess
  hns_enabled                            = var.mgmtntcsa_hnsenable
  nfsv3_enabled                          = var.mgmtntcsa_nfsv3
  large_file_share                       = var.mgmtntcsa_largefileshare
  blob_soft_delete_retention_days        = var.mgmtntcsa_blobsoftdelete
  container_delete_retention_policy_days = var.mgmtntcsa_containersoftdelete
  share_soft_delete_retention_days       = var.mgmtntcsa_sharesoftdelete
  network_acl_action                     = var.mgmtntcsa_acl
  microsoft_trusted_services             = var.mgmtntcsa_bypass
  routing_preference                     = var.mgmtntcsa_routing
  publish_internet_endpoints             = var.mgmtntcsa_publishinternet
  publish_microsoft_endpoints            = var.mgmtntcsa_publishmicrosoft
  additionalTags                         = module.mgmtntcsaTags.tagsResult
  depends_on                             = [module.createTargetRgFormgmtntcsa]

}
module "mgmtavmsa-ca01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtntcsaca01
  storageAccountName = var.mgmtntcsa
  depends_on         = [module.mgmtntcsa-StorageAccount]
}
module "mgmtavmsa-ca02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtntcsaca02
  storageAccountName = var.mgmtntcsa
  depends_on         = [module.mgmtntcsa-StorageAccount]
}
module "mgmtavmsa-ca03" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtntcsaca03
  storageAccountName = var.mgmtntcsa
  depends_on         = [module.mgmtntcsa-StorageAccount]
}

############ Storage account for AUX ################
module "createTargetRgFormgmtauxsa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.mgmtauxsaRgName
  resourceLocation  = var.mgmtauxsaResourceLocation

  additionalTags = module.mgmtauxsaresourceGroupTags.tagsResult
}




module "mgmtauxsa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.mgmtauxsaRgName
  resourceLocation                       = var.mgmtauxsaResourceLocation
  storageAccountName                     = var.mgmtauxsa
  account_tier                           = var.mgmtauxsa_accounttier
  storagetype                            = var.mgmtauxsa_storagetype
  account_replication_type               = var.mgmtauxsa_accountreptype
  minTlsVersion                          = var.mgmtauxsa_tlsversion
  access_tier                            = var.mgmtauxsa_accesstier
  enable_https_traffic                   = var.mgmtauxsa_httpstraffic
  blob_public_access                     = var.mgmtauxsa_publicaccess
  hns_enabled                            = var.mgmtauxsa_hnsenable
  nfsv3_enabled                          = var.mgmtauxsa_nfsv3
  large_file_share                       = var.mgmtauxsa_largefileshare
  blob_soft_delete_retention_days        = var.mgmtauxsa_blobsoftdelete
  container_delete_retention_policy_days = var.mgmtauxsa_containersoftdelete
  share_soft_delete_retention_days       = var.mgmtauxsa_sharesoftdelete
  network_acl_action                     = var.mgmtauxsa_acl
  microsoft_trusted_services             = var.mgmtauxsa_bypass
  routing_preference                     = var.mgmtauxsa_routing
  publish_internet_endpoints             = var.mgmtauxsa_publishinternet
  publish_microsoft_endpoints            = var.mgmtauxsa_publishmicrosoft
  additionalTags                         = module.mgmtauxsaTags.tagsResult
  depends_on                             = [module.createTargetRgFormgmtauxsa]

}
module "mgmtauxsa-ca01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtauxsaca01
  storageAccountName = var.mgmtauxsa
  depends_on         = [module.mgmtauxsa-StorageAccount]
}
module "mgmtauxsa-ca02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtauxsaca02
  storageAccountName = var.mgmtauxsa
  depends_on         = [module.mgmtauxsa-StorageAccount]
}



####### Storage account Management cli ######################

module "createTargetRgFormgmtclisa" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.mgmtclisaRgName
  resourceLocation  = var.mgmtclisaResourceLocation

  additionalTags = module.mgmtclisaresourceGroupTags.tagsResult
}

module "mgmtclisa-StorageAccount" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-v2?ref=v1.0.0"

  resourceGroupName                      = var.mgmtclisaRgName
  resourceLocation                       = var.mgmtclisaResourceLocation
  storageAccountName                     = var.mgmtclisa
  account_tier                           = var.mgmtclisa_accounttier
  storagetype                            = var.mgmtclisa_storagetype
  account_replication_type               = var.mgmtclisa_accountreptype
  minTlsVersion                          = var.mgmtclisa_tlsversion
  access_tier                            = var.mgmtclisa_accesstier
  enable_https_traffic                   = var.mgmtclisa_httpstraffic
  blob_public_access                     = var.mgmtclisa_publicaccess
  hns_enabled                            = var.mgmtclisa_hnsenable
  nfsv3_enabled                          = var.mgmtclisa_nfsv3
  large_file_share                       = var.mgmtclisa_largefileshare
  blob_soft_delete_retention_days        = var.mgmtclisa_blobsoftdelete
  container_delete_retention_policy_days = var.mgmtclisa_containersoftdelete
  share_soft_delete_retention_days       = var.mgmtclisa_sharesoftdelete
  network_acl_action                     = var.mgmtclisa_acl
  microsoft_trusted_services             = var.mgmtclisa_bypass
  routing_preference                     = var.mgmtclisa_routing
  publish_internet_endpoints             = var.mgmtclisa_publishinternet
  publish_microsoft_endpoints            = var.mgmtclisa_publishmicrosoft
  additionalTags                         = module.mgmtclisaTags.tagsResult
  depends_on                             = [module.createTargetRgFormgmtclisa]

}
module "mgmtclisa-ca" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage-containers?ref=v1.0.0"

  container_name     = var.mgmtclisaca
  storageAccountName = var.mgmtclisa
  depends_on         = [module.mgmtclisa-StorageAccount]
}




########### Mgmt SS SA AVM private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-mgmtPrdSS-avmsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.mgmt_avmsa_resourceGroupName
  endpoint_name                  = var.mgmt_avmsa_endpoint_name
  resource_Location              = var.lzHubManagementResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtSSPrdsubnet.id //
  endpoint_SC                    = var.mgmt_avmsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtPrdSSavmsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtsaDnszone.id] //
  additionalTags                 = module.mgmtavmsaTags.tagsResult
}

########### Mgmt SS SA aux private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-mgmtPrdSS-auxsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.mgmt_auxsa_resourceGroupName
  endpoint_name                  = var.mgmt_auxsa_endpoint_name
  resource_Location              = var.lzHubManagementResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtSSPrdsubnet.id //
  endpoint_SC                    = var.mgmt_auxsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtPrdSSauxsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtsaDnszone.id] //
  additionalTags                 = module.mgmtauxsaTags.tagsResult
}

########### Mgmt SS SA ntc private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-mgmtPrdSS-ntcsa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.mgmt_ntcsa_resourceGroupName
  endpoint_name                  = var.mgmt_ntcsa_endpoint_name
  resource_Location              = var.lzHubManagementResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtSSPrdsubnet.id //
  endpoint_SC                    = var.mgmt_ntcsa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtPrdSSntcsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtsaDnszone.id] //
  additionalTags                 = module.mgmtntcsaTags.tagsResult
}

########### Mgmt SS SA cli private End Point integrating with DNS Zone ##############

module "azure-private-endpoint-dns-Integrate-mgmtPrdSS-clisa" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.0.0"
  private_dns_zone_name          = var.private_dns_zone_name
  resource_group_name            = var.mgmt_clisa_resourceGroupName
  endpoint_name                  = var.mgmt_clisa_endpoint_name
  resource_Location              = var.lzHubManagementResourceLocation
  subnet_id                      = data.azurerm_subnet.mgmtSSPrdsubnet.id //
  endpoint_SC                    = var.mgmt_clisa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.mgmtPrdSSclisa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.subresource_names
  private_dns_zone_ids           = [data.azurerm_private_dns_zone.mgmtsaDnszone.id] //
  additionalTags                 = module.mgmtclisaTags.tagsResult
}



# ################ Resource Group - managementSS Image Build  #############
module "createTargetRgForLzmanagementSSVmimage" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg?ref=v1.0.0"

  resourceGroupName = var.lzmanagementSSVmimageRgName
  resourceLocation  = var.lzHubManagementResourceLocation

  additionalTags = module.vmimageTags.tagsResult
}

# ################ Shared image gallery - managementSS Image Build  #############
module "createTargetsigForLzmanagementSSVmimage" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImagegallery?ref=v1.0.0"

  SIgallery       = var.SIgalleryname #"test_image_gallery_tfcode"
  SIresourcegroup = var.lzmanagementSSVmimageRgName
  SIlocation      = var.lzHubManagementResourceLocation
  depends_on = [
    module.createTargetRgForLzmanagementSSVmimage,
  ]
}

# # ################ Shared image gallery Image - managementSS Image Build  #############
module "createTargetimageForLzmanagementSSVmimage" {
  source                   = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-sharedImage?ref=v1.0.0"
  for_each                 = var.images
  sharedimagename          = each.value.sharedimagename
  Sharedimagegalleryname   = each.value.Sharedimagegalleryname
  sharedimageresourcegroup = each.value.sharedimageresourcegroup
  sharedimagelocation      = each.value.sharedimagelocation
  os_type                  = each.value.os_type
  publisher                = each.value.publisher
  offer                    = each.value.offer
  sku                      = each.value.sku
  planpurchase             = each.value.planpurchase
  planpublisher            = each.value.planpublisher
  planproduct              = each.value.planproduct

  depends_on = [
    module.createTargetsigForLzmanagementSSVmimage,
  ]
}
