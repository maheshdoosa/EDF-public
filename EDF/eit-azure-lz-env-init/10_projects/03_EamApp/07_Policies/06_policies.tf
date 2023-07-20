#creation of custom policy Centralized Azure DNS Private Zone

module "Policy_definition_creation" {
  source                = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-definition?ref=v1.1.19"
  for_each              = local.dnspolicy
  policyname            = each.key
  policy_type           = each.value.policy_type
  policymode            = each.value.policymode
  display_name          = each.value.display_name
  description           = each.value.description
  metadata              = each.value.metadata
  policy_rule           = each.value.policy_rule
  management_group_name = each.value.management_group_name
}

module "Policy_Initiative_creation" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative?ref=v1.1.19"
  for_each                    = local.dnspolicyinitiative
  policysetDefinitionCategory = each.value.policysetDefinitionCategory
  initiativeName              = each.key
  policyType                  = each.value.policyType
  initiativeDisplayName       = each.value.initiativeDisplayName
  initiativeDescription       = each.value.initiativeDescription
  listOfPolicies              = each.value.listOfPolicies
  managementGroupId           = each.value.management_group_name

  depends_on = [module.Policy_definition_creation]
}

#policy initiative assign to MGs

module "AssignPolicy" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-mg-assignment?ref=v1.1.19"
  for_each             = local.dnspolicyassignment
  mgpolicyassignment   = each.key
  management_group_id  = each.value.management_group_id
  policy_definition_id = each.value.policy_definition_id
  description          = each.value.description
  display_name         = each.value.display_name
  location             = each.value.location
  category             = each.value.category
  enforce              = each.value.enforce
  not_scopes           = each.value.not_scopes
  identity             = each.value.identity

  depends_on = [module.Policy_Initiative_creation]
}
