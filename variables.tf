variable "resource_group_name" {
  description = "Name of the existing Azure resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "Azure region for the resource group and storage account."
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Globally unique storage account name (3-24 lowercase letters and numbers)."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "storage_account_name must be 3-24 lowercase letters or numbers."
  }
}

variable "account_tier" {
  description = "Storage account performance tier."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be Standard or Premium."
  }
}

variable "account_replication_type" {
  description = "Storage redundancy option, such as LRS, GRS, RAGRS, ZRS, GZRS, or RAGZRS."
  type        = string
  default     = "LRS"
}

variable "tags" {
  description = "Tags to apply to Azure resources."
  type        = map(string)
  default     = {}
}
