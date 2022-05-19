terraform {
  backend "gcs" {
    bucket      = "sba-devops-terraform-states"
    prefix      = "foundations/"
  }
}
