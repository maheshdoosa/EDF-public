provider "azurerm" {
  version = "~>2.0"
  features {}
}
module "core_module" {
  source = "./../modules/core_module"
  region = var.region
  tfvars = var.tfvars
}