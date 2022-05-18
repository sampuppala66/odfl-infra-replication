variable "env" {
  type        = string
  description = "Environment"
}


variable "drone_cloud_function_bucket_name" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "sba-drone-cloudfunction-bucket"
}

variable "storage_bucket_location" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "US"

}
variable "drone_archive_name" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "index.zip"

}

variable "drone_archive_source" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "./path/to/zip/file/which/contains/code"

}

variable "drone_function_name" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "sba-drone-function"

}

variable "entry_point" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "helloGet"

}

variable "cloud_function_runtime" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "nodejs14"

}


variable "cloud_function_description" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "The cloud function resource"

}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "cloud_function_entry_point" {
  description = "the entypoint off the function"
  type        = string
  default = "/"
}
