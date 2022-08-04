# resource "google_compute_address" "static" {
#   name = "ipv4-address"
# }

/**
 * Create compute instance
 */
# resource "google_compute_instance" "hvr_agent_vm" {
#   project      = var.project_id
#   name         = var.name
#   machine_type = var.machine_type
#   zone         = var.zone
#   tags         = var.tags
#   allow_stopping_for_update = true 
#   # hostname = var.hostname

#   boot_disk {
#     auto_delete = var.auto_delete

#     initialize_params {
#       image = var.image
#       size  = var.size
#     }
#   }

#   network_interface {
#     network            = var.network
#     subnetwork         = var.subnetwork
#     # subnetwork_project = var.subnetwork_project
#     # access_config {
#     #   nat_ip = google_compute_address.static.address
#     # }
#   }
  
#   service_account {
#     # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
#     email  = var.service_account_email
#     scopes = ["cloud-platform"]
#   }

# metadata = {
#         enable-os-login = "true"
#   }
# }

resource "google_compute_instance_template" "hvr_instance" {
  name  = var.name
  machine_type = var.machine_type
  project      = var.project_id

  disk {
    source_image = var.instance_image_link
  }
}


data "google_iam_policy" "admin" {
  binding {
    role = "roles/iap.tunnelResourceAccessor"
    members = [
      "user:sam.puppala@panderasystems.com",
      "user:carter.richard@panderasystems.com",
      "user:joshua.ibrahim@panderasystems.com"
    ]
  }
}


resource "google_iap_tunnel_instance_iam_policy" "policy" {
  project = google_compute_instance_template.hvr_instance.project
  # zone = google_compute_instance_template.hvr_instance.zone
  instance = google_compute_instance_template.hvr_instance.name
  policy_data = data.google_iam_policy.admin.policy_data
}




