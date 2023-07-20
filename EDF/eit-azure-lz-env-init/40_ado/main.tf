resource "azuredevops_project" "adoProject" {
  for_each = var.adoProjects

  project_name = each.value.adoProjectName
  description  = each.value.adoProjectDescription
}

resource "azuredevops_serviceendpoint_azurerm" "azArmEndpoint" {
  for_each = var.adoArmEndpoints

  project_id = [for adoProj in data.azuredevops_project.adoProjectsData : adoProj.id if adoProj.project_name == "${each.value.adoProjectName}"][0]

  service_endpoint_name = each.value.azArmEndpointName

  credentials {
    serviceprincipalid = [for adoArmEndpointsSpIdSecret in data.azurerm_key_vault_secret.adoArmEndpointsSpIdSecrets : adoArmEndpointsSpIdSecret.value if adoArmEndpointsSpIdSecret.name == "${each.value.azServicePrincipalId}"][0]

    serviceprincipalkey = [for adoArmEndpointsSpKeySecret in data.azurerm_key_vault_secret.adoArmEndpointsSpKeySecrets : adoArmEndpointsSpKeySecret.value if adoArmEndpointsSpKeySecret.name == "${each.value.azServicePrincipalKey}"][0]

  }
  azurerm_spn_tenantid      = [for adoArmEndpointsSpnTenantIdSecret in data.azurerm_key_vault_secret.adoArmEndpointsSpnTenantIdSecrets : adoArmEndpointsSpnTenantIdSecret.value if adoArmEndpointsSpnTenantIdSecret.name == "${each.value.azSpnTenantId}"][0]
  azurerm_subscription_id   = [for adoArmEndpointsSpnSubIdSecret in data.azurerm_key_vault_secret.adoArmEndpointsSpnSubIdSecrets : adoArmEndpointsSpnSubIdSecret.value if adoArmEndpointsSpnSubIdSecret.name == "${each.value.azSpnSubscriptionId}"][0]
  azurerm_subscription_name = [for adoArmEndpointsSpnSubNameSecret in data.azurerm_key_vault_secret.adoArmEndpointsSpnSubNameSecrets : adoArmEndpointsSpnSubNameSecret.value if adoArmEndpointsSpnSubNameSecret.name == "${each.value.azSpnSubscriptionName}"][0]
}

resource "null_resource" "setupGhConnection" {
  for_each = var.adoGhPipelines

  provisioner "local-exec" {
    # Call ADO CLI Script here
    #command = "./40_ado/bash/setupGhConnection.sh"
    command = <<EOT
        export AZURE_DEVOPS_EXT_PAT=$adoPat
        #Create GitHub Service Endpoint
        export AZURE_DEVOPS_EXT_GITHUB_PAT=$ghPat
        serviceConnectionId=$(az devops service-endpoint github create --name $ghServiceEndpointName --github-url $ghRepoUrl --organization $adoOrganisation --project $adoProject --query id -o tsv)

        #Create Pipeline in ADO
        az pipelines create --name $adoPipelineName --repository $ghRepoUrl --branch master --service-connection $serviceConnectionId --skip-first-run true --yml-path $pipelineYamlPath --repository-type github  --organization $adoOrganisation --project $adoProject
    EOT

    # We are going to pass in terraform derived values to the script
    environment = {
      adoOrganisation       = var.adoOrganisation
      adoProject            = "${each.value.adoProjectName}"
      ghPat                 = data.azurerm_key_vault_secret.kvsecretghpat.value
      ghServiceEndpointName = "${each.value.serviceConnectionName}"
      ghRepoUrl             = "https://github.com/${each.value.ghOrganisation}/${each.value.adoProjectName}"
      adoPipelineName       = "${each.value.pipelineName}"
      pipelineYamlPath      = "${each.value.ymlPath}"
      adoPat                = data.azurerm_key_vault_secret.kvsecretadopat.value
    }
  }

  depends_on = [azuredevops_project.adoProject]
}

/*

module "createGhServiceConnections" {
  source = "./az-ghendpoint"
  adoProjects = ["eit-azure-lz-base", "eit-azure-lz-adforest"]
  ghServiceEndPointName = var.ghServiceEndPointName
  ghServiceEndPointPat = data.azurerm_key_vault_secret.kvsecretghpat.value
}

output "testMapings" {
  value = module.createGhServiceConnections.ghConnectionsMappings
}


resource "azuredevops_build_definition" "buildDef" {
  for_each = var.adoGhPipelines

  project_id = [for adoProj in data.azuredevops_project.adoProjectsData : adoProj.id if adoProj.project_name == "${each.value.adoProjectName}"][0]
  name       = "${each.value.pipelineName}"

  ci_trigger {
    use_yaml = false
  }

  repository {
    repo_type = "GitHub"
    repo_id     = "${each.value.repoId}"
    yml_path    = "${each.value.ymlPath}"
    service_connection_id = [for ghConnectionsMapping in module.createGhServiceConnections.ghConnectionsMappings : ghConnectionsMapping.ghConId if ghConnectionsMapping.projectName == "${each.value.adoProjectName}"][0]
    //service_connection_id = lookup(module.createGhServiceConnections.ghConnectionsMappings, "${each.value.adoProjectName}")
  }

}*/
