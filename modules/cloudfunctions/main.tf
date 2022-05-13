resource "google_storage_bucket" "drone_cloud_function_bucket" {
  name     = var.drone_cloud_function_bucket_name
  location = "US"
}

resource "google_storage_bucket_object" "drone_archive" {
  name   = var.drone_archive_name
  bucket = google_storage_bucket.drone_cloud_function_bucket.name
  source = var.drone_archive_source
}


resource "google_cloudfunctions_function" "drone_function" {
  name        = var.drone_function_name
  description = var.cloud_function_description
  runtime     = var.cloud_function_runtime

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.drone_cloud_function_bucket.name
  source_archive_object = google_storage_bucket_object.drone_archive.name
  trigger_http          = true
  timeout               = 60
  entry_point           = var.cloud_function_entry_point
#   labels = {
#     my-label = "my-label-value"
#   }

#   environment_variables = {
#     MY_ENV_VAR = "my-env-var-value"
#   }
}