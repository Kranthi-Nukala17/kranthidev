terraform {
  backend "azurerm" {
    resource_group_name  = "aksdevrg"
    storage_account_name = "aksdevstg0012504"
    container_name       = "tfstate"
    key                  = "storage.terraform.tfstate"
    # Authenticate using the ARM_* service-principal environment variables.
    use_azuread_auth = true
  }
}
