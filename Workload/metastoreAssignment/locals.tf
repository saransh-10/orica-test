# Local variables to hold metastore name and workspace.
locals {
  metastore_name = var.metastore_region
  workspace_ids  = [for workspace in var.workspaces : workspace.id]
}