variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "env" {
  description = "Environment"
  type = string
}

variable "folder_id" {
  description = "folder Id"
  type = string
}


variable "folder_members" {
  description = " the folder admins"
  type = list(string)
}

variable "role" {
  description = " the folder role"
  type = string
  default = "roles/resourcemanager.folderAdmin"
}