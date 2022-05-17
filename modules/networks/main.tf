resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-${var.env}"
  project   = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "drone_subnetwork" {
  name = "${var.subnet_name}-${var.env}"
  ip_cidr_range = var.drone_subnetwork_cidr_range
  region = var.drone_subnetwork_region
  network = google_compute_network.vpc_network.id
  project   = var.project_id
}

resource "google_compute_firewall" "rule-deny-ssh" {
  project     = var.project_id
  name        = "ssh-deny-fw-rule"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule denying ssh"
  source_tags = ["*"]
  deny {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "rule-allow-tcp" {
  project     = var.project_id
  name        = "tcp-allow-firewall-rule"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule allowing tcp"
  source_tags = ["*"]

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
}
