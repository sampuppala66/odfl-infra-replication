
variable "audit_project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
  default = "odfl-gov-audit"
}

variable "billing_project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
  default = "odfl-gov-billing"
}


variable "project_shared_hvpc_id" {
    description = "The ID of the project in which the resource belongs."
  type        = string
  default = "odfl-shared-hvpc"
}



variable "billing_account"{
  type = string
  description = "The billing account"
}

variable "shared_folder_id"{
  type = string
  description = "The shared folder id"
}

variable "gov_folder_id"{
  type = string
  description = "The gov folder id"
}
