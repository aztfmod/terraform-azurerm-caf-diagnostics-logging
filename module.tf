#Defines the subscription-wide operations logging and eventing settings
#Using EventHubs and Storage Account 
resource "azurecaf_naming_convention" "caf_name_st" {  
  name    = var.name
  prefix  = var.prefix
  resource_type    = "st"
  max_length = 50
  convention  = var.convention
}

resource "azurecaf_naming_convention" "caf_name_evh" {  
  name    = var.name
  prefix  = var.prefix
  resource_type    = "evh"
  max_length = 50
  convention  = var.convention
}

resource "azurerm_storage_account" "log" {
  name                      = azurecaf_naming_convention.caf_name_st.result
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  access_tier               = "Hot"
  enable_https_traffic_only = true
  tags                      = local.tags
}

resource "azurerm_eventhub_namespace" "log" {
  count = var.enable_event_hub ? 1 : 0

  name                = azurecaf_naming_convention.caf_name_evh.result
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 2
  tags                = local.tags
  auto_inflate_enabled = false
  # kafka_enabled       = true
}