module "folders" {
  source = "./modules/folders"
  #project_id = var.project_id
}

module "projects" {
  source = "./modules/project"
  project_id = var.project_id
  env = var.env
}

module "networks" {
  source = "./modules/networks"
  project_id = var.project_id
  env = var.env
}

module "iam" {
  source = "./modules/iam"
  project_id = var.project_id
  env = var.env
}

module "bigquery" {
  source = "./modules/bigquery"
  project_id = var.project_id
  env = var.env
}

module "pubsub" {
  source = "./modules/pubsub"
  env = var.env
}

module "cloud_storage" {
  source = "./modules/cloudstorage"
  env = var.env
}

module "cloud_functions" {
  source = "./modules/cloudfunctions"
  env = var.env
}

module "cloud_sql" {
  source = "./modules/cloudsql"
  env = var.env
}

module "firebase" {
  source = "./modules/cloudsql"
  env = var.env
}