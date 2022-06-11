resource "google_pubsub_lite_reservation" "drone_pubsub" {
  name = var.drone_pubsub_name
  project = "${var.project_id}"
  throughput_capacity = 2
}

