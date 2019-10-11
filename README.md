[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/diagnostics_logging)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=6)
# Deploys the operations log repositories 
Creates Storage Account and Event Hubs to be used for diagnostics and operations logs. 


Reference the module to a specific version (recommended):
```hcl
module "diagnostics_logging" {
    source  = "aztfmod/caf-diagnostics-logging/azurerm"
    version = "0.1.0"
  
    resource_group_name               = var.rg
    prefix                            = var.prefix
    location                          = var.location
    tags                              = var.tags
}
```

Or get the latest version
```hcl
module "diagnostics_logging" {
    source                  = "git://github.com/aztfmod/diagnostics_logging.git?ref=latest"
  
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

# Output
## diagnostics_map
Returns a map: 
  - "diags_sa"- Storage account resource ID
  - "eh_name"- Event Hub Name 
  - "eh_id" - Event Hub Resource ID  