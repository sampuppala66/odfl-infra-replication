resource "google_compute_project_metadata" "project_metadata" {
  metadata = {
    enable-oslogin = var.oslogin
  }
  project = var.project_id
}
