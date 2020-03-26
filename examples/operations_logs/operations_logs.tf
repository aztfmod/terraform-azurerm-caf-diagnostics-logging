resource "azurerm_resource_group" "rg_test" {
  name     = local.resource_groups.test.name
  location = local.resource_groups.test.location
  tags     = local.tags
}

module "ol_test" {
  source = "../../"
  
    convention          = local.convention
    location            = local.location
    name                = local.name
    
    prefix              = local.prefix
    tags                = local.tags

    resource_group_name = azurerm_resource_group.rg_test.name
    
    enable_event_hub    = local.azure_diagnostics_logs_event_hub
}
