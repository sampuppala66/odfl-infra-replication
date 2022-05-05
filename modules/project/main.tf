resource "google_project" "project_drone" {
  name            = "${var.project_id}-${var.env}"
  project_id      = var.project_id
  folder_id          = var.sba_folder_id
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
  project_id      = "sba-gov-audit-345113"
  folder_id          = var.audit_folder_id
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
  project            = "sba-gov-audit-345113"
}
