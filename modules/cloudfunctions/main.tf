data "archive_file" "source" {
    type        = "zip"
    source_dir  = "../src"
    output_path = "/tmp/function.zip"
}

resource "google_storage_bucket" "drone_cloud_function_bucket" {
  name     = var.drone_cloud_function_bucket_name
  location = var.storage_bucket_location
  project = var.project_id
}


resource "google_storage_bucket_object" "zip" {
    source       = data.archive_file.source.output_path
    content_type = "application/zip"

    name         = "src-${data.archive_file.source.output_md5}.zip"
    bucket       = google_storage_bucket.drone_cloud_function_bucket.name

    depends_on   = [
        google_storage_bucket.drone_cloud_function_bucket,
        data.archive_file.source
    ]
}


resource "google_cloudfunctions_function" "drone_function" {
  name        = var.drone_function_name
  description = var.cloud_function_description
  runtime     = var.cloud_function_runtime
  project = var.project_id

  available_memory_mb   = 128
  source_archive_bucket = google_storage_bucket.drone_cloud_function_bucket.name
  source_archive_object = google_storage_bucket_object.zip.name
  trigger_http          = true
  timeout               = 60
  entry_point           = var.entry_point


   depends_on            = [
        google_storage_bucket.drone_cloud_function_bucket, 
        google_storage_bucket_object.zip
    ]
}