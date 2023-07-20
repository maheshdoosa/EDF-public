# ############### Resource Group - M365 Storage Account  #############
#  module "createTargetRgForm365storageacc" {
#    source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"

#    resourceGroupName = var.m365SubRgName
#    resourceLocation  = var.m365subResourceLocation

#    additionalTags    = module.resourceGroupTags.tagsResult
#  }

module "m365sub-StorageAccount" {
  source             = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-storage?ref=v1.1.19"
  resourceGroupName  = var.m365SubRgName
  resourceLocation   = var.m365subResourceLocation
  storageAccountName = var.m365SA
  minTlsVersion      = "TLS1_2" #should be static throughout

  containers = {
    container1 = "eitprdm365blob01" #container created automatically
  }

  additionalTags = module.m365subSATags.tagsResult


  #  depends_on = [
  #    module.createTargetRgForm365storageacc,
  #  ]
}

#### m365 SA Private endpoint #############
module "azure-private-endpoint-dns-Integrate-m365sub" {
  source                         = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-private-endpoint-dns-Integrate?ref=v1.1.19"
  private_dns_zone_name          = var.saprivate_dns_zone_name
  resource_group_name            = var.m365SubRgName
  endpoint_name                  = var.m365sa_endpoint_name
  resource_Location              = var.m365subResourceLocation
  subnet_id                      = data.azurerm_subnet.m365pesubnet.id //
  endpoint_SC                    = var.m365sa_endpoint_SC
  private_connection_resource_id = data.azurerm_storage_account.m365subsa.id //
  is_manual_connection           = var.is_manual_connection
  subresource_names              = var.m365sa_subresource_names
  private_dns_zone_ids           = [data.azurerm_key_vault_secret.SScentralblobdnszoneid.value] //
  additionalTags                 = module.m365subSATags.tagsResult
}
