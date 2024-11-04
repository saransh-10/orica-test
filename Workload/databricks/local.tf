locals {

  db_name             = "${var.org_name}-${var.bu_name}-dbwbg"
  storage_resource_id = "/subscriptions/959c9715-ad9d-4e9f-9cad-897421593049/resourceGroups/orica-transit-net-rg-01/providers/Microsoft.Storage/storageAccounts/oricatransitdls2"
  TargetSubresource = {
    adlsGen2BlobPeSubresourceNames = ["blob"]
    adlsGen2DfsPeSubresourceNames  = ["dfs"]
    dbbrowsAuthPeSubresourceNames  = ["browser_authentication"]
    dbUiApiPeSubresourceNames      = ["databricks_ui_api"]
  }
}
