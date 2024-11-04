address_space_vnet = ["10.10.0.0/16"]
vnet_tags = {
  "owner" = "orica"
}
subnet_host_address_prefix          = ["10.10.0.0/24"]
subnet_container_address_prefix        = ["10.10.1.0/24"]
subnet_pep_address_prefix     = ["10.10.2.0/24"]
subnet_compute_address_prefix     = ["10.10.3.0/24"]
# subnet_bastion_address_prefix = ["10.10.3.0/28"]
nsg_tags = {
  "owner" = "orica"
}
PDZ_tags = {
  "owner" = "orica"
}

# rg_location                   = "australiacentral"
# rg_creation                   = "new"
org_name                      = "orica"
bu_name                       = "transit"
environment                   = "transit"
# location                      = "australiacentral"
subnet_routetable_association = false

