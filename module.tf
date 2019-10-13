#Defines the subscription-wide operations logging and eventing settings
#Using EventHubs and Storage Account 

resource "random_string" "random_postfix" {
    length  = 3
    upper   = false
    special = false
}

resource "azurerm_storage_account" "log" {
  name                     = "opslogs${var.prefix}${random_string.random_postfix.result}"
  resource_group_name      = "${var.resource_group_name}"
  location                 = "${var.location}"
  account_kind             = "StorageV2"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  access_tier              = "Hot"
  enable_https_traffic_only = true
  tags                     = local.tags
}

resource "azurerm_eventhub_namespace" "log" {
  name                = "opslogs${var.prefix}${random_string.random_postfix.result}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  sku                 = "Standard"
  capacity            = 2
  tags                = local.tags
  auto_inflate_enabled = false
  kafka_enabled       = true
}