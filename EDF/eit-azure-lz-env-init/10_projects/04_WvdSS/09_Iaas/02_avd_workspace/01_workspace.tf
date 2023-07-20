module "AVDWorkspace" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-avd-workspace"
  for_each                   = var.Workspace
  avd_WorkSpace_Name         = each.value.avd_WorkSpace_Name
  avd_Location               = each.value.avd_Location
  avd_WorkSpace_FriendlyName = each.value.avd_WorkSpace_FriendlyName
  avd_WorkSpace_Description  = each.value.avd_WorkSpace_Description
  avd_ResourceGroup_Name     = each.value.avd_ResourceGroup_Name
  additionalTags             = each.value.additionalTags
}
