/**
 * Outputs
 */
output "id" {
  description = "An identifier for the resource with format projects/{{project}}/serviceAccounts/{{email}}"
  value       = google_service_account.service_account.id

}

output "email" {
  description = "The e-mail address of the service account. This value should be referenced from any google_iam_policy data sources that would grant the service account privileges."
  value       = google_service_account.service_account.email

}

output "name" {
  description = "The fully-qualified name of the service account."
  value       = google_service_account.service_account.name

}

output "unique_id" {
  description = "The unique id of the service account."
  value       = google_service_account.service_account.unique_id

}
output "service_acct_key" {
  value = base64decode(google_service_account_key.hvr_service_acct_key.private_key)
}
