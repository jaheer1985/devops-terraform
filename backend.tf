terraform {
  backend "azurerm" {
    storage_account_name = "adomystorage"
    container_name       = "myfolder"
    resource_group_name = "adodevrg"
    key          = "jaheer.tfstate"
  }
}