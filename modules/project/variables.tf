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

variable "gov_folder_id" {
  description = "The ID of the folder in which the resource belongs."
  type        = string
  default = "958951584553"
}
variable "drone_folder_id" {
  description = "The ID of the folder in which the resource belongs."
  type        = string
  default = "490944686407"
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

variable "env" {
  type        = string
  description = "Environment"

}

variable "billing_account"{
  type = string
  description = "The billing account"
  default = "01576B-0CD5E1-6341D4"
}
