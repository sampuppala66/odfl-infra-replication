resource "google_folder" "gov_folder" {
  display_name = var.gov_folder_name
  parent       = "organizations/834347040152"
}
resource "google_folder" "drone_folder" {
  display_name = var.drone_folder_name
  parent       = "organizations/834347040152"
}
