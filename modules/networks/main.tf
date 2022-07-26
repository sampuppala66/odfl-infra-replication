
# resource "google_compute_shared_vpc_host_project" "shared_hvpc" {
#   project = var.host_project_id
# }


# resource "google_compute_shared_vpc_service_project" "service_project" {
#   host_project    = var.host_project_id
#   service_project = "${var.project_id}"
# }


resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-${var.env}"
  project   = "${var.project_id}"
  auto_create_subnetworks = false

}

# resource "google_compute_subnetwork" "data_subnetwork" {
#   name = "odfl-subnetwork-dev"
#   ip_cidr_range = "10.1.0.0/26"
#   region = var.data_subnetwork_region
#   network = google_compute_network.vpc_network.id
#   project   = "${var.project_id}"
# }

resource "google_compute_subnetwork" "data_subnetwork" {
  name = "${var.subnet_name}-${var.env}"
  ip_cidr_range = var.data_subnetwork_cidr_range
  region = var.data_subnetwork_region
  network = google_compute_network.vpc_network.id
  project   = "${var.project_id}"
}


resource "google_compute_firewall" "rule-allow-tcp" {
  project     = "${var.project_id}"
  name        = "odfl-fw-ingress-allow-ssh-vm-${var.env}"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule allowing tcp"
  target_tags = ["allow-ssh"]
  source_ranges = [ "35.235.240.0/20"]

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "443",]
  }
}
