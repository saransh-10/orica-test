terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

provider "azurerm" {
  client_id       = "0e841678-64e3-4abb-8b78-e6b06fb8969f"
  client_secret   = "~y48Q~VAo7Of2iFuQTrvzq.69d_9fJIYGBxWVbN-"
  tenant_id       = "b1b6657a-30c8-4e82-9f30-bf5a272aa1c2"
  subscription_id = "959c9715-ad9d-4e9f-9cad-897421593049"
  features {}
}