# Module to create the Databricks metastore.
module "metastore_creation" {
  source           = "../../Modules/databricks/databricks-metastore-creation"
  metastore_name   = var.metastore_region
  metastore_region = var.metastore_region
}
