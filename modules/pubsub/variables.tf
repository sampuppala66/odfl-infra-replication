variable "env" {
  type        = string
  description = "Environment"
}


variable "drone_pubsub_name" {
  description = "The name of the drone pubsub reservation"
  type        = string
  default = "drone-reservation"
}