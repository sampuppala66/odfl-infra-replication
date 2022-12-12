
resource "google_project" "project_data" {
  name            = var.project_id
  project_id      = var.project_id
  folder_id          =  var.data_folder_id
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
    "iap.googleapis.com",
    "servicenetworking.googleapis.com",
    "dlp.googleapis.com",
    "datacatalog.googleapis.com",
    "bigquerydatapolicy.googleapis.com",
    "compute.googleapis.com",
    "serviceusage.googleapis.com",
    "secretmanager.googleapis.com",
    "sqladmin.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "bigqueryconnection.googleapis.com",
    "pubsub.googleapis.com",
    "cloudscheduler.googleapis.com",
    "bigquerydatapolicy.googleapis.com",
    "bigquerymigration.googleapis.com",
    "bigqueryreservation.googleapis.com",
    "bigquerystorage.googleapis.com",
    "autoscaling.googleapis.com",
    "cloudbuild.googleapis.com",
    "dlp.googleapis.com",
    "datastore.googleapis.com",
    "clouddebugger.googleapis.com",
    "cloudfunctions.googleapis.com",
    "oslogin.googleapis.com",
    "sql-component.googleapis.com",
    "cloudtrace.googleapis.com",
    "datacatalog.googleapis.com",
    "iamcredentials.googleapis.com",
    "container.googleapis.com",
    "servicemanagement.googleapis.com",
    "cloudapis.googleapis.com",
    "logging.googleapis.com",
    "servicenetworking.googleapis.com",
    "opsconfigmonitoring.googleapis.com",
    "appengine.googleapis.com"
  ])
  service = each.key
  project = google_project.project_data.project_id
  disable_dependent_services = true
}
