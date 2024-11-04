resource "azurerm_resource_group" "myrg" {
  count   = length(var.resource_group_names)
  name = var.resource_group_names[count.index]
  location = var.resource_group_locations[count.index]
}

resource "azurerm_storage_account" "myrg" {
  count                    = length(var.resource_group_names)
  name                     = var.storageaccount_names[count.index]
  resource_group_name      = azurerm_resource_group.myrg[count.index].name
  location                 = azurerm_resource_group.myrg[count.index].location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "dev"
  }
}