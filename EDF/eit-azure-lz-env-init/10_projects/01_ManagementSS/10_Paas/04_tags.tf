module "resourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment
}

module "vmDiagSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "subAuditLogsSATags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "recoveryServiceVaultTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Finance"
    "Major Function" = "Enterprise IT"
    "Cost Centre"    = "TABB Project"
    "Project Code"   = "6C040714"
    "Environment"    = "Standard Secured Management"
    "Category"       = "Infrastructure"
    "Role"           = "Log Analytics"
    "Service"        = "Backup"
    "Service Level"  = "Live"
    "Owner"          = "CloudServices@edfenergy.com"
    "Support"        = "Cloud Services Azure TSI"
  }
}

######## AFS data sources secrets ################

module "AFSSa01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TAB"
    "Project Code" : "6C040714"
    "Environment" : "Standard Secured Managed"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "NSG"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"

  }
}

module "AFSSaSync01Tags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "TAB"
    "Project Code" : "6C040714"
    "Environment" : "Standard Secured Managed"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Azure File Sync"

  }

}

############### key vault tags ################
module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Key Vault"
    "Role" : "NTC KV"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }

}

module "AdeKVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = "Standard Secured Managed"

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Key Vault"
    "Role" : "Ade KV"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }

}


module "AvmKVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit"  = "Finance"
    "Major Function" = "Enterprise IT"
    "Cost Centre"    = "TABB Project"
    "Project Code"   = "6C040714"
    "Environment"    = "Standard Secured Management"
    "Category"       = "Infrastructure"
    "Role"           = "Secrets"
    "Service"        = "Key Vault"
    "Service Level"  = "Bronze"
    "Owner"          = "CloudServices@edfenergy.com"
    "Support"        = "CloudServices@edfenergy.com"
  }
}

module "mgmtavmsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "mgmtavmsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "mgmtntcsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}
module "mgmtntcsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "mgmtauxsaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"


  }
}

module "mgmtauxsaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "mgmtclisaresourceGroupTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}

module "mgmtclisaTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Storage"
    "Role" : "Storage Account"
    "Service Level" : "Gold"
    "Owner" : "TBC"
    "Support" : "TBC"
  }
}


module "vmimageTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance"
    "Major Function" : "Enterprise IT"
    "Cost Centre" : "6C040714"
    "Project Code" : "TBC"
    "Category" : "Infrastructure"
    "Service" : "Networking"
    "Role" : "NSG"
    "Service Level" : "Live"
    "Owner" : "cloudservices@edfenergy.com"
    "Support" : "Cloud Services Azure TSI"
  }
}
