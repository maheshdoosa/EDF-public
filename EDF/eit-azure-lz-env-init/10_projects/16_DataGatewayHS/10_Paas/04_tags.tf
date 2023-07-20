module "backupresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation"
    "Major Function" : "Generation Operations"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Backup"
    "Role" : "Backup Vault"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit"  = "Generation"
    "Major Function" = "Generation Operations"
    "Cost Centre"    = "TBC"
    "Project Code"   = "TBC"
    "Category"       = "Infrastructure"
    "Role"           = "Backup Vault"
    "Service"        = "Backup"
    "Service Level"  = "Gold"
    "Owner"          = "cloudservices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}
