module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
}

module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Customer"
    "Major Function" = "Customer Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Environment"    = "Standard Secured Managed"
    "Category"       = "Infrastructure"
    "Role"           = "Backup Vault"
    "Service"        = "Backup"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}

module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Customer"
    "Major Function" = "Customer Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Environment"    = "Standard Secured Managed"
    "Category"       = "Infrastructure"
    "Role"           = "Storage Account"
    "Service"        = "Storage"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TS"
  }
}



############### key vault tags ################
module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Customer"
    "Major Function" = "Customer Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Environment"    = "Standard Secured Managed"
    "Category"       = "Infrastructure"
    "Role"           = "Azure Disk Encryption"
    "Service"        = "Key Vault"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}


module "cusauxRGTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Customer"
    "Major Function" = "Customer Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Environment"    = "Standard Secured Managed"
    "Category"       = "Infrastructure"
    "Role"           = "Storage Account"
    "Service"        = "Storage"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TS"
  }
}


module "cusauxsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Customer"
    "Major Function" = "Customer Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Environment"    = "Standard Secured Managed"
    "Category"       = "Infrastructure"
    "Role"           = "Storage Account"
    "Service"        = "Storage"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TS"
  }
}
