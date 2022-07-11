resource "google_folder" "odfl_folder" {
  display_name = var.odfl_folder_name
  parent       = var.organization_path
}


resource "google_folder" "gov_folder" {
  display_name = var.gov_folder_name
  parent       = google_folder.odfl_folder
}

resource "google_folder" "data_folder" {
  display_name = var.drone_folder_name
  parent       =google_folder.odfl_folder
}


resource "google_folder" "shared_folder" {
  display_name = var.shared_folder_name
  parent       = google_folder.odfl_folder
}
