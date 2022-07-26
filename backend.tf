terraform {
  # backend "local" {
  #   path = "terraform.tfstate"
  # }

  backend "gcs" {
    bucket = "pandera-terraform-managed-state"
    prefix = "odfl/dev"
  }
}
