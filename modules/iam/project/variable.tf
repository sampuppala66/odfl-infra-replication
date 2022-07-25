/**
 * Variables 
 */
variable "project_id" {
  description = "service project_id"
  type        = string
}

variable "members" {
  description = "Identity that will be granted the privilege in role(s)."
  type        = list(string)
}

variable "roles" {
  description = "The role that should be applied. Only one google_service_account_iam_binding can be used per role. Note that custom roles must be of the format [projects|organizations]/{parent-name}/roles/{role-name}."
  type        = list(string)
}

variable "env" {
  description = "Environment"
  type = string
}
