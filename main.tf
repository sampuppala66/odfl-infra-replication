
module "project" {
  source = "./modules/project"
  project_id = "${var.project_id}-${var.env}"
  data_folder_id = var.data_folder_id
  billing_account = var.billing_account
  env = var.env
}

module "project_metadata" {
  source = "./modules/project/metadata"
  project_id = "${var.project_id}-${var.env}"
  oslogin = var.oslogin
}

module "networks" {
  source = "./modules/networks"
  project_id = "${var.project_id}-${var.env}"
  data_subnetwork_region = var.gcp_region //list of regions
  env = var.env
  vpc_name = var.vpc_name
  subnet_name = var.subnet_name
  subnetwork_regions = var.subnetwork_regions

  depends_on = [
    module.project
  ]
}

module "firewall-rule-allow-tcp"{
  source = "./modules/firewall"
  project_id = "${var.project_id}-${var.env}"
  firewall_name = "odfl-fw-ig-allow-gca-pilot-hvrhub-to-hvragent-${var.env}"
  description = "firewall rule allowing tcp"
  ports =  var.tcp_ports
  tags = var.tags
  source_ranges = var.tcp_source_ranges
  vpc_network = module.networks.host_vpc_network
  env = var.env
  priority = 1000
  protocol = "tcp"
}
// TODO Remove this rule once production is stable
module "firewall-rule-allow-workstation_ips"{
  source = "./modules/firewall"
  project_id = "${var.project_id}-${var.env}"
  firewall_name = "odfl-fw-ig-allow-ssh-workstation-to-hvragent"
  description = "firewall rule allowing single ip"
  ports =  var.tcp_ports
  tags = var.tags
  source_ranges = ["0.0.0.0/0"]
  vpc_network = module.networks.host_vpc_network
  env = var.env
  priority = 2000
  protocol = "tcp"
}

module "hvr_service_account" {
  source = "./modules/service_account/create"
  project      ="${var.project_id}-${var.env}"
  account_id   = "${var.service_account_name}-${var.env}"
  sa_users = var.sa_users
  roles = var.roles
  display_name = "${var.service_account_name}-${var.env}"
  description = "hvr service account"
}

module "pilot_service_account" {
  source = "./modules/service_account/create"
  project      ="${var.project_id}-${var.env}"
  account_id   = "${var.pilot_service_account_name}-${var.env}"
  sa_users = var.sa_users
  roles = var.roles
  display_name = "${var.pilot_service_account_name}-${var.env}"
  description = "pilot service account"
}


data "google_compute_default_service_account" "hvr_service_account" {
   project      =  "${var.project_id}-${var.env}"
}

module "hvr_service_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.roles
  members = [
              "serviceAccount:${module.hvr_service_account.email}"
            ]
  env = var.env
  depends_on = [
   module.project
  ]
}

module "pilot_service_account_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.roles
  members = [
              "serviceAccount:${module.pilot_service_account.email}"
            ]
  env = var.env
  depends_on = [
   module.project
  ]
}

module "developer_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.developer_roles
  members = var.developer_users
  env = var.env
  depends_on = [
   module.project
  ]
}

module "security_reviewers_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.reviewer_roles
  members = var.reviewers
  env = var.env
  depends_on = [
   module.project
  ]
}

module "admin_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.admin_roles
  members = var.admins
  env = var.env
   depends_on = [
   module.project
  ]
}

module "tester_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.tester_roles
  members = var.tester_users
  env = var.env
  depends_on = [
   module.project
  ]
}

module "monitoring_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = var.monitoring_roles
  members = var.monitoring_users
  env = var.env
  depends_on = [
   module.project
  ]
}

