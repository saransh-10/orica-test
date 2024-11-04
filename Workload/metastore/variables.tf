# For databricks autheenction service principal
variable "databricks_host_name" {
  description = "Databricks host URL for authentication"
  type        = string
  default     = "https://accounts.azuredatabricks.net/"
  validation {
    condition     = startswith(var.databricks_host_name, "https://")
    error_message = "[databricks_host_name] must start with 'https://'"
  }
}
variable "databricks_account_id" {
  description = "Databricks account ID for the service principal"
  type        = string
  default     = ""
  validation {
    condition     = length(var.databricks_account_id) > 0
    error_message = "[databricks_account_id] must not be empty"
  }
}

# metastore configuration details.
variable "metastore_region" {
  description = "Region for the Databricks metastore configuration"
  type        = string
  default     = ""

  validation {
    condition     = length(var.metastore_region) > 0
    error_message = "[metastore_region] must not be empty"
  }
}
