resource "google_storage_object_access_control" "acls" {
  object = var.object_name
  bucket = var.bucket
  role   = "READER"
  entity = var.service_account
}
