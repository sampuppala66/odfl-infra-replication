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
    description = "sba dataset"
    type = string
    default = "sba supply chain analytical data"
}

variable "dataset_labels" {
    description = "A mapping of labels to assign to the table"
    type        = map(string)
    default     = {}
}

variable "audit_dataset_name" {
  description = "Name of dataset"
  type = string
  default = "sba-audit"
}

variable "audit_dataset_description" {
  description = "sba audit logs"
  type = string
  default = "sba audit logs data"
}

variable "audit_dataset_id" {
  description = "sba audit logs"
  type = string
  default = "sba audit logs data"
}

variable "drone_dataset_id" {
  description = "sba audit logs"
  type = string
  default = "sba audit logs data"
}

variable "drone_dataset_name" {
  description = "sba audit logs"
  type = string
  default = "sba audit logs data"
}