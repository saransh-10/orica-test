variable "rt_name" {
  type = string
}

variable "rt_location" {
  type        = string
  description = "The location (region) where the Azure Route Table will be created."
}

variable "rt_rg_name" {
  type        = string
  description = "The name of the Azure Resource Group where the Route Table will be created."
}

variable "disable_bgp_route_propagation" {
  type        = bool
  description = "Indicates whether BGP route propagation is disabled."
}

variable "rt_tags" {
  type        = map(string)
  description = "A map of tags to apply to the Azure Route Table."
}

variable "rt_routes" {
  description = "List of routes for the Azure Route Table."
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = string
  }))
}
