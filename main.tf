
module "project" {
  source = "./modules/project"
  project_id = "${var.project_id}-${var.env}"
  data_folder_id = var.data_folder_id
  billing_account = var.billing_account
  env = var.env
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
  source_ranges = var.tcp_source_ranges
  vpc_network = module.networks.host_vpc_network
  env = var.env
  priority = 1000
  protocol = "tcp"
}

module "hvr_service_account" {
  source = "./modules/service_account/create"
  project      ="${var.project_id}-${var.env}"
  account_id   = "${var.service_account_name}-${var.env}"
  display_name = "${var.service_account_name}-${var.env}"
  description = "hvr service account"
}


data "google_compute_default_service_account" "hvr_service_account" {
   project      =  "${var.project_id}-${var.env}"
}

module "hvr_service_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/bigquery.user",
            "roles/bigquerydatapolicy.maskedReader",
            "roles/datacatalog.categoryFineGrainedReader",
            "roles/iam.serviceAccountAdmin",
            "roles/bigquery.dataEditor",
            "roles/cloudsql.client",
            "roles/compute.admin",
            "roles/compute.instanceAdmin",
            "roles/compute.instanceAdmin.v1"
  ]

  members = [
              "serviceAccount:${module.hvr_service_account.email}"
            ]
  env = var.env
  
   depends_on = [
   module.project
  ]
}

module "developer_permissions" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/bigquery.dataViewer"]

  members = var.developer_users
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

module "hvr_vm_startup_storage" {
  source = "./modules/cloud_storage/cloud_storage_bucket"
  storage_location = var.gcp_region
  bucket_name = "odfl-vm-startup-${var.env}"
  project_id = "${var.project_id}-${var.env}"
}

module "hvr_vm_startup_script" {
  source = "./modules/cloud_storage/cloud_storage_object"
  bucket = module.hvr_vm_startup_storage.bucket.name
  file_name = "./hvr_vm_startup.sh.txt"
  project_id =  "${var.project_id}-${var.env}"
  object_name = "hvr_vm_startup_${var.env}.sh.txt"

}

//module "Dynatrace_GCP_Custom_role" {
//  source = "./modules/iam/custom_roles"
//  project_id = "${var.project_id}-${var.env}"
//  custom_role_name = "Dynatrace_GCP_Function_cloud_${var.env}"
//  permissions = ["appengine.applications.create",
//                 "appengine.applications.get",
//                 "cloudfunctions.functions.create",
//                 "cloudfunctions.functions.get",
//                 "cloudfunctions.functions.getIamPolicy",
//                 "cloudfunctions.functions.list",
//                 "cloudfunctions.functions.sourceCodeSet",
//                 "cloudfunctions.functions.update",
//                 "cloudfunctions.operations.get",
//                 "cloudfunctions.operations.list",
//                 "cloudscheduler.jobs.create",
//                 "cloudscheduler.jobs.delete",
//                 "cloudscheduler.jobs.get",
//                 "cloudscheduler.jobs.list",
//                 "cloudscheduler.locations.list",
//                 "iam.roles.create",
//                 "iam.roles.list",
//                 "iam.roles.update",
//                 "iam.serviceAccounts.actAs",
//                 "iam.serviceAccounts.create",
//                 "iam.serviceAccounts.getIamPolicy",
//                 "iam.serviceAccounts.list",
//                 "iam.serviceAccounts.setIamPolicy",
//                 "monitoring.dashboards.create",
//                 "monitoring.dashboards.list",
//                 "pubsub.topics.create",
//                 "pubsub.topics.list",
//                 "pubsub.topics.update",
//                 "resourcemanager.projects.get",
//                 "resourcemanager.projects.getIamPolicy",
//                 "resourcemanager.projects.setIamPolicy",
//                 "secretmanager.secrets.create",
//                 "secretmanager.secrets.getIamPolicy",
//                 "secretmanager.secrets.list",
//                 "secretmanager.secrets.setIamPolicy",
//                 "secretmanager.versions.add",
//                 "secretmanager.versions.list",
//                 "serviceusage.services.enable"
//                ]
//  }


//module "compute_instance" {
//  source = "./modules/compute_instance"
//  project_id                = "${var.project_id}-${var.env}"
//  name                     = "${var.vm_instance_name}-${var.env}"
//  machine_type             = var.delta_vm_type
//  zone                     = var.resources_zone
//  tags                     = ["allow-ssh"]
//  image                    = "ubuntu-1804-bionic-v20210412"
//  auto_delete              = true
//  size                     = var.delta_vm_disk_size
//  type                     = var.delta_vm_disk_type
//  network                  = module.networks.host_vpc_network
//  subnetwork               = module.networks.vpc_subnetwork
//  service_account_email = module.hvr_service_account.email
//
//
//}


//module "cloudsql" {
//  source = "./modules/cloudsql"
//  project_id = "${var.project_id}-${var.env}"
//  env = var.env
//  cloudsql_tier                      = var.cloudsql_tier
//  cloudsql_disk_size                 = var.cloudsql_disk_size
//  cloudsql_availability_type         = var.cloudsql_availability_type
//  # cloudsql_backup_start_time         = var.cloudsql_backup_start_time
//  cloudsql_name               = var.cloudsql_name
//  cloudsql_region             = var.gcp_region
//  cloudsql_database_version   = var.cloudsql_database_version
//  # cloudsql_root_password      = module.project_data_cloud_secret_cloudsql.secret
//  cloudsql_root_password      = var.cloudsql_root_password
//  cloudsql_disk_type          = var.cloudsql_disk_type
//  cloudsql_ipv4_enabled       = true
//  cloudsql_require_ssl        = false
//  cloudsql_zone               = var.cloudsql_zone
//  cloudsql_backup_enabled     = true
//  cloudsql_binary_log_enabled = false
//  cloudsql_start_time         = var.cloudsql_backup_start_time
//  vpc_network                 = module.networks.host_vpc_network
//  private_ip_address       = var.cloud_sql_ip_range
//  private_ip_name          = "odfl-gca-pilot-${var.env}-ip-block"
//  private_ip_purpose       = "VPC_PEERING"
//  private_ip_address_type  = "INTERNAL"
//  private_ip_version       = "IPV4"
//  private_ip_prefix_length = 24
//  hvr_vm = module.compute_instance.hvr_vm
//
//  depends_on = [
//    module.project
//  ]
//}

