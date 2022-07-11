

module "project" {
  source = "../modules/project"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
}

module "networks" {
  source = "../modules/networks"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
  depends_on = [
    module.project
  ]
}

module "iam" {
  source = "../modules/iam"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
  
}

module "bigquery" {
  source = "../modules/bigquery"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}

module "pubsub" {
  source = "../modules/pubsub"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}


module "cloudsql" {
  source = "../modules/cloudsql"
  project_id = "${var.project_id}-${var.env}"
  env = var.env
   depends_on = [
    module.project
  ]
}

