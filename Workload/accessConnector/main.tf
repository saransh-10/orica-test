locals {
  
  storage_resource_id = "/subscriptions/959c9715-ad9d-4e9f-9cad-897421593049/resourceGroups/orica-transit-net-rg-01/providers/Microsoft.Storage/storageAccounts/oricatransitdls2"

}

# ......................................................
# Module: Azure Databricks Access Connector
# ......................................................
module "databricksAccessConnector" {
  source                        = "../../Modules/databricks/databricksAccessConnector"
  databricksAccessConnectorName = "${var.org_name}-${var.bu_name}-dbwaccbg"
  location                      = data.azurerm_resource_group.RG.location
  rgName                        = data.azurerm_resource_group.RG.name
  tags                          = var.tags
  storage_account_id            = local.storage_resource_id
  role_definition_name          = var.role_definition_name
}

