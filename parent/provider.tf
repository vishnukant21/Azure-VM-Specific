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
  subscription_id = "cb6ad14b-2a8b-4523-bb01-e95631dd6fe6"
}
