/**
 * Variables
 */
variable "project" {
  description = ""
  type        = string
}

variable "account_id" {
  description = "The account id that is used to generate the service account email address and a stable unique id. It is unique within a project, must be 6-30 characters long, and match the regular expression [a-z]([-a-z0-9]*[a-z0-9]) to comply with RFC1035. Changing this forces a new service account to be created."
  type        = string
}

variable "display_name" {
  description = "The display name for the service account. Can be updated without creating a new resource."
  type        = string
}

variable "description" {
  description = "A text description of the service account. Must be less than or equal to 256 UTF-8 bytes."
  type        = string
}

variable "sa_users" {
  description = "A text description of the service account. Must be less than or equal to 256 UTF-8 bytes."
  type        = list(string)
}

variable "roles" {
  description = "A text description of the service account. Must be less than or equal to 256 UTF-8 bytes."
  type        = list(string)
}
