module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags"
  environment = var.environment

  tags = {
    "Business Unit" : "Finance",
    "Category" : "Infrastructure",
    "Cost Centre" : "6C040714",
    "Major Function" : "Enterprise IT",
    "Owner" : "TBC",
    "Project Code" : "TBC",
    "Role" : "Secrets",
    "Service" : "Key Vault",
    "Service Level" : "Gold",
    "Support" : "TBC",
  }
}
