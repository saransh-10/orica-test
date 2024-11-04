# Module to assign the created metastore to the Databricks workspaces.
module "metastore_workspace_assignment" {
  source        = "../../Modules/databricks/databricks-metastore-workspace-assignment"
  metastore_id  = data.terraform_remote_state.metastore.outputs.metastore_id
  workspace_ids = local.workspace_ids
}
