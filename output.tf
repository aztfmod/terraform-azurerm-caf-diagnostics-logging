##export the logging details for EH and SA
##export one object with both

output "diagnostics_map" {
    depends_on = [
        azurerm_storage_account.log, 
        ]

    value = "${
        map(
            "diags_sa", azurerm_storage_account.log.id,
            "diags_sa_name", azurerm_storage_account.log.name,
            "diags_sa_rg", var.resource_group_name,
            "eh_name",  var.enable_event_hub == true ? azurerm_eventhub_namespace.log[0].name : null,
            "eh_id", var.enable_event_hub == true ? azurerm_eventhub_namespace.log[0].id : null,
        )
    }"
}