output "aa_id" {
  description = "ID of the Automation Account."
  value       = azurerm_automation_account.aa.id
}

output "aa_name" {
  description = "Name of the Automation Account."
  value       = azurerm_automation_account.aa.name
}

output "aa_dsc_endpoint" {
  description = "DSC server endpoint of the Automation Account."
  value       = azurerm_automation_account.aa.dsc_server_endpoint
}

output "aa_primary_registration_key" {
  description = "Primary DSC registration key, exposed for DSC node registration. Sensitive. DSC key registration needs local_authentication_enabled = true."
  value       = azurerm_automation_account.aa.dsc_primary_access_key
  sensitive   = true
}

output "aa_principal_id" {
  description = "Principal ID of the system-assigned managed identity."
  value       = azurerm_automation_account.aa.identity[0].principal_id
}
