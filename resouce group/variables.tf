# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Resource Group definition
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
