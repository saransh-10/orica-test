# Module to create the Databricks metastore.
module "metastore_creation" {
  count            = var.environment == "transit" ? 1 : 0
  source           = "../../Modules/databricks/databricks-metastore-creation"
  metastore_name   = var.metastore_region
  metastore_region = var.metastore_region
  adls_name        = format("abfss://%s@%s.dfs.core.windows.net/",local.container_name,local.storage_account_name)
  acc_name         = data.terraform_remote_state.metastore_storage.outputs.acc_id
}

# Module to assign the created metastore to the Databricks workspaces.
module "metastore_workspace_assignment" {
  source        = "../../Modules/databricks/databricks-metastore-workspace-assignment"
  metastore_id  = module.metastore_creation[0].metastore_id
  workspace_ids = local.workspace_ids
}