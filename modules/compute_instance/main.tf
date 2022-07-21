

resource "google_compute_address" "static" {
  name = "ipv4-address"
}

/**
 * Create compute instance
 */
resource "google_compute_instance" "hvr_agent_vm" {
  project      = var.project_id
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone
  tags         = var.tags
  # hostname = var.hostname

  boot_disk {
    auto_delete = var.auto_delete

    initialize_params {
      image = var.image
      size  = var.size
    }
  }

  network_interface {
    network            = var.network
    subnetwork         = var.subnetwork
    # subnetwork_project = var.subnetwork_project
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }
}


