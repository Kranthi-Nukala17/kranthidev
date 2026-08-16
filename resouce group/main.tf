terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "21dc9d4e-91d5-4da3-b1d1-b08a3b35e94c"
  features {}
}

# Variables for Resource Group
#variable "resource_group_name" {
# description = "The name of the resource group"
#  type        = string
#  default     = "example-resource-group"
# }

# variable "location" {
#  description = "The Azure region where the resource group will be created"
#  type        = string
#  default     = "East US"
#c}

# Resource Group definition
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}
