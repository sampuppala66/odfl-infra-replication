

resource "google_service_account" "hvr_service_account" {
  project      =  var.project_id
  account_id   = var.service_account_id
  display_name = var.service_account_id
  description = "hvr service account"
}



# resource "google_project_iam_binding" "system_admin" {
#   project     =  "${var.project_id}"
#   role = "roles/iam.serviceAccountUser"
#   members = []
# }

# resource "google_project_iam_binding" "odfl_admin" {
#   project     =  "${var.project_id}"
#   roles = ["roles/roles/resourcemanager.folderAdmin", "roles/resourcemanager.folderIamAdmin"]
#   members = ["sam.puppala@panderasystems.com"]
# }

resource "google_folder_iam_policy" "odfl_folder_policy" {
  folder      = "folders/878125556822"
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/resourcemanager.folderAdmin"

    members = [
      "user:sam.puppala@panderasystems.com",
      "user:joshua.ibrahim@panderasystems.com"
    ]
  }
}

# resource "google_project_iam_binding" "compute_admin" {
#   project     =  "${var.project_id}"
#   role = "roles/compute.admin"
#   members = []
# }

# # resource "google_project_iam_binding" "log_admin" {
# #   project     =  "${var.project_id}"
# #   role = " roles/logging.admin "
# #   members = []
# # }

# resource "google_project_iam_binding" "monitoring_admin" {
#   project     =  "${var.project_id}"
#   role = "roles/monitoring.admin"
#   members = []
# }

# resource "google_project_iam_binding" "dns_reader" {
#   project     =  "${var.project_id}"
#   role = "roles/dns.reader"
#   members = []
# }

# # resource "google_project_iam_binding" "compute_network_viewer" {
# #   project     =  "${var.project_id}"
# #   role = " roles/compute.networkViewer"
# #   members = []
# # }

# resource "google_project_iam_binding" "container_admin" {
#   project     =  "${var.project_id}"
#   role = "roles/container.admin"
#   members = []
# }

# # resource "google_project_iam_binding" "project_creatorNote" {
# #   project     =  "${var.project_id}"
# #   role = " roles/project.creatorNote"
# #   members = []
# # }

# resource "google_project_iam_binding" "storage_admin" {
#   project     =  "${var.project_id}"
#   role = "roles/storage.admin"
#   members = []
# }


resource "google_project_iam_binding" "bigquery_user" {
  project     = "${var.project_id}"
  role = "roles/bigquery.user"
    members = ["user:carter.richard@panderasystems.com",
               "group:ADFS_GCP-Developers@odfl.com",
               "serviceAccount:${google_service_account.hvr_service_account.email}"]
}

resource "google_project_iam_binding" "bigquery_editor" {
  project     =  "${var.project_id}"
  role = "roles/bigquery.dataEditor"
  members = ["user:carter.richard@panderasystems.com", 
            "group:ADFS_GCP-Developers@odfl.com", 
            "serviceAccount:${google_service_account.hvr_service_account.email}"]
}


resource "google_project_iam_binding" "cloudsql_admin" {
  project     =  "${var.project_id}"
  role = "roles/cloudsql.admin"
  members = ["user:joshua.ibrahim@panderasystems.com",
             "group:ADFS_GCP-Developers@odfl.com",
              "user:carter.richard@panderasystems.com",
              "user:sam.puppala@panderasystems.com"
              ]
}



resource "google_project_iam_binding" "service_account_admin" {
  project     =  "${var.project_id}"
  role = "roles/iam.serviceAccountAdmin"
  members = ["user:joshua.ibrahim@panderasystems.com",
              "user:sam.puppala@panderasystems.com"
              ]
}


resource "google_project_iam_binding" "cloudsql_client" {
  project     =  "${var.project_id}"
  role = "roles/cloudsql.client"
  members = ["serviceAccount:${google_service_account.hvr_service_account.email}"]
}