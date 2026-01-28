terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.56.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "2af63522-f4cf-47c6-a535-08dbd21adcad"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "vishu-rg"
    storage_account_name = "sstgvishnu"
    container_name       = "vishnucnt"
    key                  = "terraform.tfstate"

  }
 }