[![VScodespaces](https://img.shields.io/endpoint?url=https%3A%2F%2Faka.ms%2Fvso-badge)](https://online.visualstudio.com/environments/new?name=terraform-azurerm-caf-diagnostics-logging&repo=aztfmod/terraform-azurerm-caf-diagnostics-logging)
[![Gitter](https://badges.gitter.im/aztfmod/community.svg)](https://gitter.im/aztfmod/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

# Deploys the operations log repositories 
Creates Storage Account and Event Hubs to be used for diagnostics and operations logs. 


Reference the module to a specific version (recommended):
```hcl
module "diagnostics_logging" {
    source  = "aztfmod/caf-diagnostics-logging/azurerm"
    version = "0.x.y"
  
    convention          = local.convention
    location            = local.location
    name                = local.name
    prefix              = local.prefix
    tags                = local.tags
    resource_group_name = azurerm_resource_group.rg_test.name
    enable_event_hub    = local.azure_diagnostics_logs_event_hub
}
```


<!--- BEGIN_TF_DOCS --->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| azurecaf | n/a |
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| convention | (Required) Naming convention method to use | `any` | n/a | yes |
| enable\_event\_hub | (Optional) Determine to deploy Event Hub for the configuration | `bool` | `true` | no |
| location | (Required) Define the region where the resources will be created | `any` | n/a | yes |
| max\_length | (Optional) You can speficy a maximum length to the name of the resource | `string` | `""` | no |
| name | (Required) Name for the objects created (before naming convention applied.) | `any` | n/a | yes |
| postfix | (Optional) You can use a postfix to the name of the resource | `string` | `""` | no |
| prefix | (Optional) You can use a prefix to the name of the resource | `string` | `""` | no |
| resource\_group\_name | (Required) Name of the resource group to deploy the operations log. | `any` | n/a | yes |
| tags | (Required) Tags for the logs repositories to be created | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| diagnostics\_map | Map of diagnostics repositories: diags\_sa, diags\_sa\_name, diags\_sa\_rg, eh\_name (optional), eh\_id(optional) |

<!--- END_TF_DOCS --->
