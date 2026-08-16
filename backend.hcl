# Terraform state is stored separately from the storage account managed by main.tf.
# Change storage_account_name to a globally unique name before the first run.
resource_group_name  = "aksdevrg"
storage_account_name = "tfstatekranthidev123456"
container_name       = "tfstate"
key                  = "storage-account.tfstate"

# Uses the service principal authenticated by GitHub Actions.
use_azuread_auth = true
