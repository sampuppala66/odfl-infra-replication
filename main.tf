module "folders" {
  source = "./modules/folders"
}

module "project" {
  source = "./modules/project"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

module "networks" {
  source = "./modules/networks"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

module "iam" {
  source = "./modules/iam"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

module "bigquery" {
  source = "./modules/bigquery"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

module "pubsub" {
  source = "./modules/pubsub"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

module "cloudstorage" {
  source = "./modules/cloudstorage"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

# module "cloud_functions" {
#   source = "./modules/cloudfunctions"
#   project_id = "${var.project_id}-${var.env}-12345"
#   env = var.env
# }

module "cloudsql" {
  source = "./modules/cloudsql"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}

module "firebase" {
  source = "./modules/cloudsql"
  project_id = "${var.project_id}-${var.env}-12345"
  env = var.env
}