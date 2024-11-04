# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used

# resource "azurerm_resource_group" "myrg" {
#   count   = length(var.resource_group_names)
#   name = var.resource_group_names[count.index]
#   location = var.resource_group_locations[count.index]
# }

