output "acc_id" {
  value = module.databricksAccessConnector.access_id
  description = "Access Connector Id."
}

output "storage_account_id" {
  value = module.ADLSGen2.storage_account_id
  description = "Storage account Id."
}

output "storage_account_name" {
  value = local.storage_account_name
  description = "Storage account name."
}

output "storage_container_name" {
  value = local.storage_container_metastore_name
  description = "Storage Container name."
}

output "storage_container_name_ext" {
  value = local.storage_container_ext_name
  description = "Storage Container name for external location."
}