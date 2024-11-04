variable "resource_group_names" {
    type = list(string)
    description = "list of resource groups"
    
}
variable "resource_group_locations" {
    type = list(string)
    description = "list of regions"
    
}

variable "storageaccount_names" {
    type = list(string)
    description = "list of storage accounts"
    
}