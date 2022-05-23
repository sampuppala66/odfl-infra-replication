variable "cloud_sql_name" {
  description = "The name of the db"
  type        = string
  default = "cloudsql-2"
}
variable "env" {
  type        = string
  description = "Environment"
}

variable "drone_database_name" {
  description = "The name of the db"
  type        = string
  default = "dronedb-3"
}

variable "drone_database_region" {
  description = "The region of the db"
  type        = string
  default = "us-central1"
}

variable "drone_database_version" {
  description = "The version of the db"
  type        = string
  default = "MYSQL_8_0"
}

variable "drone_database_tier" {
  description = "The tier of the db"
  type        = string
  default = "db-f1-micro"
}

variable "drone_database_protection" {
  description = "The database deletion protection"
  type        = string
  default = "false"
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}