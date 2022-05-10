resource "google_folder" "gov_folder" {
  display_name = var.gov_folder_name
  parent       = var.organization_path
}

resource "google_folder" "drone_folder" {
  display_name = var.drone_folder_name
  parent       = var.organization_path
}
