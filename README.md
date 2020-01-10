[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/diagnostics_logging)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=6)
# Deploys the operations log repositories 
Creates Storage Account and Event Hubs to be used for diagnostics and operations logs. 


Reference the module to a specific version (recommended):
```hcl
module "diagnostics_logging" {
    source  = "aztfmod/caf-diagnostics-logging/azurerm"
    version = "0.x.y"
  
    resource_group_name               = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
}
```

# Parameters

## resource_group_name
(Required) Name of the resource group to deploy the operations log.
```hcl
variable "resource_group_name" {
  description = "(Required) Name of the resource group to deploy the operations log."
}

```
Example
```hcl
virtual_network_rg = "my-vnet"
```

## location
(Required) Define the region where the resource groups will be created
```hcl
variable "location" {
  description = "(Required) Define the region where the resource groups will be created"
  type        = string
}
```
Example
```hcl
    location    = "southeastasia"
```

## prefix
(Optional) You can use a prefix to add to the list of resource groups you want to create
```hcl
variable "prefix" {
    description = "(Optional) You can use a prefix to add to the list of resource groups you want to create"
}
```
Example
```hcl
locals {
    prefix = "${random_string.prefix.result}-"
}

resource "random_string" "prefix" {
    length  = 4
    upper   = false
    special = false
}
```

## tags
(Required) Map of tags for the deployment
```hcl
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```hcl
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

## enable_event_hub 
(Optional) Determine to deploy Event Hub for the configuration
```hcl
variable "enable_event_hub" {
  description = "(Optional) Determine to deploy Event Hub for the configuration"
  default = true
}
```

Example
```hcl
enable_event_hub = false

```
## convention
(Required) Naming convention to be used.
```hcl
variable "convention" {
  description = "(Required) Naming convention used"
}
```
Example
```hcl
convention = "cafclassic"
```

# Output

| Name | Type | Description | 
| -- | -- | -- | 
| diagnostics_map | map(strings) | Contains the diagnostics details as follow: <br> - "diags_sa"- Storage account resource ID <br> - "eh_name"- Event Hub Name <br> - "eh_id" - Event Hub Resource ID 