

module "project" {
  source = "./modules/project"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
}

module "networks" {
  source = "./modules/networks"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
  depends_on = [
    module.project
  ]
}

module "iam" {
  source = "./modules/iam"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
   depends_on = [
    module.project
  ]
  
}

module "bigquery" {
  source = "./modules/bigquery"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "pubsub" {
  source = "./modules/pubsub"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "cloudstorage" {
  source = "./modules/cloudstorage"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
   depends_on = [
    module.project
  ]
}

# module "cloud_functions" {
#   source = "./modules/cloudfunctions"
#   project_id = "${var.project_id}-${var.env}-1"
#   env = var.env
# }

module "cloudsql" {
  source = "./modules/cloudsql"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "firebase" {
  source = "./modules/cloudsql"
  project_id = "${var.project_id}-${var.env}-4"
  env = var.env
   depends_on = [
    module.project
  ]
}