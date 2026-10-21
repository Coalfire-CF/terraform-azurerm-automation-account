output "aa_id" {
  description = "ID of the Automation Account."
  value       = module.automation_account.aa_id
}

output "aa_principal_id" {
  description = "Principal ID of the system-assigned managed identity."
  value       = module.automation_account.aa_principal_id
}
