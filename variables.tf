variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the operations log."
}

variable "location" {
  description = "(Required) Define the region where the resources will be created"
}

variable "tags" {
  description = "(Required) Tags for the logs repositories to be created "
  
}
variable "prefix" {
  description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
  default = ""
}
variable "enable_event_hub" {
  description = "(Optional) Determine to deploy Event Hub for the configuration"
  default = true
}
variable "convention" {
  description = "(Required) Naming convention method to use"  
}

variable "name" {
  description = "(Required) Name for the objects created (before naming convention applied.)"    
}
