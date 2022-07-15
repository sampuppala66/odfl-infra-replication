resource "google_sql_database_instance" "db_instance" {
  name             = "${var.project_id}-${random_string.four_chars.result}"
  region           = var.data_database_region
  database_version = var.odfl_database_version
  settings {
    tier = var.data_database_tier
  }

  deletion_protection  = var.data_database_protection
}

resource "google_sql_database" "database" {
  name     = "odfl-database"
  instance = google_sql_database_instance.db_instance.name
}

resource "random_string" "four_chars" {
  length  = 4
  upper   = false # instance names can only have lowercase letters, numbers, and hyphens
  special = false
}
