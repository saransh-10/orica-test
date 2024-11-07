locals {
  storage_account_name = lower("${var.org_name}${var.bu_name}dls2")
  db_name              = "${var.org_name}-${var.bu_name}-dbwbg"
  TargetSubresource = {
    adlsGen2BlobPeSubresourceNames = ["blob"]
    adlsGen2DfsPeSubresourceNames  = ["dfs"]
    dbbrowsAuthPeSubresourceNames  = ["browser_authentication"]
    dbUiApiPeSubresourceNames      = ["databricks_ui_api"]
  }
}
