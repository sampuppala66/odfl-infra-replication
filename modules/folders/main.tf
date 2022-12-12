
resource "google_folder" "gov_folder" {
  display_name = var.gov_folder_name
  parent       = var.parent
}

resource "google_folder" "data_folder" {
  display_name = var.data_folder_name
  parent       =var.parent
}


resource "google_folder" "shared_folder" {
  display_name = var.shared_folder_name
  parent       = var.parent
}
