provider "google" {
  project     = var.terraform_project_id
  credentials = file(var.credential_file)
  region = var.gcp_region
}
