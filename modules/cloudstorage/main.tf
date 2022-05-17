
resource "google_storage_bucket" "drone_storage" {
  name          = var.drone_storage_name
  location      = var.drone_storage_location
  force_destroy = true
  project = google_project.project_drone.project_id
}