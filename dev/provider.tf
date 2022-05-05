provider "google" {
  project     = "sba-devops-terraform"
  credentials = file(var.credential_file)
  region = "us-central1"
}
