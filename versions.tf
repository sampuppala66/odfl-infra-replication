// Defines what version of terraform to use
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.17.0"
    }
  }
  required_version = ">= 0.14.7"
}
