module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance",
    "Category" : "Infrastructure",
    "Cost Centre" : "6C040714",
    "Major Function" : "Enterprise IT",
    "Owner" : "cloudservices@edfenergy.com",
    "Project Code" : "TBC",
    "Role" : "Secrets",
    "Service" : "Key Vault",
    "Service Level" : "Gold",
    "Support" : "Cloud Services Azure TSI",
  }
}
