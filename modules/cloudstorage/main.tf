
resource "google_storage_bucket" "drone_storage" {
  name          = var.drone_storage_name
  location      = var.drone_storage_location
  force_destroy = true
  project = var.project_id

}