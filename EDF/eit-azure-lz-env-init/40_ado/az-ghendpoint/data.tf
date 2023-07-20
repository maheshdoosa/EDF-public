data "azuredevops_project" "adoProjectsData" {
  for_each = toset(var.adoProjects)

  project_name = each.value
}
