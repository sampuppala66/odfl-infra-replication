resource "google_storage_bucket_object" "object" {
  name   = var.object_name
  source = var.file_name
  bucket = var.bucket
}
