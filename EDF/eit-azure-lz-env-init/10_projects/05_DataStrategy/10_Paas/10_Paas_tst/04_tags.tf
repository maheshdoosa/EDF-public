
module "MDWHs-Tst-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment
}

########### Storage Account tags ###############
module "MDWHs-Tst-vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment

  tags = {
    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Diagnostic Storage"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############### Recovery Service  Vault tags ################
module "MDWHs-Tst-RSVTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment
  tags = {

    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "Backup Recovery services vault"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############### KV tags ################

module "MDWHs-Tst-KVTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment
  tags = {
    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Disk encryption KV"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

module "MDWHs-Tst-DNSTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Tst-environment
  tags = {

    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "Private DNS Zone"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############ AVM Storage Account #######################

module "avmsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "AVM Storage Account"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}
module "avmsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "AVM Storage Account"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}
