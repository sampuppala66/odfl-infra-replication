
resource "google_bigquery_dataset" "drone_data" {
  dataset_id                  = var.drone_dataset_id
  friendly_name                = var.drone_dataset_name
  description                 = var.dataset_description
  project                     = var.project_id
  location                    = var.location
  disable_dependent_services = true
  labels    = var.dataset_labels
}

resource "google_bigquery_dataset" "audit_data" {
  dataset_id                  = var.audit_dataset_id
  friendly_name                = var.audit_dataset_name
  description                 = var.audit_dataset_description
  project                     = var.audit_project_id
  location                    = var.location
  disable_dependent_services = true
  labels    = var.dataset_labels
}
