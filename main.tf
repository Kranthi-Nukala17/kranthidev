terraform {
  required_version = ">= 1.5.0"

  # Backend values are kept in backend.hcl, not Terraform variables.
  backend "azurerm" {}

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


resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  min_tls_version                 = "TLS1_2"
  https_traffic_only_enabled      = true
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = true
  shared_access_key_enabled       = true

  tags = var.tags
}
