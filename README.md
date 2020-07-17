[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

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
    convention                        = var.convention
    tags                              = var.tags
}
```

## Inputs 

| Name | Type | Default | Description |
| -- | -- | -- | -- |
| resource_group_name | string | None | (Required) Name of the resource group where to create the resource. Changing this forces a new resource to be created. |
| name | string | None | (Required) Name for the objects created (before naming convention applied). Changing this forces a new resource to be created. |
| location | string | None | (Required) Specifies the Azure location to deploy the resource. Changing this forces a new resource to be created.  |
| tags | map | None | (Required) Map of tags for the deployment.  |
| enable_event_hub | boolean | true | (Optional) Determine to deploy Event Hub for the configuration. |
| convention | string | None | (Required) Naming convention to be used (check at the naming convention module for possible values).  |
| prefix | string | None | (Optional) Prefix to be used. |
| postfix | string | None | (Optional) Postfix to be used. |
| max_length | string | None | (Optional) maximum length to the name of the resource. |


# Output

| Name | Type | Description | 
| -- | -- | -- | 
| diagnostics_map | map(strings) | Contains the diagnostics details as follow: <br> - "diags_sa"- Storage account resource ID <br> - "diags_sa_name" - Storage account name <br> - "diags_sa_rg" - the resource group name containing the storage account <br> - "eh_name"- Event Hub Name <br> - "eh_id" - Event Hub Resource ID 