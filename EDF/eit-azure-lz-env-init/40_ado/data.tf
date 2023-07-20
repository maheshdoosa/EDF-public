data "azurerm_key_vault" "kv" {
  name                = var.kvname
  resource_group_name = var.kvrg
}

data "azurerm_key_vault_secret" "kvsecretadopat" {
  name         = "target-ado-pat"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azurerm_key_vault_secret" "kvsecretghpat" {
  name         = "target-gh-pat"
  key_vault_id = data.azurerm_key_vault.kv.id
}

data "azuredevops_project" "adoProjectsData" {
  for_each = var.adoProjects

  project_name = each.value.adoProjectName

  depends_on = [
    azuredevops_project.adoProject
  ]
}

data "azurerm_key_vault_secret" "adoArmEndpointsSpIdSecrets" {
  for_each = var.adoArmEndpoints

  key_vault_id = data.azurerm_key_vault.kv.id
  name         = each.value.azServicePrincipalId

}

data "azurerm_key_vault_secret" "adoArmEndpointsSpKeySecrets" {
  for_each = var.adoArmEndpoints

  key_vault_id = data.azurerm_key_vault.kv.id
  name         = each.value.azServicePrincipalKey

}

data "azurerm_key_vault_secret" "adoArmEndpointsSpnTenantIdSecrets" {
  for_each = var.adoArmEndpoints

  key_vault_id = data.azurerm_key_vault.kv.id
  name         = each.value.azSpnTenantId

}

data "azurerm_key_vault_secret" "adoArmEndpointsSpnSubIdSecrets" {
  for_each = var.adoArmEndpoints

  key_vault_id = data.azurerm_key_vault.kv.id
  name         = each.value.azSpnSubscriptionId

}

data "azurerm_key_vault_secret" "adoArmEndpointsSpnSubNameSecrets" {
  for_each = var.adoArmEndpoints

  key_vault_id = data.azurerm_key_vault.kv.id
  name         = each.value.azSpnSubscriptionName

}

data "azurerm_key_vault_secret" "adoGhEndpointPatSecrets" {
  for_each = var.adoGhEndpoints

  key_vault_id = data.azurerm_key_vault.kv.id
  name         = each.value.ghPat
}
