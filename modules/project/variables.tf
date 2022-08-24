variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "env" {
  type        = string
  description = "Environment"

}

variable "billing_account"{
  type = string
  description = "The billing account"
}

variable "data_folder_id"{
  type = string
  description = "The data folder id"
}


