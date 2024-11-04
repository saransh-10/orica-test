# Variable to define the address space for the virtual network
variable "address_space_vnet" {
  type        = list(string)
  description = "The address space for the virtual network."
}

# Variable to define tags for the virtual network
variable "vnet_tags" {
  type        = map(string)
  description = "A map of tags to assign to the virtual network."
}

# Variable to define the address prefixes for host subnet 
variable "subnet_host_address_prefix" {
  type        = list(string)
  description = "A list of address prefixes for the host subnet."
}

# Variable to define the address prefixes for Container subnet 
variable "subnet_container_address_prefix" {
  type        = list(string)
  description = "A list of address prefixes for the container subnet."
}

# Variable to define the address prefixes for private endpoint subnet
variable "subnet_pep_address_prefix" {
  type        = list(string)
  description = "A list of address prefixes for the private endpoint subnet."
}

# Variable to define the address prefixes for compute subnet
variable "subnet_compute_address_prefix" {
  type        = list(string)
  description = "A list of address prefixes for the compute subnet."
}



# Variable to define tags for the network security groups
variable "nsg_tags" {
  type        = map(string)
  description = "A map of tags to assign to the network security groups."
}

variable "subnet_routetable_association" {
  type = bool
}

# Variable for the organization name
variable "org_name" {
  type        = string
  description = "The name of the organization."
}

# Variable for the business unit name
variable "bu_name" {
  type        = string
  description = "The name of the business unit."
}

# Variable for the environment name
variable "environment" {
  type        = string
  description = "The name of the environment."
}

# Variable for the tags for Private DNS Zone
variable "PDZ_tags" {
  type = map(string)
  description = "Tags for Private DNS Zone"
}