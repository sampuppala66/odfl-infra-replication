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
