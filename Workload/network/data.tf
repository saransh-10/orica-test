data "azurerm_resource_group" "resource_group" {
  name  = local.networking_rg_name
}

# data "terraform_remote_state" "shared" {
#   backend = "azurerm"
#   config = {
#     resource_group_name   = "Orica-test"
#     storage_account_name  = "ortfstate2"
#     container_name        = "tfstate"
#     key                   = "terraform.tfstate"
#   }
# }