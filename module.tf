#Defines the subscription-wide operations logging and eventing settings
#Using EventHubs and Storage Account 
module "caf_name_st" {
  source = "github.com/aztfmod/terraform-azurerm-caf-naming.git?ref=proto"
  
  name    = var.name
  type    = "st"
  convention  = var.convention
}

module "caf_name_evh" {
  source = "github.com/aztfmod/terraform-azurerm-caf-naming.git?ref=proto"
  
  name    = var.name
  type    = "evh"
  convention  = var.convention
}

resource "azurerm_storage_account" "log" {
  name                      = module.caf_name_st.st
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

  name                = module.caf_name_evh.evh
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  capacity            = 2
  tags                = local.tags
  auto_inflate_enabled = false
  # kafka_enabled       = true
}