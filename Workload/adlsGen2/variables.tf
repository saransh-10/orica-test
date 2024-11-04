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

# Variable for container_access_type
variable "container_access_type" {
  description = " (Optional) The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private."
  type        = string
}

# Variable for public access 
variable "network_access_adls" {
  type = bool
  description = "True to enable Public access otherwise False"
}