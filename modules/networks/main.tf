
resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-${var.env}"
  project   = var.project_id
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "data_subnetwork" {
  name = "${var.subnet_name}-${var.env}"
  ip_cidr_range = var.data_subnetwork_cidr_range
  region = var.data_subnetwork_region
  network = google_compute_network.vpc_network.id
  project   = var.project_id
}


