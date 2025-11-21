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
  subscription_id = "95a90f4b-7e15-47ba-95ab-0d52bac078e4"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "vishnu_rg"
    storage_account_name = "vishnustg321"
    container_name       = "vishnucnt321"
    key                  = "terraform.tfstate"

  }
 }