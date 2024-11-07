# ......................................................
# Creating ADLSGen2 for metastore 
# ......................................................
module "ADLSGen2" {
  source               = "../../Modules/adls/storageAccount"
  resource_group_name  = data.azurerm_resource_group.RG.name
  location             = data.azurerm_resource_group.RG.location
  storage_account_name = local.storage_account_name
  storage_identity_id  = ["SystemAssigned"]
  network_rule         = var.network_access_adls
}

# ......................................................
# Creating Container for metastore
# ......................................................
module "container_metastore" {
  count                  = var.environment == "transit" ? 1 : 0
  source                 = "../../Modules/adls/container"
  storage_account_name   = local.storage_account_name
  storage_container_name = local.storage_container_metastore_name
  container_access_type  = var.container_access_type
  depends_on             = [module.ADLSGen2]
}

# ......................................................
# Creating Container for external Location
# ......................................................
module "container_external_location" {
  count                  = var.environment == "transit" ? 0 : 1
  source                 = "../../Modules/adls/container"
  storage_account_name   = local.storage_account_name
  storage_container_name = local.storage_container_ext_name
  container_access_type  = var.container_access_type
  depends_on             = [module.ADLSGen2]
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
  storage_account_id            = module.ADLSGen2.storage_account_id
  role_definition_name          = var.role_definition_name
  depends_on                    = [module.ADLSGen2]
}


