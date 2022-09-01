
resource "google_compute_network" "vpc_network" {
  name = "${var.vpc_name}-${var.env}"
  project   = var.project_id
  auto_create_subnetworks = false
}


//resource "google_compute_subnetwork" "data_subnetwork" {
//  name = "${var.subnet_name}-${var.env}"
//  ip_cidr_range = var.data_subnetwork_cidr_range
//  region = var.data_subnetwork_region
//  network = google_compute_network.vpc_network.id
//  project   = var.project_id
//}


resource "google_compute_subnetwork" "data_subnetwork" {
    for_each = toset(var.subnetwork_regions)

    name = "${var.subnet_name}-${var.env}-${each.value}"
    ip_cidr_range = var.data_subnetwork_cidr_range
    region = each.key
    network = google_compute_network.vpc_network.self_link
    project   = var.project_id

}

