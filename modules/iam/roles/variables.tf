variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "env" {
  description = "Environment"
  type = string
}


variable "odfl_folder_id" {
  description = "ODFL folder Id"
  type = string
}


variable "odfl_folder_admins" {
  description = "ODFL folder admins"
  type = list(string)
}