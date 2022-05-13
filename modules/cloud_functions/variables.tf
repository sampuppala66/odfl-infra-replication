variable "env" {
  type        = string
  description = "Environment"
}


variable "drone_cloud_function_bucket_name" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "sba-drone-bucket"
}


variable "drone_archive_source" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "./path/to/zip/file/which/contains/code"

}

variable "drone_archive_name" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "sba-drone-function"

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
  default = "nodejs14"

}

variable "drone_archive_name" {
  description = "The name of the bucket reserved for the google cloud function"
  type        = string
  default = "index.zip"

}

