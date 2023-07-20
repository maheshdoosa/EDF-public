# Create AVD hostpool
module "AVDhostpool" {
  source                    = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-avd-hostpool"
  for_each                  = var.hostpool
  avd_ResourceGroup_Name    = each.value.avd_ResourceGroup_Name
  avd_HostPool_Name         = each.value.avd_HostPool_Name
  avd_Location              = each.value.avd_Location
  avd_Pooltype              = each.value.avd_Pooltype
  avd_Maximum_Sessions      = each.value.avd_Maximum_Sessions
  avd_Load_Balancer_Type    = each.value.avd_Load_Balancer_Type
  avd_HostPool_FriendlyName = each.value.avd_HostPool_FriendlyName
  AVD_Loganalytics_id       = data.azurerm_key_vault_secret.LZworkspaceId[each.key].value
  avd_HostPool_Accesslevel  = each.value.avd_HostPool_Accesslevel
  spApplicationId           = data.azurerm_key_vault_secret.spApplicationId[each.key].value
  spSecret                  = data.azurerm_key_vault_secret.spSecret[each.key].value
  tenantId                  = data.azurerm_key_vault_secret.tenantId[each.key].value
  subscriptionId            = data.azurerm_key_vault_secret.subscriptionId[each.key].value
  additionalTags            = each.value.additionalTags
}

#Create AVD Desktop App Group for testing"

module "AVDAppGroup" {
  source                     = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-avd-appgroup"
  for_each                   = var.avd_AppGroup
  avd_ResourceGroup_Name     = each.value.avd_ResourceGroup_Name
  avd_HostPool_ID            = data.azurerm_key_vault_secret.hostpoolId[each.key].value
  avd_Location               = each.value.avd_Location
  avd_AppGroup_Name          = each.value.avd_AppGroup_Name
  avd_AppGroup_Type          = each.value.avd_AppGroup_Type
  avd_AppGroup_friendly_Name = each.value.avd_AppGroup_friendly_Name
  avd_AppGroup_Description   = each.value.avd_AppGroup_Description
  avd_WorkSpace_ID           = data.azurerm_key_vault_secret.workspaceId[each.key].value
  additionalTags             = each.value.additionalTags
  depends_on = [
    module.AVDhostpool
  ]
}

#Create AD assignments for App groups"

module "AVD_AD_AppGrp_assignment" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-avd-AD_AppGroup_assignment"
  for_each             = var.ADgroups
  AD_group_displayName = each.value.AD_group_displayName
  AppgroupResourceID   = data.azurerm_key_vault_secret.AppgroupId[each.key].value
  RoleName             = each.value.RoleName
  depends_on = [
    module.AVDAppGroup
  ]
}
