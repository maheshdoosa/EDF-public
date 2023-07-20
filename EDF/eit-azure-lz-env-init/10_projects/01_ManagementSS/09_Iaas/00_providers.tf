provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you are using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}
# terraform {
#   required_providers {
#     azurerm = "~> 2.0"
#     #    features {}
#   }
# }

provider "template" {
  version = "~> 2.1.2"
}

# terraform {
#   required_providers {
#     template = "~> 2.1.2"
#     #    features {}
#   }
# }

provider "tls" {
  version = "~> 2.1.1"
}

# terraform {
#   required_providers {
#     tls = "~> 2.1.1"
#     #    features {}
#   }
# }




//have to use remote state due to tf task
terraform {
  backend "azurerm" {}
}
