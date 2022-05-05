resource "google_service_account" "looker_service_account" {
  project      =  "${var.project_id}-${var.env}"
  account_id   = "looker-service-account"
  display_name = "Looker service account"
}

resource "google_service_account" "fivetran_service_account" {
  project      =  "${var.project_id}-${var.env}"
  account_id   = "cdp-fivetran-coupa-sa"
  display_name = "Service account for Coupa"
}

resource "google_project_iam_binding" "logs_writer" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/logging.logWriter"
  members = [
    "serviceAccount:g-seller-hanging@fivetran-production.iam.gserviceaccount.com"
  ]
}

resource "google_project_iam_binding" "bigquery_jobuser" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/bigquery.jobUser"
  members = [
    "serviceAccount:${google_service_account.looker_service_account.email}",
    "serviceAccount:${google_service_account.fivetran_service_account.email}",
    "group:gcp-cdp-engineers-dev@sbasite.com"
  ]
}

resource "google_project_iam_binding" "bigquery_user" {
  project     = "${var.project_id}-${var.env}"
  role = "roles/bigquery.user"
  members = [
    "serviceAccount:${google_service_account.looker_service_account.email}",
    "serviceAccount:${google_service_account.fivetran_service_account.email}",
    "group:gcp-cdp-engineers-dev@sbasite.com"
  ]
}

resource "google_project_iam_binding" "bigquery_editor" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/bigquery.dataEditor"
  members = [
    "serviceAccount:${google_service_account.looker_service_account.email}",
    "group:gcp-cdp-engineers-dev@sbasite.com"
  ]
}

resource "google_project_iam_binding" "service_usage_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/serviceusage.serviceUsageAdmin"
  members = [
    "group:gcp-cdp-engineers-dev@sbasite.com"
  ]
}

resource "google_project_iam_binding" "compute_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/compute.admin"
  members = [
    "group:gcp-cdp-engineers-dev@sbasite.com"
  ]
}

resource "google_project_iam_binding" "vertex_admin" {
  project     = "${var.project_id}-${var.env}"
  role = "roles/aiplatform.admin"
  members = [
    "group:gcp-cdp-engineers-dev@sbasite.com"
  ]
}
