######################### AD Security Group Creation ####################

module "AD_group_creation_01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name     = var.ad_group_01_name
  description      = var.ad_group_01_description
  owners           = var.ad_group_01_owners
  members          = var.ad_group_01_members
  security_enabled = true
}

module "AD_group_creation_02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name     = var.ad_group_02_name
  description      = var.ad_group_02_description
  owners           = var.ad_group_02_owners
  members          = var.ad_group_02_members
  security_enabled = true
}


############################ Custom and builtin Role Assignment ##################################

module "role_assignment_01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name01
  principal_id         = module.AD_group_creation_01.id
  scope                = data.azurerm_subscription.current.id
}

module "role_assignment_02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name02
  principal_id         = module.AD_group_creation_02.id
  scope                = data.azurerm_subscription.current.id
}
