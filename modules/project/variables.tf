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

variable "audit_folder_id" {
  description = "The ID of the folder in which the resource belongs."
  type        = string
  default = "452593624721"
}
variable "drone_folder_id" {
  description = "The ID of the folder in which the resource belongs."
  type        = string
  default = "668637149123"
}
variable "env" {
  type        = string
  description = "Environment"
}
