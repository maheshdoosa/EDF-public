locals {
  _policyinit       = { for policy in var.policies_initiative : policy.initiativeName => policy }
  policyinitiative  = { for initiative in keys(local._policyinit) : initiative => local._policyinit[initiative] }
  _policyassignment = { for policy in var.policies_assignment : policy.mgpolicyassignment => policy }
  policyassignment  = { for assignment in keys(local._policyassignment) : assignment => local._policyassignment[assignment] }
}
