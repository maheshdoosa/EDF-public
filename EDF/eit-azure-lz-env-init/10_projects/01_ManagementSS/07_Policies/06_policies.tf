# #creation of storage access policy

module "Policy_Initiative_creation" {
  source                      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-initiative"
  for_each                    = local.policyinitiative
  policysetDefinitionCategory = each.value.policysetDefinitionCategory
  initiativeName              = each.key
  policyType                  = each.value.policyType
  initiativeDisplayName       = each.value.initiativeDisplayName
  initiativeDescription       = each.value.initiativeDescription
  listOfPolicies              = each.value.listOfPolicies
  managementGroupId           = each.value.management_group_name
}

# #policy initiative assign to MGs

module "AssignPolicy" {
  source               = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy-mg-assignment"
  for_each             = local.policyassignment
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
  depends_on           = [module.Policy_Initiative_creation]
}
