# ......................................................
# Creating New Resource Group
# ......................................................
module "RG" {
  source                  = "../../Modules/rg"
  resource_group_name     = local.resource_group_name
  resource_group_location = local.rg_location
}

# ......................................................
# Creating ADLSGen2 for tfstate 
# ......................................................
module "ADLSGen2" {
  source               = "../../Modules/adls/storageAccount"
  resource_group_name  = local.resource_group_name
  location             = local.rg_location
  storage_account_name = local.storage_account_name
  storage_identity_id  = ["SystemAssigned"]
  network_rule         = var.network_access_adls
  depends_on           = [module.RG]
}

# ......................................................
# Creating Container for tfstate backup
# ......................................................
module "container_tfstate" {
  source                 = "../../Modules/adls/container"
  storage_account_name   = local.storage_account_name
  storage_container_name = local.storage_container_tfstate_name
  container_access_type  = var.container_access_type
  depends_on             = [module.ADLSGen2]
}

# ......................................................
# Creating Container for metastore
# ......................................................
module "container_metastore" {
  source                 = "../../Modules/adls/container"
  storage_account_name   = local.storage_account_name
  storage_container_name = local.storage_container_metastore_name
  container_access_type  = var.container_access_type
  depends_on             = [module.ADLSGen2]
}
