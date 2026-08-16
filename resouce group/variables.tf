# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Resource Group definition
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group will be created"
  type        = string
}