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
  folder      = var.odfl_folder_id
  policy_data = data.google_iam_policy.admin.policy_data
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/resourcemanager.folderAdmin"

    members = var.odfl_folder_admins  
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




