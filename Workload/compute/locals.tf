locals {
  nsg_compute_name = lower("${var.org_name}-${var.bu_name}-nsg-compute-01")
  vm_os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  vm_machine_name                   = lower("${var.org_name}-${var.bu_name}-compute-01")
  network_interface_name            = lower("${var.org_name}-${var.bu_name}-nic-compute-01")
  nic_private_ip_address_allocation = "Dynamic"
  vm_image_reference = {
    sku       = "22_04-lts"
    version   = "latest"
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
  }
}
