resource "google_project_iam_custom_role" "custom_role" {
  role_id     = var.custom_role_name
  title       = "${var.custom_role_name} Custom Role"
  description = "${var.custom_role_name} custom roles"
  permissions = var.permissions
  project = var.project_id
}