module "folders"{
    source = "../folders"
}

module "project" {
  source = "./modules/project"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
}

module "networks" {
  source = "./modules/networks"
  project_id = "${var.project_id}-${var.env}"
  data_subnetwork_region = var.gcp_region 
  host_project_id = module.project.host_project_id
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
  roles = ["roles/bigquery.user"]
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
module "compute_sevice_account_permissions" {
   source = "./modules/iam/project"
  project_id = "${var.project_id}-${var.env}"
  roles = ["roles/iam.serviceAccountAdmin", ]
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


module "iam" {
  source = "./modules/iam/roles"
  project_id = "${var.project_id}-${var.env}"
  odfl_folder_id = var.odfl_folder_id
  odfl_folder_admins = var.odfl_folder_admins
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

}

# module "pubsub" {
#   source = "./modules/pubsub"
#   project_id = "${var.project_id}-${var.env}"
#   env = var.env
#    depends_on = [
#     module.project
#   ]
# }


# module "project_data_cloud_secret_cloudsql" {
#   source = "./modules/secret_manager"

#   secret_id = "cloud-sql-root-password"
#   project   = var.project_id
#   location  = var.gcp_region

#   length           = 16
#   special          = true
#   override_special = "_%@"
# }

# module "cloudsql" {
#   source = "./modules/cloudsql"
#   project_id = "${var.project_id}-${var.env}"
#   env = var.env
#   cloudsql_tier                      = var.cloudsql_tier
#   cloudsql_disk_size                 = var.cloudsql_disk_size
#   cloudsql_availability_type         = var.cloudsql_availability_type
#   # cloudsql_backup_start_time         = var.cloudsql_backup_start_time
#   cloudsql_name               = var.cloudsql_name
#   cloudsql_region             = var.gcp_region
#   cloudsql_database_version   = var.cloudsql_database_version
#   # cloudsql_root_password      = module.project_data_cloud_secret_cloudsql.secret
#   cloudsql_root_password      = var.cloudsql_root_password
#   cloudsql_disk_type          = var.cloudsql_disk_type
#   cloudsql_ipv4_enabled       = false
#   cloudsql_require_ssl        = false
#   cloudsql_zone               = var.gcp_zone
#   cloudsql_backup_enabled     = true
#   cloudsql_binary_log_enabled = false
#   cloudsql_start_time         = var.cloudsql_backup_start_time
#   vpc_network                 = module.networks.host_vpc_network

#    depends_on = [
#     module.project
#   ]
# }

