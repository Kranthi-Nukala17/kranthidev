# kranthidev
creating Dev for pipelines
## Azure Storage Account Terraform

1. Set a globally unique `storage_account_name` in `terraform.tfvars` and commit the file so GitHub Actions can read it.
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

Terraform state is configured in `backend.tf` and stored in the `tfstate` container of the existing `tdssto` storage account. The pipeline creates the container on a push to `main` when it does not already exist.

The workflow reads the service-principal fields from `AZURE_CREDENTIALS` and passes them directly to Terraform. The service principal needs `Contributor` to create the managed resources and `Storage Blob Data Contributor` on `tdssto`.
