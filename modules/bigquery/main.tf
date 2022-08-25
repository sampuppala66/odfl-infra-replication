
resource "google_bigquery_dataset" "dataset" {
  dataset_id                  = var.dataset_id
  friendly_name                = var.dataset_id
  description                 = var.dataset_description
  project                     = var.project_id
  location                    = var.location
}

