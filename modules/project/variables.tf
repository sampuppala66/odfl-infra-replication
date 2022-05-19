variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "audit_project_name" {
  description = "The name of the project in which the resource belongs."
  type        = string
  default = "sba-gov-audit"
}
variable "audit_project_id" {
    description = "The ID of the project in which the resource belongs."
  type        = string
  default = "sba-gov-audit"
}

variable "gov_folder_id" {
  description = "The ID of the folder in which the resource belongs."
  type        = string
  default = "sba-gov"
}
variable "drone_folder_id" {
  description = "The ID of the folder in which the resource belongs."
  type        = string
  default = "sba-drone"
}

variable "billing_project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
  default = "sba-gov-billing"
}

variable "billing_project_name" {
    description = "The ID of the project in which the resource belongs."
  type        = string
  default = "sba-gov-billing"
}

variable "env" {
  type        = string
  description = "Environment"
}
