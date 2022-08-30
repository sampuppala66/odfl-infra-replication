
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
  data_subnetwork_region = var.gcp_region 
  env = var.env
  vpc_name = var.vpc_name
  subnet_name = var.subnet_name
  
  depends_on = [
    module.project
  ]
}


module "hvr_service_acount" {
  source = "./modules/service_account/create"
  project      ="${var.project_id}-${var.env}"
  account_id   = "${var.service_account_name}-${var.env}"
  display_name = "${var.service_account_name}-${var.env}"
  description = "hvr service account"
}

# data "google_compute_default_service_account" "sv-ingestion" {
#   project      =  "${var.project_id}-${var.env}"

# }

module "compute_service_account" {
  source = "./modules/service_account/create"
  project      ="${var.project_id}-${var.env}"
  account_id   = "odfl-pilot-vm-sa-${var.env}"
  display_name = "odfl-pilot-vm-sa-${var.env}"
  description = "compute service account"
}


module "service_account_admin" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/iam.serviceAccountAdmin"]
  members = var.service_account_admins
  env = var.env

   depends_on = [
    module.project
  ]
  
}

module "cloudsql_admins" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/iam.serviceAccountAdmin"]
  members = var.cloudsql_admins
  env = var.env

   depends_on = [
    module.project
  ]
}

module "bigquery_user" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/bigquery.user", "roles/bigquerydatapolicy.maskedReader", "roles/datacatalog.categoryFineGrainedReader"]
  members = var.bigquery_users
  env = var.env
  
   depends_on = [
    module.project
  ]
  
}

module "bigquery_editor" {
  source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/bigquery.dataEditor"]
  members = var.bigquery_editors
  env = var.env
  
   depends_on = [
    module.project
  ]
  
}

##service accounts
module "compute_service_account_permissions" {
   source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/iam.serviceAccountAdmin","roles/bigquery.dataEditor",
            "roles/cloudsql.client", "roles/compute.admin","roles/compute.instanceAdmin",
            "roles/compute.instanceAdmin.v1" ]
  members = ["serviceAccount:${module.compute_service_account.email}"]
  env = var.env
  
   depends_on = [
    module.project
  ]
  
}

module "hvr_sevice_account_permissions" {
   source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/cloudsql.client", "roles/bigquery.dataEditor", "roles/bigquery.user"]
  members = ["serviceAccount:${module.hvr_service_acount.email}"]
  env = var.env
  
  depends_on = [
    module.project
  ]
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

module "bigquery_dataset" {
  source = "./modules/bigquery"
  dataset_id = "Odfl_gca_bq_dataset_${var.env}"
  location = var.gcp_region
  dataset_description = "Bigquery dataset"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}


module "Dynatrace_GCP_Custom_role" {
  source = "./modules/iam/custom_roles"
  project_id = "${var.project_id}-${var.env}"
  custom_role_name = "Dynatrace_GCP_Function_cloud_${var.env}"
  permissions = ["appengine.applications.create",
                 "appengine.applications.get",
                 "cloudfunctions.functions.create",
                 "cloudfunctions.functions.get",
                 "cloudfunctions.functions.getIamPolicy",
                 "cloudfunctions.functions.list",
                 "cloudfunctions.functions.sourceCodeSet",
                 "cloudfunctions.functions.update",
                 "cloudfunctions.operations.get",
                 "cloudfunctions.operations.list",
                 "cloudscheduler.jobs.create",
                 "cloudscheduler.jobs.delete",
                 "cloudscheduler.jobs.get",
                 "cloudscheduler.jobs.list",
                 "cloudscheduler.locations.list",
                 "iam.roles.create",
                 "iam.roles.list",
                 "iam.roles.update",
                 "iam.serviceAccounts.actAs",
                 "iam.serviceAccounts.create",
                 "iam.serviceAccounts.getIamPolicy",
                 "iam.serviceAccounts.list",
                 "iam.serviceAccounts.setIamPolicy",
                 "monitoring.dashboards.create",
                 "monitoring.dashboards.list",
                 "pubsub.topics.create",
                 "pubsub.topics.list",
                 "pubsub.topics.update",
                 "resourcemanager.projects.get",
                 "resourcemanager.projects.getIamPolicy",
                "resourcemanager.projects.setIamPolicy",
                "secretmanager.secrets.create",
                "secretmanager.secrets.getIamPolicy",
                "secretmanager.secrets.list",
                "secretmanager.secrets.setIamPolicy",
                "secretmanager.versions.add",
                "secretmanager.versions.list",
                "serviceusage.services.enable"
                ]
  }


module "compute_instance" {
  source = "./modules/compute_instance"
  project_id                = "${var.project_id}-${var.env}"
  name                     = "${var.vm_instance_name}-${var.env}"
  machine_type             = var.delta_vm_type
  zone                     = var.resources_zone
  tags                     = ["allow-ssh"]
  image                    = "ubuntu-1804-bionic-v20210412"
  auto_delete              = true
  size                     = var.delta_vm_disk_size
  type                     = var.delta_vm_disk_type
  network                  = module.networks.host_vpc_network
  subnetwork               = module.networks.vpc_subnetwork
  service_account_email = module.compute_service_account.email
  # subnetwork_project       =  "${var.project_id}-${var.env}"
  instance_image_link = var.instance_image_link

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
  cloudsql_ipv4_enabled       = false
  cloudsql_require_ssl        = false
  cloudsql_zone               = var.gcp_zone
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

   depends_on = [
    module.project
  ]
}


