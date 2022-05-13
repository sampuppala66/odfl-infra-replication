provider "google" {
  project     = "sba-devops-terraform"
  credentials = file(var.credential_file)
  region = var.gcp_region
}
