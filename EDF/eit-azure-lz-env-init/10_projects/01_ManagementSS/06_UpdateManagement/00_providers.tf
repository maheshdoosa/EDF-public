# provider "azurerm" {
#   # The "feature" block is required for AzureRM provider 2.x.
#   # If you are using version 1.x, the "features" block is not allowed.

#   features {}
# }



//have to use remote state due to tf task
terraform {
  backend "azurerm" {}
}
