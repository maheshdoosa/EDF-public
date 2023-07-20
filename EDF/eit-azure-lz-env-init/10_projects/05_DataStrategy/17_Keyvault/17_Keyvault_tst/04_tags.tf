module "KVTags" {
  source      = "git::ssh://git@github.com/edfenergy/eit-azure-terraform-modules.git//azure-tags?ref=v1.0.0"
  environment = var.environment

  tags = {
    "Business Unit" : "Generation",
    "Category" : "Infrastructure",
    "Cost Centre" : "2-E292",
    "Major Function" : "Nuclear Operations",
    "Owner" : "steve.2.mchugh@edf-energy.com",
    "Project Code" : "2-E292-A0-MA-01-AAE",
    "Role" : "Secrets",
    "Service" : "Key Vault",
    "Service Level" : "Bronze",
    "Support" : "Avanade",
  }
}
