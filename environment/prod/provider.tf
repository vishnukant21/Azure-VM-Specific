terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.43.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "98473d5b-c639-404e-9bf2-91559fe65ff8"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "vishu-rg"
    storage_account_name = "stgvishnu"
    container_name       = "vishnucnt"
    key                  = "terraform.tfstate"

  }
 }