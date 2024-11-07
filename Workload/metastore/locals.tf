# Local variables to hold metastore name and workspace.
locals {
  metastore_name = var.metastore_region
  workspace_ids  = [for workspace in var.workspaces : workspace.id]
  container_name = data.terraform_remote_state.metastore_storage.outputs.storage_container_name
  storage_account_name = data.terraform_remote_state.metastore_storage.outputs.storage_account_name
}