variable "env" {
  type        = string
  description = "Environment"
}

variable "drone_storage_name" {
  description = "The name of the db"
  type        = string
  default = "sba-drone-s3"
}

variable "drone_storage_location" {
  description = "The name of the db"
  type        = string
  default = "sba-drone-db"
}
variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}