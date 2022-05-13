variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "sba-drone"
}
variable "audit_project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "sba-gov-audit-345113"
}
variable "env" {
  description = "Environment"
  type = string
}

variable "cloud_sql_name" {
  description = "The name of the db"
  type        = string
  default = "sba-drone-db"
}
