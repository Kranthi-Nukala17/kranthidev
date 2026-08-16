terraform {
  backend "azurerm" {
    resource_group_name  = "aksdevrg"
    storage_account_name = "tdssto"
    container_name       = "tfstate"
    key                  = "storage.terraform.tfstate"
    # Authenticate using the ARM_* service-principal environment variables.
    use_azuread_auth = true
  }
}
