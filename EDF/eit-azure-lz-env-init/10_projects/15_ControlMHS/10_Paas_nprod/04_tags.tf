module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Security Governance"
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" = "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "CNTRLM Services"
    "Role" : "Diagnostics Storage Account"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Security Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" = "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "CNTRLM Services"
    "Role" : "Diagnostics Storage Account"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Security Governance"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" = "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "CNTRLM Services"
    "Role" : "RSV"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = "High Secured Security Governance"
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" = "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "CNTRLM Services"
    "Role" : "Key Vault"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "cntrlmHSRGTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" = "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "CNTRLM Services"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}

module "cntrlmHSsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment
  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "tabb"
    "Project Code" : "6c040714"
    "Environment" = "High Secured Management"
    "Category" : "Infrastructure"
    "Service" : "CNTRLM Services"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
