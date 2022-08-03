
resource "google_compute_shared_vpc_host_project" "shared_hvpc" {
  project = var.host_project_id
}


resource "google_compute_shared_vpc_service_project" "service_project" {
  host_project    = var.host_project_id
  service_project = "${var.project_id}"
}


resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-${var.env}"
  project   = "${var.host_project_id}"
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
  project   = "${var.host_project_id}"
}


# resource "google_compute_firewall" "rule-allow-tcp" {
#   project     = "${var.host_project_id}"
#   name        = "odfl-fw-ingress-allow-ssh-vm-${var.env}"
#   network     =  google_compute_network.vpc_network.name
#   description = "firewall rule allowing tcp"
#   target_tags = ["allow-ssh"]
#   source_ranges = [ "35.235.240.0/20"]

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "8080", "22", "443",]
#   }
# }


resource "google_compute_firewall" "rule-allow-tcp" {
  project     = "${var.host_project_id}"
  name        = "odfl-fw-ig-allow-gca-pilot-hvrhub-to-hvragent-${var.env}"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule allowing tcp"
  # target_tags = ["*"]
  priority = 1000
  source_ranges = [ "216.54.213.8/29",
                    "216.54.213.80/29",
                    "216.54.213.96/28",
                    "66.162.6.80/28",
                    "209.136.214.192/26",
                    "66.192.161.216/29",
                    "35.248.29.128/26",
                    "50.58.48.248/29"
                  ]

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "443", "4343"]
  }
}

resource "google_compute_firewall" "rule-allow-ips" {
  project     = "${var.host_project_id}"
  name        = "odfl-vm-allow-all-ips"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule allowing ips"
  
  priority = 1500
  source_ranges = [ "0.0.0.0/0"
                   
                  ]

  allow {
    protocol = "tcp"
    ports    = ["80", "22", "4340", "4343"]
  }
}

resource "google_compute_firewall" "rule-allow-iap" {
  project     = "${var.host_project_id}"
  name        = "odfl-fw-ig-allow-gca-pilot-iap"
  network     =  google_compute_network.vpc_network.name
  description = "firewall rule allowing iap"
  
  priority = 2000
  source_ranges = [ "35.235.240.0/20"
                  ]
  allow {
    protocol = "tcp"
    ports    = [ "22"]
  }
}