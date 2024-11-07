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

variable "vm_machine_size" {
  type        = string
  description = "Virtual machine Size"
}

variable "vm_admin_username" {
  type        = string
  description = "Virtual Machine Admin Username"
}

variable "vm_admin_password" {
  type        = string
  description = "Virtual Machine Admin Password"
}