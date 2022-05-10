
# resource "google_service_account" "fivetran_service_account" {
#   project      =  "${var.project_id}-${var.env}"
#   account_id   = "cdp-fivetran-coupa-sa"
#   display_name = "Service account for Coupa"
# }

# resource "google_project_iam_binding" "logs_writer" {
#   project     =  "${var.project_id}-${var.env}"
#   role = "roles/logging.logWriter"
#   members = [
#     # "serviceAccount:g-seller-hanging@fivetran-production.iam.gserviceaccount.com"
#   ]
# }
