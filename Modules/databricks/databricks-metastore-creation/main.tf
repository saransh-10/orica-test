terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.50.0"
    }
  }
}
resource "databricks_metastore" "metastore-creation" {
  name          = var.metastore_name
  # owner         = var.metastore_owner
  region        = var.metastore_region
  lifecycle {
    prevent_destroy = true
  }
}


