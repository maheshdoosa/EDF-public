resource "azuredevops_serviceendpoint_github" "azGhEndpoint" {
  for_each = toset(var.adoProjects)

  project_id            = [for adoProj in data.azuredevops_project.adoProjectsData : adoProj.id if adoProj.project_name == "${each.value}"][0]
  service_endpoint_name = var.ghServiceEndPointName

  auth_personal {
    personal_access_token = var.ghServiceEndPointPat
  }
}

/*
resource "azuredevops_serviceendpoint_github" "azGhEndpoint" {
  for_each = var.adoGhEndpoints

  project_id            = [for adoProj in data.azuredevops_project.adoProjectsData : adoProj.id if adoProj.project_name == "${each.value.adoProjectName}"][0]
  service_endpoint_name = "${each.value.azGhEndpointName}"

  auth_personal {
    personal_access_token = [for adoGhEndpointPatSecret in data.azurerm_key_vault_secret.adoGhEndpointPatSecrets : adoGhEndpointPatSecret.value if adoGhEndpointPatSecret.name == "${each.value.ghPat}"][0]
  }
}*/
