

resource "google_compute_firewall" "firewall_rule" {
  project     = var.project_id
  name        = var.firewall_name
  network     =  var.vpc_network
  description = var.description
  target_tags = var.tags
  priority = var.priority
  source_ranges = var.source_ranges
  allow {
    protocol = var.protocol
    ports    = var.ports
  }
}
