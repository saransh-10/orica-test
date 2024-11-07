# ......................................................
# Module: Azure Databricks Workspace
# ......................................................
module "databricksWorkspace" {
  source                      = "../../Modules/databricks/databricksWorkspace"
  databricksName              = local.db_name
  resourceGroupName           = data.azurerm_resource_group.RG.name
  location                    = data.azurerm_resource_group.RG.location
  databricksNoPublicIp        = true
  databricksPrivateNSGId      = data.azurerm_network_security_group.containerNsg.id
  databricksPrivateSubnetName = data.azurerm_subnet.databricksContainerSubnet.name
  databricksPublicNSGId       = data.azurerm_network_security_group.hostNsg.id
  databricksPublicSubnetName  = data.azurerm_subnet.databricksHostSubnet.name
  databricksVnetId            = data.azurerm_virtual_network.existingVnet.id
  databricksSku               = var.databricksWorkspace.sku
  publicNetworkAccessEnabled  = var.publicNetworkAccessEnabled
  tags                        = var.tags
}

# ..........................................................................
# Module: Browser Authentication Private Endpoint for Databricks Workspace
# ..........................................................................
module "databricksBrowsAuthPEP" {
  count                        = var.environment == "transit" ? 1 : 0
  source                       = "../../Modules/networking/privateEndpoint"
  peName                       = "${var.org_name}-${var.bu_name}-dbw-browsauth-pe1"
  location                     = data.azurerm_resource_group.RG.location
  rgName                       = data.azurerm_resource_group.RG.name
  peSubnetId                   = data.azurerm_subnet.peSubnet.id
  peNicName                    = "${var.org_name}-${var.bu_name}-dbw-browsauth-pe1-nic"
  serviceConnectionName        = "${var.org_name}-${var.bu_name}-dbw-browsauth-pe1"
  privateResourceId            = module.databricksWorkspace.databricksWorkspaceId
  subresourceNames             = local.TargetSubresource.dbbrowsAuthPeSubresourceNames
  dnsZoneGroupName             = "${var.org_name}-${var.bu_name}-dbw-browsauth-pe1-dnsgroup"
  privateDnsZoneGroupCondition = true
  privateDnsZoneIds            = data.terraform_remote_state.private_dns_zone.outputs.private_dns_zone_id_db.id
  
}

# ..........................................................
# Module: UI-API Private Endpoint for Databricks Workspace
# ..........................................................
module "databricksUiApiPEP" {
  source                        = "../../Modules/networking/privateEndpoint"
  peName                        = "${var.org_name}-${var.bu_name}-dbw-uiapi-pe1"
  location                      = data.azurerm_resource_group.RG.location
  rgName                        = data.azurerm_resource_group.RG.name
  peSubnetId                    = data.azurerm_subnet.peSubnet.id
  peNicName                     = "${var.org_name}-${var.bu_name}-dbw-uiapi-pe1-nic"
  serviceConnectionName         = "${var.org_name}-${var.bu_name}-dbw-uiapi-pe1"
  privateResourceId             = module.databricksWorkspace.databricksWorkspaceId
  subresourceNames              = local.TargetSubresource.dbUiApiPeSubresourceNames
  dnsZoneGroupName              = "${var.org_name}-${var.bu_name}-dbw-uiapi-pe1-dnsgroup"
  privateDnsZoneGroupCondition  = true
  privateDnsZoneIds             = data.terraform_remote_state.private_dns_zone.outputs.private_dns_zone_id_db.id
}

# ......................................................
# Module: DFS Private Endpoint for Storage Account
# ......................................................
module "adlsGen2DfsPEP" {
  source                       = "../../Modules/networking/privateEndpoint"
  peName                       = "${var.org_name}-${var.bu_name}-dls2-dfs-pe1"
  location                     = data.azurerm_resource_group.RG.location
  rgName                       = data.azurerm_resource_group.RG.name
  peSubnetId                   = data.azurerm_subnet.peSubnet.id
  peNicName                    = "${var.org_name}-${var.bu_name}-dls2-dfs-pe1-nic"
  serviceConnectionName        = "${var.org_name}-${var.bu_name}-dls2-dfs-pe1"
  privateResourceId            = data.azurerm_storage_account.adls_gen2.id
  subresourceNames             = local.TargetSubresource.adlsGen2DfsPeSubresourceNames
  dnsZoneGroupName             = "${var.org_name}-${var.bu_name}-dls2-dfs-pe1-dnsgroup"
  privateDnsZoneGroupCondition = true
  privateDnsZoneIds            = data.terraform_remote_state.private_dns_zone.outputs.private_dns_zone_id_dfs.id

}

# ......................................................
# Module: Blob Private Endpoint for Storage Account
# ......................................................
module "adlsGen2BlobPEP" {
  source                       = "../../Modules/networking/privateEndpoint"
  peName                       = "${var.org_name}-${var.bu_name}-dls2-blob-pe1"
  location                     = data.azurerm_resource_group.RG.location
  rgName                       = data.azurerm_resource_group.RG.name
  peSubnetId                   = data.azurerm_subnet.peSubnet.id
  peNicName                    = "${var.org_name}-${var.bu_name}-dls2-blob-pe1-nic"
  serviceConnectionName        = "${var.org_name}-${var.bu_name}-dls2-blob-pe1"
  privateResourceId            = data.azurerm_storage_account.adls_gen2.id
  subresourceNames             = local.TargetSubresource.adlsGen2BlobPeSubresourceNames
  dnsZoneGroupName             = "${var.org_name}-${var.bu_name}-dls2-blob-pe1-dnsgroup"
  privateDnsZoneGroupCondition = true
  privateDnsZoneIds            = data.terraform_remote_state.private_dns_zone.outputs.private_dns_zone_id_blob.id
}


