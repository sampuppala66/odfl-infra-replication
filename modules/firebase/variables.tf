

variable "drone_firebase_app_name" {
    description = "The firebase app name for the project"
    type = string
    default = "Display name"
}


variable "env" {
  type        = string
  description = "Environment"
}



variable "drone_firebase_project_location_id" {
  description = "The name of the db"
  type        = string
  default = "sba-drone-db"
}

variable "project_id" {
  description = "The name of the db"
  type        = string
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}