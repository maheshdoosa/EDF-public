module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "DevOps"
    "Role" : "Build Server"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
  }
}

module "HSvmssTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "High Secured Management"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "DevOps"
    "Role" : "Build Server"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
  }
}
