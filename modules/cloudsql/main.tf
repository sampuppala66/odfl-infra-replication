resource "google_sql_database" "drone_cloud_sql" {
  name     = var.cloud_sql_name
  instance = google_sql_database_instance.instance.name
}


resource "google_sql_database_instance" "drone_instance" {
  name             = var.drone_database_name
  region           = var.drone_database_region
  database_version = var.drone_database_version
  settings {
    tier = var.drone_database_tier
  }

  deletion_protection  = var.drone_database_protection
}