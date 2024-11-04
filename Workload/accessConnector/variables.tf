# Variable for the organization name
variable "rg_name" {
  type        = string
  description = "The name of the resource group."
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

# Variable for the tags
variable "tags" {
  type        = map(string)
  description = "Tags for access connector."
}

variable "role_definition_name" {
  type = string
  description = "Role required Ex Storage Blob Data Contributor"
}