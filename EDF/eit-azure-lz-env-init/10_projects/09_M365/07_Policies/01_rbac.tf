######################### AD Security Group Creation ####################

module "AD_group_creation_01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name = var.ad_group_01_name
  description  = var.ad_group_01_description
  owners       = var.ad_group_01_owners
  members      = var.ad_group_01_members
}

module "AD_group_creation_02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name = var.ad_group_02_name
  description  = var.ad_group_02_description
  owners       = var.ad_group_02_owners
  members      = var.ad_group_02_members
}

module "AD_group_creation_03" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name = var.ad_group_03_name
  description  = var.ad_group_03_description
  owners       = var.ad_group_03_owners
  members      = var.ad_group_03_members
}

module "AD_group_creation_04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name = var.ad_group_04_name
  description  = var.ad_group_04_description
  owners       = var.ad_group_04_owners
  members      = var.ad_group_04_members
}


############################ Custom and builtin Role Assignment ##################################

module "role_assignment_01" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name01
  principal_id         = module.AD_group_creation_01.id
  scope                = "/subscriptions/${data.azurerm_key_vault_secret.SubscriptionId.value}/resourceGroups/${var.roleassignmetscope01}"
}

module "role_assignment_02" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name02
  principal_id         = module.AD_group_creation_02.id
  scope                = "/subscriptions/${data.azurerm_key_vault_secret.SubscriptionId.value}/resourceGroups/${var.roleassignmetscope01}"
}

module "role_assignment_03" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name03
  principal_id         = module.AD_group_creation_03.id
  scope                = "/subscriptions/${data.azurerm_key_vault_secret.SubscriptionId.value}/resourceGroups/${var.roleassignmetscope01}"
}

module "role_assignment_04" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name04
  principal_id         = module.AD_group_creation_04.id
  scope                = "/subscriptions/${data.azurerm_key_vault_secret.SubscriptionId.value}/resourceGroups/${var.roleassignmetscope01}"
}
