######################## AD Security Group Creation ####################

module "AD_group_creation_01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name     = var.ad_group_01_name
  description      = var.ad_group_01_description
  owners           = var.ad_group_01_owners
  members          = var.ad_group_01_members
  security_enabled = true
}

############################ Custom and builtin Role Assignment ##################################

module "role_assignment_01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name01
  principal_id         = module.AD_group_creation_01.id
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.roleassignmetscope01}"
}

module "role_assignment_02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name01
  principal_id         = module.AD_group_creation_01.id
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.roleassignmetscope02}"
}

# module "role_assignment_03" {
#   source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init"

#   role_definition_name = var.role_definition_name01
#   principal_id         = module.AD_group_creation_01.id
#   scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.roleassignmetscope03}"
# }

################### Bastion RBAC access ########################################################

######################## AD Security Group Creation ####################

module "AD_group_creation_04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name     = var.ad_group_04_name
  description      = var.ad_group_04_description
  owners           = var.ad_group_04_owners
  members          = var.ad_group_04_members
  security_enabled = true
}

############################ Custom and builtin Role Assignment ##################################

module "role_assignment_04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name04
  principal_id         = module.AD_group_creation_04.id
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.roleassignmetscope04}"
}

module "role_assignment_05" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name05
  principal_id         = module.AD_group_creation_04.id
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.roleassignmetscope05}"
}
