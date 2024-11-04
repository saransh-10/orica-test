data "azurerm_resource_group" "RG" {
  name = var.rg_name
}

# data "terraform_remote_state" "shared" {
#   backend = "azurerm"
#   config = {
#     resource_group_name   = "DU-test"
#     storage_account_name  = "dutestsa"
#     container_name        = "tfstate"
#     key                   = "terraform.tfstate"
#   }
# }


# data.terraform_remote_state.shared.outputs.acc_id