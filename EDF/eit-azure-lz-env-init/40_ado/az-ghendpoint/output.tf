output "ghConnectionsMappings" {
  value = [
    for projectName, ghConId in zipmap(
      sort(var.adoProjects),
    sort(values(azuredevops_serviceendpoint_github.azGhEndpoint)[*]["id"])) :
    { "projectName" = projectName, "ghConId" = ghConId }
    //map("projectName", projectName, "ghConId", ghConId)
  ]
}
