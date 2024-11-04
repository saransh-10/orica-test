locals {
  resource_group_name = data.azurerm_resource_group.resource_group.name
  location            = data.azurerm_resource_group.resource_group.location

  networking_rg_name   = lower("${var.org_name}-${var.bu_name}-net-rg-01")
  virtual_network_name = lower("${var.org_name}-${var.bu_name}-vnet-01")
  address_space_vnet   = var.address_space_vnet


  subnet_host_name      = lower("${var.org_name}-${var.bu_name}-host-snet-02")
  subnet_container_name = lower("${var.org_name}-${var.bu_name}-container-snet-02")
  subnet_pep_name       = lower("${var.org_name}-${var.bu_name}-snet-pep-01")
  subnet_compute_name   = lower("${var.org_name}-${var.bu_name}-snet-compute-01")

  Virtual_Network_Link_Name = "ICT_Platform_Hub_VNET_Link"

  private_dns_link_registration_enabled = false
  # rt_name = [lower("${var.org_name}-${var.bu_name}-${var.environment}-${var.location}-rt-01"), lower("${var.org_name}-${var.bu_name}-${var.environment}-${var.location}-rt-02")]


  //subnets private endpoint network policy enabled or disabled(enabled in case of subnet stores private endpoints)
  subnet_private_endpoint_network_policy_false = false
  subnet_private_endpoint_network_policy_true  = true

  //subnet private link service network policies enabled or disabled
  private_link_service_network_policies_enabled_true  = true
  private_link_service_network_policies_enabled_false = false

  //disable bgp route propagation
  disable_bgp_route_propagation = true
  enable_bgp_route_propagation  = false

  // subnet deligations 
  subnet_delegation = {
    subnet_delegation_name  = "databricks-del-public"
    service_delegation_name = "Microsoft.Databricks/workspaces"
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/action",
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"
    ]
  }
  subnet_delegation_null = {}

  // service endpoints 
  service_endpoints = toset([
    "Microsoft.Storage",
    "Microsoft.AzureActiveDirectory",
    "Microsoft.Sql"
  ])

  // nsg details
  nsg_snet_host_name      = lower("${var.org_name}-${var.bu_name}-nsg-host-01")
  nsg_snet_container_name = lower("${var.org_name}-${var.bu_name}-nsg-container-01")

  default_nsg_rule = {
    databricks_workspace_inbound_wtw = {
      name                       = "Ms.Databricks-workspace_worker-to-worker-inbound"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    },
    databricks_workspace_outbound_wtw = {
      name                       = "Ms.Databricks-workspace_worker-to-worker-outbound"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    },
    databricks_workspace_outbound_wtsql = {
      name                       = "Ms.Databricks-workspace_worker-to-sql-outbound"
      priority                   = 101
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "3306"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "Sql"
    },
    databricks_workspace_outbound_wtstorage = {
      name                       = "Ms.Databricks-workspace_worker-to-storage-outbound"
      priority                   = 102
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "443"
      destination_port_range     = "*"
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "Storage"
    },
    databricks_workspace_outbound_wteventhub = {
      name                       = "Ms.Databricks-workspace_worker-to-eventhub-outbound"
      priority                   = 103
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "9093"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "EventHub"
    }

  }

  private_dns_zone_name = [
    "privatelink.blob.core.windows.net",
    "privatelink.dfs.core.windows.net",
    "privatelink.azuredatabricks.net",
  ]
}
