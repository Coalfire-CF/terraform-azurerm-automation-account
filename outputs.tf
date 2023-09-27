output "aa_id" {
  value = azurerm_automation_account.aa.id
}

output "aa_name" {
  value = azurerm_automation_account.aa.name
}

output "aa_dsc_endpoint" {
  value = azurerm_automation_account.aa.dsc_server_endpoint
}

output "aa_primary_registration_key" {
  value = azurerm_automation_account.aa.dsc_primary_access_key
  sensitive = true
}

output "aa_principal_id" {
  value = azurerm_automation_account.aa.identity[0].principal_id
}
