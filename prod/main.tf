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
}

