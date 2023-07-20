module "AVDresourcegroup" {
  source            = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rg"
  for_each          = var.avd_resource_group
  resourceGroupName = each.value.avd_ResourceGroup_Name
  resourceLocation  = each.value.avd_Location
  additionalTags    = each.value.additionalTags
}
