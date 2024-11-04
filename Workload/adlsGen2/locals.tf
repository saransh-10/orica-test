locals {
  resource_group_name              = lower("${var.org_name}-${var.bu_name}-net-rg-01")
  storage_account_name             = lower("${var.org_name}${var.bu_name}dls2")
  rg_location                      = lower("australiacentral")
  storage_container_tfstate_name   = lower("tfstate")
  storage_container_metastore_name = lower("metastore")
}
