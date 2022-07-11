variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "audit_project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "odfl-gov-audit"
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "location" {
  description = "The dataset location"
  type        = string
  default     = "us-central1"
}

variable "dataset_name" {
  description = "Name of dataset"
  type = string
  default = "coupa"
}

variable "dataset_description" {
    description = "odfl dataset"
    type = string
    default = "odfl supply chain analytical data"
}

variable "dataset_labels" {
    description = "A mapping of labels to assign to the table"
    type        = map(string)
    default     = {}
}

variable "audit_dataset_name" {
  description = "Name of dataset"
  type = string
  default = "odfl-audit-logs"
}

variable "audit_dataset_description" {
  description = "odfl audit logs"
  type = string
  default = "odfl audit logs data"
}

variable "audit_dataset_id" {
  description = "odfl audit logs"
  type = string
  default = "odfl_gov_audit_logs"
}

variable "data_dataset_id" {
  description = "odfl audit logs"
  type = string
  default = "odfl_data_data"
}

variable "data_dataset_name" {
  description = "odfl audit logs"
  type = string
  default = "odfl audit logs data"
}