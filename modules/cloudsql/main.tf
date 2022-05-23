resource "google_sql_database_instance" "drone_instance" {
  name             = "${var.project_id}-${random_string.four_chars.result}"
  region           = var.drone_database_region
  database_version = var.drone_database_version
  settings {
    tier = var.drone_database_tier
  }

  deletion_protection  = var.drone_database_protection
}


resource "random_string" "four_chars" {
  length  = 4
  upper   = false # instance names can only have lowercase letters, numbers, and hyphens
  special = false
}