############ PROD Tags  #########################
module "MDWHs-Prd-resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment
}

########### PROD Storage Account tags ###############
module "MDWHs-Prd-vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

  tags = {
    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Diagnostic Storage Account"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############### Prod Recovery Service  Vault tags ################
module "MDWHs-Prd-RSVTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

  tags = {

    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Backup Recovery Vault"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############### Prod KV tags ################

module "MDWHs-Prd-KVTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

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

module "MDWHs-Prd-DNSTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Prd-environment

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
############ UAT Tags ###########################

########### UAT Storage Account tags ###############
module "MDWHs-Uat-vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

  tags = {
    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Diagnostic Storage Account"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############### UAT Recovery Service  Vault tags ################
module "MDWHs-Uat-RSVTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

  tags = {

    "Environment" : "High Secured MDW"
    "Business Unit" : "Generation"
    "Major Function" : "Data Strategy"
    "Cost Centre" : "2-E292-A0-MA-01-AAE"
    "Project Code" : "2-E292"
    "Category" : "Infrastructure"
    "Service" : "MDW"
    "Role" : "VM Backup Recovery Vault"
    "Service Level" : "Gold"
    "Owner" : "gordon.steven@edf-energy.com"
    "Support" : "cloudservices@edfenergy.com"
  }
}

############### UAT KV tags ################

module "MDWHs-Uat-KVTags" {

  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.MDWHs-Uat-environment

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
