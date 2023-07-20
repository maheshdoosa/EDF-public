module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
}

module "adVmTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Management"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Directory Services"
    "Role" : "Domain Controller"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
  }
}

module "adVm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Management"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Directory Services"
    "Role" : "Domain Controller"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
    "UpdateWindow" : "PRD-CYCLE-2"
  }
}

module "adVm02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Management"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TABB Project"
    "Project Code" : "6C040714"
    "Category" : "Infrastructure"
    "Service" : "Directory Services"
    "Role" : "Domain Controller"
    "Service Level" : "Live"
    "Owner" : "CloudServices@edfenergy.com"
    "Support" : "CloudServices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}
