module "createArmServiceEndPointForNewSubscription" {
  source = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//ado-armServiceEndPoint"

  projectId        = data.azuredevops_project.adoBootStrapProject.id
  endpointName     = "lz-az-newEndPoint" //this should be parameterised - naming convention to be thought through
  spId             = data.azurerm_key_vault_secret.azlzstagingSPIdSecret.value
  spKey            = data.azurerm_key_vault_secret.azlzstagingSPKeySecret.value
  tenantId         = data.azurerm_key_vault_secret.azlzstagingSpnTenantIdSecret.value
  subscriptionId   = var.newSubscriptionId
  subscriptionName = var.newSubscriptionName
}
