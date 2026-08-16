# kranthidev
creating Dev for pipelines
## Azure Storage Account Terraform

1. Copy `terraform.tfvars.example` to `terraform.tfvars`, set a globally unique `storage_account_name`, and commit the file so GitHub Actions can read it.
2. Authenticate to Azure, for example: `az login`.
3. Run:

   ```powershell
   terraform init
   terraform plan
   terraform apply
   ```

The configuration creates a secure Azure Storage Account in your existing resource group, with HTTPS-only traffic, TLS 1.2 minimum, and public blob access disabled.

## GitHub Actions pipeline

The workflow in `.github/workflows/terraform.yml` validates and plans infrastructure on pull requests, then applies the saved plan after a push to `main`.

Configure one GitHub repository **secret** named `AZURE_CREDENTIALS` with your Azure service principal JSON:

```json
{
  "clientId": "<application-client-id>",
  "clientSecret": "<client-secret>",
  "subscriptionId": "<subscription-id>",
  "tenantId": "<tenant-id>"
}
```

Before the first workflow run, update `backend.hcl` with a globally unique state storage account name, then create that storage account and its `tfstate` blob container. For example:

```powershell
az storage account create --name <unique-state-account-name> --resource-group aksdevrg --location "North Europe" --sku Standard_LRS --kind StorageV2 --allow-blob-public-access false --min-tls-version TLS1_2
az storage container create --name tfstate --account-name <unique-state-account-name> --auth-mode login
```

The workflow reads the service-principal fields from `AZURE_CREDENTIALS` and passes them directly to Terraform. The service principal needs `Contributor` to create the managed resources and `Storage Blob Data Contributor` on the state storage account. The backend configuration contains no secrets and is committed so the pipeline can use it.

Terraform state is then stored in the `tfstate` container in Azure Blob Storage.
