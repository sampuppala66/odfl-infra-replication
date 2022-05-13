module "folders" {
  source = "../modules/folders"
  #project_id = var.project_id
}
module "projects" {
  source = "../modules/project"
  project_id = var.project_id
  env = var.env
}
module "networks" {
  source = "../modules/networks"
  project_id = var.project_id
  env = var.env
}
module "iam" {
  source = "../modules/iam"
  project_id = var.project_id
  env = var.env
}

module "bigquery" {
  source = "../modules/bigquery"
  project_id = var.project_id
  env = var.env
}


module "pubsub" {
  source = "../modules/pubsub"
  project_id = var.project_id
  env = var.env
}

module "cloud_storage" {
  source = "../modules/cloud_storage"
  project_id = var.project_id
  env = var.env
}

module "cloud_functions" {
  source = "../modules/cloud_functions"
  project_id = var.project_id
  env = var.env
}

module "cloud_sql" {
  source = "../modules/cloud_sql"
  project_id = var.project_id
  env = var.env
}

module "firebase" {
  source = "../modules/cloud_sql"
  project_id = var.project_id
  env = var.env
}