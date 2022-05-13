resource "google_project" "project_drone" {
  name            = "${var.project_id}-${var.env}"
  project_id      = var.project_id
  folder_id          =  google_folder.drone_folder.name
  auto_create_network = false
}

resource "google_project_service" "drone_service" {
  for_each = toset([
    "storage-api.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com",
    "iap.googleapis.com"
  ])
  service = each.key
  project            = google_project.project_drone.project_id
}

resource "google_project" "project_audit" {
  name            = var.audit_project_name
  project_id      = var.audit_project_id
  folder_id          = google_folder.audit_folder.folder_id
  auto_create_network = false
}

resource "google_project_service" "audit_service" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "storage-api.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.project_audit.project_id
}


