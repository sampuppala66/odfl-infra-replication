variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "audit_project_name" {
  description = "The name of the project in which the resource belongs."
  type        = string
  default = "odfl-gov-audit"
}
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

variable "billing_project_name" {
    description = "The ID of the project in which the resource belongs."
  type        = string
  default = "odfl-gov-billing"
}

variable "project_shared_hvpc_id" {
    description = "The ID of the project in which the resource belongs."
  type        = string
  default = "odfl-shared-hvpc"
}

variable "env" {
  type        = string
  description = "Environment"

}

variable "billing_account"{
  type = string
  description = "The billing account"
}

variable "data_folder_id"{
  type = string
  description = "The data folder id"
}

variable "shared_folder_id"{
  type = string
  description = "The shared folder id"
}

variable "gov_folder_id"{
  type = string
  description = "The gov folder id"
}
