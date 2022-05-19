variable "cloud_sql_name" {
  description = "The name of the db"
  type        = string
  default = "sba-drone-db"
}
variable "env" {
  type        = string
  description = "Environment"
}

variable "drone_database_name" {
  description = "The name of the db"
  type        = string
  default = "sba-drone-db"
}

variable "drone_database_region" {
  description = "The region of the db"
  type        = string
  default = "sba-drone-db"
}

variable "drone_database_version" {
  description = "The version of the db"
  type        = string
  default = ""
}

variable "drone_database_tier" {
  description = "The tier of the db"
  type        = string
  default = "sba-drone-db"
}

variable "drone_database_protection" {
  description = "The database deletion protection"
  type        = string
  default = "true"
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}