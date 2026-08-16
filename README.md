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

The configuration creates a resource group and a secure Azure Storage Account with HTTPS-only traffic, TLS 1.2 minimum, and public blob access disabled.

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

The service principal needs the `Contributor` role on the subscription (or the target resource group).

> This simplified sample uses Terraform's local state, which a GitHub-hosted runner does not preserve between runs. Use it for a first demonstration only; add an Azure remote-state backend before managing resources repeatedly.
