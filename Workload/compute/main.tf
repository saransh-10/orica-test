# ......................................................
# Creating Compute for SHIR/SHA
# ......................................................
module "compute" {
  source                            = "../../Modules/vm-linux"
  vm_admin_username                 = var.vm_admin_username
  vm_machine_size                   = var.vm_machine_size
  nic_subnet_id                     = data.terraform_remote_state.network.outputs.subnet_compute_id
  vm_location                       = data.terraform_remote_state.network.outputs.resource_group_location
  vm_name                           = local.vm_machine_name
  network_interface_name            = local.network_interface_name
  vm_os_disk                        = local.vm_os_disk
  vm_resource_group_name            = data.terraform_remote_state.network.outputs.resource_group_name
  vm_image_reference                = local.vm_image_reference
  vm_public_key                     = null
  admin_ssh_key                     = null
  admin_password                    = var.vm_admin_password
}
