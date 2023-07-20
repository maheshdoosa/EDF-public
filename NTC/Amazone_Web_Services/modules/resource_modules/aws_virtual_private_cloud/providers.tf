terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = var.location

  # You can use access keys
  #access_key = var.aws_access_key
  #secret_key = var.aws_secret_key

  # Or specify an aws profile, instead.
  # profile = "<aws profile>"
}