module "bigquery_dataset_datalake" {
  source = "./modules/bigquery"
  dataset_id = "odfl_gca_datalake_${var.env}"
  location = var.gcp_region
  dataset_description = "The Data lake"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "bigquery_dataset_datawarehouse" {
  source = "./modules/bigquery"
  dataset_id = "odfl_gca_datawarehouse_${var.env}"
  location = var.gcp_region
  dataset_description = "The data Ware house"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "bigquery_dataset_landing" {
  source = "./modules/bigquery"
  dataset_id = "odfl_gca_agent_target_${var.env}"
  location = var.gcp_region
  dataset_description = "The landing dataset"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "hvr_vm_startup_storage" {
  source = "./modules/cloud_storage/cloud_storage_bucket"
  storage_location = var.gcp_region
  bucket_name = "odfl-vm-startup-${var.env}"
  project_id = "${var.project_id}-${var.env}"
}

module "odfl_test_data_storage" {
  source = "./modules/cloud_storage/cloud_storage_bucket"
  storage_location = var.gcp_region
  bucket_name = "odfl-gca-pilot-test-data-${var.env}"
  project_id = "${var.project_id}-${var.env}"
}

module "hvr_service_acct_key_storage" {
  source = "./modules/cloud_storage/cloud_storage_bucket"
  storage_location = var.gcp_region
  bucket_name = "odfl-service-acct-key-${var.env}"
  project_id = "${var.project_id}-${var.env}"
}

module "hvr_vm_startup_script" {
  source = "./modules/cloud_storage/cloud_storage_object"
  bucket = module.hvr_vm_startup_storage.bucket.name
  file_name = "./hvr_vm_startup.sh"
  project_id =  "${var.project_id}-${var.env}"
  object_name = "hvr_vm_startup_${var.env}.sh"
}

module "hvr_vm_storage_access" {
  source = "./modules/cloud_storage/storage_access"
  bucket = module.hvr_vm_startup_storage.bucket.name
  object_name = "hvr_vm_startup_${var.env}.sh"
  service_account = "user-${module.hvr_service_account.email}"
  depends_on = [
   module.hvr_vm_startup_script, module.hvr_vm_startup_storage
 ]
}

module "hvr_sa_key_json" {
  source = "./modules/cloud_storage/cloud_storage_object"
  bucket = module.hvr_service_acct_key_storage.bucket.name
  file_name = "./hvr_service_account_key.json"
  project_id =  "${var.project_id}-${var.env}"
  object_name = "hvr_service_account_key.json"
}

module "hvr_vm_sa_access" {
  source = "./modules/cloud_storage/storage_access"
  bucket = module.hvr_service_acct_key_storage.bucket.name
  object_name = "hvr_service_account_key.json"
  service_account = "user-${module.hvr_service_account.email}"
  depends_on = [module.hvr_service_acct_key_storage, module.hvr_sa_key_json]
}

module "iam_folder_policy" {
  source = "./modules/iam/policy/folder_policy"
  project_id = "${var.project_id}-${var.env}"
  folder_id = var.odfl_folder_id
  folder_members = var.odfl_folder_admins
  role = "roles/resourcemanager.folderAdmin"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "Dynatrace_GCP_Custom_role" {
  source = "./modules/iam/custom_roles"
  project_id = "${var.project_id}-${var.env}"
  custom_role_name = "dynatrace_function.cloud_function_deployment"
  permissions = var.dynatrace_permissions
}


module "compute_instance" {
  source = "./modules/compute_instance"
  project_id                = "${var.project_id}-${var.env}"
  name                     = "${var.vm_instance_name}-${var.env}"
  machine_type             = var.delta_vm_type
  zone                     = var.resources_zone
  tags                     = var.tags
  image                    = "debian-11-bullseye-v20220822"
  auto_delete              = true
  size                     = var.delta_vm_disk_size
  type                     = var.delta_vm_disk_type
  network                  = module.networks.host_vpc_network
  subnetwork               = "projects/odfl-gca-pilot-prod/regions/us-east1/subnetworks/odfl-pilot-subnetwork-prod-us-east1"
  service_account_email = module.hvr_service_account.email
  startup_script_url = "hvr_vm_startup_prod.sh"
  depends_on = [
   module.hvr_vm_storage_access
 ]
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
  # cloudsql_root_password      = module.project_data_cloud_secret_cloudsql.secret
  cloudsql_root_password      = var.cloudsql_root_password
  cloudsql_disk_type          = var.cloudsql_disk_type
  cloudsql_ipv4_enabled       = true
  cloudsql_require_ssl        = false
  cloudsql_zone               = var.cloudsql_zone
  cloudsql_backup_enabled     = true
  cloudsql_binary_log_enabled = false
  cloudsql_start_time         = var.cloudsql_backup_start_time
  vpc_network                 = module.networks.host_vpc_network
  private_ip_address       = var.cloud_sql_ip_range
  private_ip_name          = "odfl-gca-pilot-${var.env}-ip-block"
  private_ip_purpose       = "VPC_PEERING"
  private_ip_address_type  = "INTERNAL"
  private_ip_version       = "IPV4"
  private_ip_prefix_length = 24
  //hvr_vm_ip = module.compute_instance.hvr_vm.network_interface.0.access_config.0.nat_ip
  //hvr_vm_name = module.compute_instance.hvr_vm.name
  depends_on = [
    module.project
  ]
}
