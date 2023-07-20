terraform {
  backend "azurerm" {}
}
provider "azurerm" {
  features {}
  subscription_id            = var.tfvars.subscription_id
  tenant_id                  = var.tfvars.tenant_id
  skip_provider_registration = true
}
module "core_module" {
  source                = "./../modules/core_module"
  for_each              = var.region
  region                = each.value
  tfvars                = var.tfvars
}