resource "google_storage_bucket" "drone_storage" {
  name          =  "${var.project_id}-${var.env}-${var.drone_storage_name}" 
  location      = var.drone_storage_location
  force_destroy = true
  project = "${var.project_id}-${var.env}"

}