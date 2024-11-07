data "azurerm_resource_group" "RG" {
  name = var.rg_name
}

data "azurerm_storage_account" "adls_gen2" {
  resource_group_name = data.azurerm_resource_group.RG.name
  name                = local.storage_account_name
}

data "azurerm_virtual_network" "existingVnet" {
  name                = var.existingVnetName
  resource_group_name = data.azurerm_resource_group.RG.name
}

data "azurerm_subnet" "peSubnet" {
  name                 = lower("${var.org_name}-${var.bu_name}-snet-pep-01")
  virtual_network_name = var.existingVnetName
  resource_group_name  = data.azurerm_resource_group.RG.name
}

data "azurerm_subnet" "databricksHostSubnet" {
  name                 = lower("${var.org_name}-${var.bu_name}-host-snet-01")
  virtual_network_name = var.existingVnetName
  resource_group_name  = data.azurerm_resource_group.RG.name
}

data "azurerm_subnet" "databricksContainerSubnet" {
  name                 = lower("${var.org_name}-${var.bu_name}-container-snet-01")
  virtual_network_name = var.existingVnetName
  resource_group_name  = data.azurerm_resource_group.RG.name
}

data "azurerm_network_security_group" "hostNsg" {
  name                = lower("${var.org_name}-${var.bu_name}-nsg-host-01")
  resource_group_name = data.azurerm_resource_group.RG.name
}

data "azurerm_network_security_group" "containerNsg" {
  name                = lower("${var.org_name}-${var.bu_name}-nsg-container-01")
  resource_group_name = data.azurerm_resource_group.RG.name
}

data "terraform_remote_state" "private_dns_zone" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Orica-RG"
    storage_account_name = "oricatest2"
    container_name       = "tfstate"
    key                  = "terraform1.tfstate"
    client_id            = "0e841678-64e3-4abb-8b78-e6b06fb8969f"
    client_secret        = "~y48Q~VAo7Of2iFuQTrvzq.69d_9fJIYGBxWVbN-"
    tenant_id            = "b1b6657a-30c8-4e82-9f30-bf5a272aa1c2"
    subscription_id      = "959c9715-ad9d-4e9f-9cad-897421593049"
  }
}
