resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-${var.env}"
  project   = "${var.project_id}"
  auto_create_subnetworks = false

}

# resource "google_compute_global_address" "private_ip_address" {
#   name          = "private-ip-address"
#   purpose       = "VPC_PEERING"
#   address_type  = "INTERNAL"
#   prefix_length = 16
#   network       = google_compute_network.vpc_network.id
# }

# resource "google_service_networking_connection" "private_vpc_connection" {
#   network                 = google_compute_network.vpc_network.id
#   service                 = "servicenetworking.googleapis.com"
#   reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
# }


resource "google_compute_subnetwork" "data_subnetwork" {
  name = "${var.subnet_name}-${var.env}"
  ip_cidr_range = var.data_subnetwork_cidr_range
  region = var.data_subnetwork_region
  network = google_compute_network.vpc_network.id
  project   = "${var.project_id}"
}

# resource "google_compute_firewall" "rule-deny-ssh" {
#   project     = "${var.project_id}"
#   name        = "ssh-deny-fw-rule"
#   network     =  google_compute_network.vpc_network.name
#   description = "firewall rule denying ssh"
#   source_tags = ["data"]
#   deny {
#     protocol = "tcp"
#     ports    = ["22"]
#   }
# }

resource "google_compute_firewall" "rule-allow-tcp" {
  project     = "${var.project_id}"
  name        = "tcp-allow-firewall-rule"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule allowing tcp"
  target_tags = ["allow-ssh"]
  source_ranges = [ "35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "443",]
  }
}
