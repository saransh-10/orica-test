locals {
  storage_account_name             = lower("${var.org_name}${var.bu_name}dls2")
  storage_container_metastore_name = lower("metastore")
  storage_container_ext_name = lower("external")
}
