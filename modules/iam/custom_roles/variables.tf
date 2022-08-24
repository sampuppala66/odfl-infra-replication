variable "project_id" {
    description = "The project id of the service project"
    type = string
}


variable "custom_role_name" {
    description = "name of the custom role"
    type = string
}

variable "permissions" {
    description = "list of permissions"
    type = list(string)
  
}