
resource "google_storage_bucket" "drone_storage" {
  name          = var.drone_storage_name
  location      = var.drone_storage_location
  force_destroy = true
<<<<<<< HEAD
  project = google_project.project_drone.project_id
=======

>>>>>>> f5fbd93a4c849ec521cd239e6f483a7116f9af0f
}