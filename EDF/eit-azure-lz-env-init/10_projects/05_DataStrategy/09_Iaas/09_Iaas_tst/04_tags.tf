module "MDWHs-Tst-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment

  tags = {

    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "App Server"
    "Service Level" : "Bronze"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}



module "MDWHs-Tst-AppVM-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment

  tags = {

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
    "UpdateWindow" : "TST-CYCLE-1"
  }
}

module "MDWHs-Dev-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Dev-environment

  tags = {

    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Rg"
    "Service Level" : "Bronze"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}



module "MDWHs-DevVM01-Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Dev-environment

  tags = {

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
    "UpdateWindow" : "TST-CYCLE-1"
  }
}
