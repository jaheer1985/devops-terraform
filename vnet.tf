resource "azurerm_resource_group" "myrgvnet" {
    count    = length(var.resource_group_names)
    name     = var.resource_group_names[count.index]
    location = var.resource_group_locations[count.index]
}

resource "azurerm_network_security_group" "mysg" {
  count               = length(var.securitygroups)
  name                = var.securitygroups[count.index]
  location            = var.resource_group_locations[count.index]
  resource_group_name = azurerm_resource_group.myrgvnet[count.index].name
}

resource "azurerm_virtual_network" "myvnet" {
  
  count               = length(var.myvnets)
  name                = var.myvnets[count.index]
  location            = var.resource_group_locations[count.index]
  resource_group_name = azurerm_resource_group.myrgvnet[count.index].name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name             = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name             = "subnet2"
    address_prefix = "10.0.2.0/24"
    security_group   = azurerm_network_security_group.mysg[count.index].id
  }

  tags = {
    environment = "dev"
  }
}