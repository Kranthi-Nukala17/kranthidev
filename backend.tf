terraform {
  backend "azurerm" {
    resource_group_name  = "aksdevrg"
    storage_account_name = "tdssto" # Must be globally unique.
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
    use_cli              = true
    use_azuread_auth     = true
  }
}
