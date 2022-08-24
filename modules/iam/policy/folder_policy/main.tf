
data "google_iam_policy" "admin" {
  binding {
    role = var.role
    members = var.folder_members  
  }
}

resource "google_folder_iam_policy" "odfl_folder_policy" {
  folder      = var.odfl_folder_id
  policy_data = data.google_iam_policy.admin.policy_data
}

