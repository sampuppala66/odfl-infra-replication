provider "google" {
  project     = var.project_id
  credentials = file(var.credential_file)
  region = var.gcp_region
}
