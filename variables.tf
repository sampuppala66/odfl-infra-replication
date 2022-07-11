variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "odfl-gca-pilot"
}
variable "credential_file" {
  type        = string
  description = "Service account key file"
  default     = "./odfl-devops-terraform-777240d02250.json"
}
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}
variable "env" {
  type        = string
  description = "Environment"
}

variable "terraform_project_id" {
  type        = string
  description = "Environment"
  default = "odfl-devops-terraform"
}