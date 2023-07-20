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

######################### Custom role creation for Virtual Machine Basic Operator ####################

module "custom_role_rbac" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-customrole-definition-env-init?ref=v1.1.19"
  name        = "Virtual Machine Basic Operator for HS"
  scope       = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  description = "Can deallocate, start  and restart virtual machines."
  actions = ["Microsoft.Compute/*/read",
    "Microsoft.Compute/virtualMachines/start/action",
    "Microsoft.Compute/virtualMachines/restart/action",
  "Microsoft.Compute/virtualMachines/deallocate/action"]
  not_actions       = []
  data_actions      = []
  not_data_actions  = []
  assignable_scopes = local._hssub
  #assignable_scopes = ["/subscriptions/${data.azurerm_client_config.current.subscription_id}"]
}

############################ Custom Role Assignment ##################################
module "role_assignment_aac" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"
  for_each             = local.roleassignmentscope
  role_definition_name = var.role_definition_name02
  principal_id         = data.azurerm_key_vault_secret.aacprincipalid.value
  scope                = each.value
  depends_on           = [module.custom_role_rbac]
}

############################ builtin Role Assignment for EIT DevOps RG##################################

module "role_assignment_Devops01" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"
  role_definition_name = var.role_definition_devOps_name01
  principal_id         = data.azurerm_key_vault_secret.eitdevopsprincipalid.value
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.EITDevopsAppRgName}"
}

module "role_assignment_Devops02" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"
  role_definition_name = var.role_definition_devOps_name01
  principal_id         = data.azurerm_key_vault_secret.eitdevopsprincipalid.value
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.EITDevopsPackerRgName}"
}
module "role_assignment_Devops03" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"
  role_definition_name = var.role_definition_devOps_name01
  principal_id         = data.azurerm_key_vault_secret.eitdevopsprincipalid.value
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.EITDevopsctrlplaneRgName}"
}

######################## AD Security Group Creation ####################

module "AD_group_creation_03" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-ad-security-group-and-memberships-env-init?ref=v1.1.19"

  display_name     = var.ad_group_03_name
  description      = var.ad_group_03_description
  owners           = var.ad_group_03_owners
  members          = var.ad_group_03_members
  security_enabled = true
}

############################ Custom and builtin Role Assignment ##################################

module "role_assignment_03" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-rbac-assignment-env-init?ref=v1.1.19"

  role_definition_name = var.role_definition_name03
  principal_id         = module.AD_group_creation_03.id
  scope                = "/subscriptions/${data.azurerm_subscription.current.subscription_id}/resourceGroups/${var.roleassignmetscope03}"
}
