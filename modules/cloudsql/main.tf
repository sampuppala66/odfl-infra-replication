resource "google_sql_database_instance" "db_instance" {
  name             = "${var.project_id}-${random_string.four_chars.result}"
  region           = var.data_database_region
  database_version = var.odfl_database_version
  settings {
    tier              = var.cloudsql_tier
    availability_type = var.cloudsql_availability_type
    disk_size         = var.cloudsql_disk_size
    disk_type         = var.cloudsql_disk_type

    ip_configuration {
      ipv4_enabled    = var.cloudsql_ipv4_enabled
      private_network = var.vpc_network
      require_ssl     = var.cloudsql_require_ssl
    }

    location_preference {
      zone = var.cloudsql_zone
    }

    backup_configuration {
      enabled            = var.cloudsql_backup_enabled
      binary_log_enabled = var.cloudsql_binary_log_enabled
      start_time         = var.cloudsql_start_time
    }
  }

  depends_on = [module.networks.host_vpc_network]
}

/**
 * Create Root User Cloud SQL
 */
resource "google_sql_user" "users" {
  project  = var.project_id
  name     = "root"
  password = var.cloudsql_root_password
  instance = google_sql_database_instance.db_instance.name
  type     = ""
}

/**
 * Generate Cloud SQL Instance SSL Cert
 */
resource "google_sql_ssl_cert" "client_cert" {
  project     = var.project_id
  common_name = "${var.cloudsql_name}-${random_string.four_chars.result}"
  instance    = google_sql_database_instance.db_instance.name
}

/**
 * Create Secret with Private Key
 */
resource "google_secret_manager_secret" "private_key" {
  secret_id = "cloud-sql-private-key"
  project   = var.project_id

  replication {
    user_managed {
      replicas {
        location = var.cloudsql_region
      }
    }
  }
}

resource "google_secret_manager_secret_version" "private_key" {
  secret      = google_secret_manager_secret.private_key.id
  secret_data = google_sql_ssl_cert.client_cert.private_key
}

/**
 * Create Secret with Server CA Cert
 */
resource "google_secret_manager_secret" "server_ca_cert" {
  secret_id = "cloud-sql-server-ca-cert"
  project   = var.project_id

  replication {
    user_managed {
      replicas {
        location = var.cloudsql_region
      }
    }
  }
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
