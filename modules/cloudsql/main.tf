resource "google_sql_database_instance" "data_instance" {
  name             = "${var.project_id}-${random_string.four_chars.result}"
  region           = var.data_database_region
  database_version = var.data_database_version
  settings {
    tier = var.data_database_tier
  }

  deletion_protection  = var.data_database_protection
}


resource "random_string" "four_chars" {
  length  = 4
  upper   = false # instance names can only have lowercase letters, numbers, and hyphens
  special = false
}