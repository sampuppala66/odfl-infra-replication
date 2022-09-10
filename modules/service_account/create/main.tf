/**
 * Create service account
 */
resource "google_service_account" "service_account" {
  project      = var.project
  account_id   = var.account_id
  display_name = var.display_name
  description  = var.description
}

resource "google_service_account_iam_policy" "service-account_user-iam" {
  service_account_id = google_service_account.service_account.name
  policy_data        = data.google_iam_policy.service_account_user.policy_data
}

resource "google_service_account_key" "hvr_service_acct_key" {
  service_account_id = google_service_account.service_account.name
  private_key_type    = "TYPE_GOOGLE_CREDENTIALS_FILE"
}

data "google_iam_policy" "service_account_user" {
  binding {
    role = "roles/iam.serviceAccountUser"
    members = var.sa_users
  }
}

resource "local_file" "hvr_service_account_key" {
    content     = base64decode(google_service_account_key.hvr_service_acct_key.private_key)
    filename = "./hvr_service_account_key.json"
}
