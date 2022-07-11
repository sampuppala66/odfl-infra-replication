resource "google_pubsub_lite_reservation" "data_pubsub" {
  name = var.data_pubsub_name
  project = "${var.project_id}"
  throughput_capacity = 2
}

