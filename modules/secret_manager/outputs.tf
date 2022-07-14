/**
 * Outputs 
 */
output "secret" {
  description = "Generated secret."
  value       = data.google_secret_manager_secret_version.secret_password.secret_data
  sensitive = true
}

output "secret_id" {
  description = "Generated secret id."
  value       = google_secret_manager_secret.secret_password.id
}
