module "MDWHs-Prd-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}


module "MDWHs-Uat-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

module "MDWHs-Prd-WebVM-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "Web Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "30"
    "UpdateWindow" : "PRD-CYCLE-2"
  }
}

module "MDWHs-Prd-AppVM-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "App Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
    "UpdateWindow" : "PRD-CYCLE-2"
  }
}

############### UAT VM Tags #####################

module "MDWHs-Uat-WebVM-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "Web Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "NA"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}

module "MDWHs-Uat-AppVM-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "App Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
    "UpdateWindow" : "PRD-CYCLE-1"
  }
}
module "MDWHs-Uat-AppVM02-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

  tags = {

    #"Environment"       : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "App Server"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
    "ScheduledShutdown" : "No"
    "StartupPriority" : "40"
    "UpdateWindow" : "PRD-CYCLE-2"
  }
}
