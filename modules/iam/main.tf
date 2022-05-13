
# resource "google_service_account" "fivetran_service_account" {
#   project      =  "${var.project_id}-${var.env}"
#   account_id   = "cdp-fivetran-coupa-sa"
#   display_name = "Service account for Coupa"
# }

resource "google_project_iam_binding" "system_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/iam.serviceAccountUser"
  members = []
}


resource "google_project_iam_binding" "compute_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/compute.admin"
  members = []
}

resource "google_project_iam_binding" "log_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = " roles/logging.admin "
  members = []
}

resource "google_project_iam_binding" "monitoring_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/monitoring.admin"
  members = []
}

resource "google_project_iam_binding" "dns_reader" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/dns.reader"
  members = []
}

resource "google_project_iam_binding" "compute_network_viewer" {
  project     =  "${var.project_id}-${var.env}"
  role = " roles/compute.networkViewer"
  members = []
}

resource "google_project_iam_binding" "container_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/container.admin"
  members = []
}

resource "google_project_iam_binding" "project_creatorNote" {
  project     =  "${var.project_id}-${var.env}"
  role = " roles/project.creatorNote"
  members = []
}

resource "google_project_iam_binding" "storage_admin" {
  project     =  "${var.project_id}-${var.env}"
  role = " roles/storage.admin "
  members = []
}


resource "google_project_iam_binding" "bigquery_user" {
  project     = "${var.project_id}-${var.env}"
  role = "roles/bigquery.user"
  members = [
  ]
}
resource "google_project_iam_binding" "bigquery_editor" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/bigquery.dataEditor"
  members = []
}


resource "google_project_iam_binding" "cloudsql_viewer" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/cloudsql.viewer"
  members = []
}


resource "google_project_iam_binding" "auditor" {
  project     =  "${var.project_id}-${var.env}"
  role = "roles/storage.objectViewer"
  members = []
}