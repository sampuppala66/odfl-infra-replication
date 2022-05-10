variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "sba-drone"
}
variable "vpc_name" {
    description = "vpc name"
    type = string
    default = "sba-hostvpc"
}
variable "subnet_name" {
    description = "subnet name"
    type = string
    default = "sba-subnetwork"
}
variable "env" {
  type        = string
  description = "Environment"
}

variable "drone_subnetwork_cidr_range" {
  description = "The ip_cidr_range for the subnetwork"
  type = string
  default = "10.1.0.0/26"
  
}

variable "drone_subnetwork_region" {
  description = "The region for the for the subnetwork"
  type = string
  default = "us-central1"
  
}