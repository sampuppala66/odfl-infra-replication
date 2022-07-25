/**
 * Enable permissions on service account on project
 */
resource "google_project_iam_binding" "project_binding" {
  for_each = toset(var.roles)
  project     = "${var.project_id}"
  members = var.members
  role = each.value
}
  
   
