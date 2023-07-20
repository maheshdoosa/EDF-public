module "assignAllowedLocationPolicyAtSubscription" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-policy"

  policyAssignmentName        = "allowedLocationAtSubscriptionScope"
  scopeId                     = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  policyDefinitionId          = data.azurerm_policy_definition.allowedLocationPolicy.id
  policyAssignmentDescription = "Allowed Regions-Scope Subscription"
  policyAssignmentDisplayName = "Allowed Regions-Scope Subscription"

  templateParam1 = var.allowedLocation1
  templateParam2 = var.allowedLocation2
  templateParam3 = var.allowedLocation3

  templateFile = "listOfAllowedLocations.tpl"
}
