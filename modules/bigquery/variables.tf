variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "location" {
  description = "The dataset location"
  type        = string
}

variable "dataset_description" {
    description = "odfl dataset"
    type = string
}

variable "dataset_id" {
  description = "The id of the dataset"
  type = string
}
