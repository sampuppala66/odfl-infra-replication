/**
 * Variables 
 */
variable "secret_id" {
  description = "This must be unique within the project."
  type        = string
}

variable "project" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "location" {
  description = "The canonical IDs of the location to replicate data. For example: `us-east1`."
  type        = string
}

variable "length" {
  description = "The length of the string desired for the password."
  type        = number
}

variable "special" {
  description = "Include special characters in the result. These are !@#$%&*()-_=+[]{}<>:?"
  type        = bool
}

variable "override_special" {
  description = "Supply your own list of special characters to use for string generation. This overrides the default character list in the special argument. The special argument must still be set to true for any overwritten characters to be used in generation."
  type        = string
}