

module "project" {
  source = "./modules/project"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
}

module "networks" {
  source = "./modules/networks"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
  depends_on = [
    module.project
  ]
}

module "iam" {
  source = "./modules/iam"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
  
}

module "bigquery" {
  source = "./modules/bigquery"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "pubsub" {
  source = "./modules/pubsub"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}


module "project_data_cloud_secret_cloudsql" {
  source = "./modules/secret_manager"

  secret_id = "cloud-sql-root-password"
  project   = var.project_id
  location  = var.gcp_region

  length           = 16
  special          = true
  override_special = "_%@"
}

module "cloudsql" {
  source = "./modules/cloudsql"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
  cloudsql_tier                      = var.cloudsql_tier
  cloudsql_disk_size                 = var.cloudsql_disk_size
  cloudsql_availability_type         = var.cloudsql_availability_type
  # cloudsql_backup_start_time         = var.cloudsql_backup_start_time
  cloudsql_name               = var.cloudsql_name
  cloudsql_region             = var.gcp_region
  cloudsql_database_version   = var.cloudsql_database_version
  cloudsql_root_password      = module.project_data_cloud_secret_cloudsql.secret
  cloudsql_disk_type          = var.cloudsql_disk_type
  cloudsql_ipv4_enabled       = false
  cloudsql_require_ssl        = false
  cloudsql_zone               = var.gcp_zone
  cloudsql_backup_enabled     = true
  cloudsql_binary_log_enabled = true
  cloudsql_start_time         = var.cloudsql_backup_start_time
  vpc_network                 = module.networks.host_vpc_network

   depends_on = [
    module.project
  ]
}