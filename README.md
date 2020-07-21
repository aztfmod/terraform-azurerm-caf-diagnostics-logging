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

<!--- END_TF_DOCS --->