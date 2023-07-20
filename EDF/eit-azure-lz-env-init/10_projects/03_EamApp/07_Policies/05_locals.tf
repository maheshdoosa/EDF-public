locals {
  _dnspolicy           = { for policy in var.dns_policies : policy.policyname => policy }
  dnspolicy            = { for dns in keys(local._dnspolicy) : dns => local._dnspolicy[dns] }
  _dnspolicyinit       = { for policy in var.dns_policies_initiative : policy.initiativeName => policy }
  dnspolicyinitiative  = { for initiative in keys(local._dnspolicyinit) : initiative => local._dnspolicyinit[initiative] }
  _dnspolicyassignment = { for policy in var.dns_policies_assignment : policy.mgpolicyassignment => policy }
  dnspolicyassignment  = { for assignment in keys(local._dnspolicyassignment) : assignment => local._dnspolicyassignment[assignment] }
}
