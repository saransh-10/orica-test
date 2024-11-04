# Terraform configuration block specifying required providers and backend.
terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.50.0"
    }
  }
}

# Provider configuration for Databricks.
provider "databricks" {
  host                = var.databricks_host_name
  account_id          = var.databricks_account_id
  azure_client_id     = "0e841678-64e3-4abb-8b78-e6b06fb8969f"
  azure_client_secret = "~y48Q~VAo7Of2iFuQTrvzq.69d_9fJIYGBxWVbN-"
  azure_tenant_id     = "b1b6657a-30c8-4e82-9f30-bf5a272aa1c2"
}

