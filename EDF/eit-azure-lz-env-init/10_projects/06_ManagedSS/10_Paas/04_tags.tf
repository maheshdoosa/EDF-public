module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
}

module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Generation"
    "Major Function" = "Nuclear Operations"
    "Cost Centre"    = "8BSB"
    "Project Code"   = "TBD"
    "Environment"    = "Standard Secured Managed"
    "Category"       = "Infrastructure"
    "Role"           = "Backup Vault"
    "Service"        = "Backup"
    "Service Level"  = "Gold"
    "Owner"          = "CloudServices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}

module "AdeKVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Key Vault"
    "Role" : "Disk Encryption Vault"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }

}


module "AvmKVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Nuclear Operations"
    "Cost Centre" : "8BSB"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Key Vault"
    "Role" : "AVM KeyVault"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
