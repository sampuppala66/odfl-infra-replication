variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "sba-drone"
}
variable "credential_file" {
  type        = string
  description = "Service account key file"
  default     = "./sba-devops-terraform-20950a7a4e21.json"
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
  default = "sba-devops-terraform"
}