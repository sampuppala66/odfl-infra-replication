terraform {
  backend "gcs" {
    bucket      = "sba-devops-terraform-state"
    prefix      = "foundations/"
  }
}
