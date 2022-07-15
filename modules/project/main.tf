module "folders"{
    source = "../folders"
}


resource "google_project" "project_data" {
  name            = "${var.project_id}"
  project_id      = "${var.project_id}"
  folder_id          =  module.folders.data_folder_id
  billing_account = var.billing_account
  auto_create_network = false
}

resource "google_project_service" "data_service" {
  for_each = toset([
    "storage-api.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com",
    "iap.googleapis.com"
  ])
  service = each.key
  project            = google_project.project_data.project_id
  disable_dependent_services = true
}

resource "google_project" "project_audit" {
  name            = var.audit_project_name
  project_id      = var.audit_project_id
  folder_id          = module.folders.gov_folder_id
  billing_account = var.billing_account
  auto_create_network = false
}


resource "google_project_service" "audit_service" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "storage-api.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.project_audit.project_id
  disable_dependent_services = true
}


resource "google_project" "project_billing" {
  name            = var.billing_project_name
  project_id      = var.billing_project_id
  folder_id          = module.folders.gov_folder_id
  billing_account = var.billing_account
  auto_create_network = false
}


resource "google_project_service" "billing_service" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "storage-api.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.project_audit.project_id
  disable_dependent_services = true
}

resource "google_project" "project_shared_hpvc" {
  name            = var.project_shared_hpvc_id
  project_id      = var.project_shared_hpvc_id
  folder_id          = module.folders.gov_folder_id
  billing_account = var.billing_account
  auto_create_network = false
}


resource "google_project_service" "hpvc_service" {
  for_each = toset([
    "cloudresourcemanager.googleapis.com",
    "storage-api.googleapis.com",
    "iam.googleapis.com",
    "storage-component.googleapis.com",
    "storage.googleapis.com",
    "bigquery.googleapis.com"
  ])
  service = each.key
  project            = google_project.project_audit.project_id
  disable_dependent_services = true
}
