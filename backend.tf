terraform {
  backend "gcs" {
    bucket      = "odfl-devops-terraform-states"
    prefix      = "foundations/"
  }
}
