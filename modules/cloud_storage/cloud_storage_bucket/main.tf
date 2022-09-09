resource google_storage_bucket "bucket"{
  project = var.project_id
  name = var.bucket_name
  location = var.storage_location
  storage_class = "STANDARD"
  uniform_bucket_level_access = false
  force_destroy = true
}
