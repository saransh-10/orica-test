# ......................................................
# Creating New Resource Group
# ......................................................
module "RG" {
  source                  = "../../Modules/rg"
  resource_group_name     = local.resource_group_name
  resource_group_location = local.location
}

# ......................................................
# Creating New Virtual Network
# ......................................................
module "vnet" {
  source                        = "../../Modules/networking/virtualNetwork"
  new_virtual_network_name      = local.virtual_network_name
  virtual_network_location      = local.location
  virtual_network_address_space = local.address_space_vnet
  resource_group_name           = module.RG.resource_group_name
  virtual_network_tags          = var.vnet_tags
}

# ......................................................
# Creation of Host Subnet
# ......................................................
module "subnet_host" {
  source                                        = "../../Modules/networking/subnet"
  subnet_name                                   = local.subnet_host_name
  subnet_address_prefixes                       = var.subnet_host_address_prefix
  subnet_rg_name                                = module.RG.resource_group_name
  virtual_network_name                          = module.vnet.virtual_network_name
  location                                      = local.location
  subnet_delegations                            = local.subnet_delegation
  service_endpoints                             = local.service_endpoints
  private_link_service_network_policies_enabled = local.private_link_service_network_policies_enabled_false
  nsg_id                                        = module.nsg_snet_host.nsg_id
  subnet_rt_association                         = false
}

# ......................................................
# Creation of Container Subnet 
# ......................................................
module "subnet_container" {
  source                                        = "../../Modules/networking/subnet"
  subnet_name                                   = local.subnet_container_name
  subnet_address_prefixes                       = var.subnet_container_address_prefix
  subnet_rg_name                                = module.RG.resource_group_name
  virtual_network_name                          = module.vnet.virtual_network_name
  location                                      = local.location
  subnet_delegations                            = local.subnet_delegation
  service_endpoints                             = local.service_endpoints
  private_link_service_network_policies_enabled = local.private_link_service_network_policies_enabled_false
  nsg_id                                        = module.nsg_snet_container.nsg_id
  subnet_rt_association                         = false
}

# ......................................................
# Creation of Private Endpoint Subnet
# ......................................................
module "subnet_pep" {
  source                                        = "../../Modules/networking/subnet"
  subnet_name                                   = local.subnet_pep_name
  subnet_address_prefixes                       = var.subnet_pep_address_prefix
  subnet_rg_name                                = module.RG.resource_group_name
  virtual_network_name                          = module.vnet.virtual_network_name
  location                                      = local.location
  subnet_delegations                            = local.subnet_delegation_null
  service_endpoints                             = local.service_endpoints
  private_link_service_network_policies_enabled = local.private_link_service_network_policies_enabled_false
  subnet_nsg_association                        = false
  subnet_rt_association                         = false
}

# ......................................................
# Creation of Compute Subnet
# ......................................................
module "subnet_compute" {
  source                                        = "../../Modules/networking/subnet"
  subnet_name                                   = local.subnet_compute_name
  subnet_address_prefixes                       = var.subnet_compute_address_prefix
  subnet_rg_name                                = module.RG.resource_group_name
  virtual_network_name                          = module.vnet.virtual_network_name
  location                                      = local.location
  subnet_delegations                            = local.subnet_delegation_null
  service_endpoints                             = local.service_endpoints
  private_link_service_network_policies_enabled = local.private_link_service_network_policies_enabled_false
  subnet_nsg_association                        = false
  subnet_rt_association                         = false
}

# ......................................................
# Creation of NSG for Host
# ......................................................
module "nsg_snet_host" {
  source       = "../../Modules/networking/networkSecurityGroup"
  nsg_name     = local.nsg_snet_host_name
  nsg_location = local.location
  nsg_rg_name  = module.RG.resource_group_name
  sec_rule = [
    local.default_nsg_rule.databricks_workspace_inbound_wtw,
    local.default_nsg_rule.databricks_workspace_outbound_wtw,
    local.default_nsg_rule.databricks_workspace_outbound_wtsql,
    local.default_nsg_rule.databricks_workspace_outbound_wtstorage,
    local.default_nsg_rule.databricks_workspace_outbound_wteventhub,
  ]
  nsg_tags = var.nsg_tags
  depends_on = [ module.vnet ]
}

# ......................................................
# Creation of NSG for Container 
# ......................................................
module "nsg_snet_container" {
  source       = "../../Modules/networking/networkSecurityGroup"
  nsg_name     = local.nsg_snet_container_name
  nsg_location = local.location
  nsg_rg_name  = module.RG.resource_group_name
  sec_rule = [
    local.default_nsg_rule.databricks_workspace_inbound_wtw,
    local.default_nsg_rule.databricks_workspace_outbound_wtw,
    local.default_nsg_rule.databricks_workspace_outbound_wtsql,
    local.default_nsg_rule.databricks_workspace_outbound_wtstorage,
    local.default_nsg_rule.databricks_workspace_outbound_wteventhub,
  ]
  nsg_tags = var.nsg_tags
  depends_on = [ module.vnet ]
}


module "private_dns_zone" {
  source                               = "../../Modules/networking/privateDNSZone"
  count                                = length(local.private_dns_zone_name)
  private_dns_zone_name                = element(local.private_dns_zone_name, count.index)
  private_dns_zone_resource_group_name = module.RG.resource_group_name
  private_dns_zone_tags                = var.PDZ_tags
  depends_on                           = [module.vnet]
}

# ......................................................
# Creating Private DNS Zone Vnet Link
# ......................................................

module "Vnet_Link" {
  source                                = "../../Modules/networking/virtualNetworkLink"
  count                                 = length(local.private_dns_zone_name)
  private_dns_link_name                 = local.Virtual_Network_Link_Name
  private_dns_link_registration_enabled = local.private_dns_link_registration_enabled
  private_dns_link_resource_group_name  = module.RG.resource_group_name
  private_dns_link_virtual_network_id   = module.vnet.virtual_network_id
  private_dns_link_zone_name            = element(local.private_dns_zone_name, count.index)
  private_dns_link_tags                 = var.PDZ_tags

  depends_on = [module.private_dns_zone]
}
