##export the logging details for EH and SA
##export one object with both

output "diagnostics_map" {
    depends_on = [
        azurerm_storage_account.log, 
        azurerm_eventhub_namespace.log,
        azurerm_eventhub_namespace.log
        ]

    value = "${
        map(
            "diags_sa", "${azurerm_storage_account.log.id}",
            "eh_name",  "${azurerm_eventhub_namespace.log.name}",
            "eh_id", "${azurerm_eventhub_namespace.log.id}"
        )
    }"
}