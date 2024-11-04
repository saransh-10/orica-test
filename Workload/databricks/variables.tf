# Variable for existing vnet
variable "existingVnetName" {
  type        = string
  description = "Existing Vnet name"
}

# Variable for public access for the databricks workspace
variable "publicNetworkAccessEnabled" {
  type        = bool
  description = "True or False for public access to the workspace"
}

# Variable for SKU for the workspace
variable "databricksWorkspace" {
  type = object({
    sku = string
  })
  description = "Premium or Standard"
}

# Variable for the resource group
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
