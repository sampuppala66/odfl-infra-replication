variable "drone_project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
  default = "sba-drone"
}
variable "audit_project_name" {
  description = "The name of the project in which the resource belongs."
  type        = string
  default = "sba-gov-audit"
}
variable "audit_project_id" {
    description = "The ID of the project in which the resource belongs."
  type        = string
  default = "sba-gov-audit-123445"
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
  default = "sba-gov-billing-123445"
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
