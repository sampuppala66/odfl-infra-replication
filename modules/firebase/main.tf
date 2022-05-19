
resource "google_firebase_project" "drone_firebase_project" {
  project  = "${var.project_id}"
}

resource "google_firebase_project_location" "drone_firebase_project_location" {
    project = google_firebase_project.drone_firebase_project.project

    location_id = var.drone_firebase_project_location_id
}

resource "google_firebase_web_app" "drone_firebase_app" {
    project = "${var.project_id}"
    display_name = var.drone_firebase_app_name

    depends_on = [google_firebase_project.drone_firebase_project]
}

