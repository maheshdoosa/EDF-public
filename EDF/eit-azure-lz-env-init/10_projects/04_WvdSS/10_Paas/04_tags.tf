module "resourceGrouplogsTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "TBC"
    "Major Function" : "TBC"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "RG"
    "Service Level" : "Bronze"
    "Owner" : "TBC"
    "Support" : "Avanade"
  }
}

module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "TBC"
    "Major Function" : "TBC"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "WVD Services"
    "Role" : "Diagnostics Storage Account"
    "Service Level" : "Bronze"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "ADEKVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "TBC"
    "Major Function" : "TBC"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "WVD Services"
    "Role" : "Key Vault Disk Encryption"
    "Service Level" : "Bronze"
    "Owner" : "TBC"
    "Support" : "Avanade"
  }
}

module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "TBC"
    "Major Function" : "TBC"
    "Cost Centre" : "TBC"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "WVD Services"
    "Role" : "Key Vault Disk Encryption"
    "Service Level" : "Bronze"
    "Owner" : "TBC"
    "Support" : "Avanade"
  }
}
