variable "env" {
  type        = string
  description = "Environment"
}


variable "drone_pubsub_name" {
  description = "The name of the drone pubsub reservation"
  type        = string
  default = "drone-reservation"
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}