variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "ports" {
    description = "the ports enabled "
    type = list(string)
}
variable "firewall_name" {
    description = "subnet name"
    type = string
    default = "the name of the firewall rule"
}
variable "env" {
  type        = string
  description = "Environment"
}

variable "source_ranges" {
  description = "The source ranges "
  type = list(string)
}


variable "description" {
  description = "The description of the firewall rule"
  type = string
  
}

variable "vpc_network" {
  description = "vpc network"
  type = string
}


variable "priority" {
  description = "priority of the rule"
  type = number
}

variable "protocol" {
  description = "The targeted protocol"
  type = string
}