resource_group_name  = "aksdevrg"
location             = "North Europe"
storage_account_name = "stkranthidev1234567" # Must be globally unique.

account_tier             = "Standard"
account_replication_type = "LRS"

tags = {
  environment = "dev"
  managed_by  = "terraform"
}
