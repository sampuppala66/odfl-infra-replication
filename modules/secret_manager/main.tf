/**
 * Generate Secret Password
 */
resource "random_password" "password" {
  length           = var.length
  special          = var.special
  override_special = var.override_special
}

resource "google_secret_manager_secret" "secret_password" {
  secret_id = var.secret_id
  project   = var.project

  replication {
    user_managed {
      replicas {
        location = var.location
      }
    }
  }

  depends_on = [random_password.password]
}

resource "google_secret_manager_secret_version" "secret_password" {
  secret      = google_secret_manager_secret.secret_password.id
  secret_data = random_password.password.result

  depends_on = [google_secret_manager_secret.secret_password]
}

data "google_secret_manager_secret_version" "secret_password" {
  secret  = var.secret_id
  project = var.project

  depends_on = [google_secret_manager_secret_version.secret_password]
}