/**
 * Create private IP block
 */
/*resource "google_compute_global_address" "private_ip_block" {
  address       = var.private_ip_address
  name          = var.private_ip_name
  purpose       = var.private_ip_purpose
  address_type  = var.private_ip_address_type
  ip_version    = var.private_ip_version
  prefix_length = var.private_ip_prefix_length
  network       = var.vpc_network
  project       = var.project_id
}*/

///**
// * Create private VPC connection
// */
/*resource "google_service_networking_connection" "private_vpc_connection" {
  network                 = var.vpc_network
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_block.name]
  depends_on = [google_compute_global_address.private_ip_block]
}*/

resource "google_sql_database_instance" "db_instance" {
  name             = "${var.project_id}-postgresql-${random_string.four_chars.result}"
  region           = var.data_database_region
  database_version = var.odfl_database_version
  project = var.project_id
  deletion_protection = false
  settings {
    tier              = var.cloudsql_tier
    availability_type = var.cloudsql_availability_type
    disk_size         = var.cloudsql_disk_size
    disk_type         = var.cloudsql_disk_type
    disk_autoresize = true

    ip_configuration {
      ipv4_enabled    = var.cloudsql_ipv4_enabled
      //private_network = var.vpc_network
      /*authorized_networks {
        name  = var.hvr_vm_name
        value = var.hvr_vm_ip
      }*/
    }
    backup_configuration {
      enabled            = var.cloudsql_backup_enabled
      binary_log_enabled = var.cloudsql_binary_log_enabled
      start_time         = var.cloudsql_start_time
    }
    //depends_on = [google_service_networking_connection.private_vpc_connection]
    //depends_on = [module.networks.host_vpc_network]
  }
}

resource "google_sql_database" "database" {
  name     = "odfl-pilot-db2data-${var.env}"
  instance = google_sql_database_instance.db_instance.name
  project = var.project_id

}

resource "google_sql_database" "database_dblib2" {
  name     = "dtalib2-${var.env}"
  instance = google_sql_database_instance.db_instance.name
  project = var.project_id

}

resource "random_string" "four_chars" {
  length  = 4
  upper   = false # instance names can only have lowercase letters, numbers, and hyphens
  special = false
}
