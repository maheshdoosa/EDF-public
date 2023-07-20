## Secgov Tags

module "Secgovams01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Security Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Environment" : "Standard Secured Security Governance"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    "Role" : "MID Server"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC18"
    "ScheduledShutdown" : "No"
  }
}

module "Secgovamsvm01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Security Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Environment" : "Standard Secured Security Governance"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    "Role" : "MID Server"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-1"
    "ScheduledShutdown" : "No"
  }
}


module "Secgovamsvm02Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Security Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Environment" : "Standard Secured Security Governance"
    "Category" : "Infrastructure"
    "Service" : "SNOW MID Services"
    "Role" : "MID Server"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "PRD-CYCLE-2"
    "ScheduledShutdown" : "No"
  }
}


## Tenable Tags

module "Secgovamstenable01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Security Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Environment" : "Standard Secured Security Governance"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "Tenable Management"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
    "StartupPriority" : "10"
    "UpdateWindow" : "SAT1UTC16"
    "ScheduledShutdown" : "No"
  }
}
