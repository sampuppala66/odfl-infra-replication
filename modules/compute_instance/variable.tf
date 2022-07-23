/**
 * Variables 
 */
variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "name" {
  description = "A unique name for the resource, required by GCE. Changing this forces a new resource to be created."
  type        = string
}

variable "machine_type" {
  description = "The machine type to create. Custom machine types can be formatted as custom-NUMBER_OF_CPUS-AMOUNT_OF_MEMORY_MB, e.g. custom-6-20480 for 6 vCPU and 20GB of RAM."
  type        = string
}

variable "zone" {
  description = "The zone that the machine should be created in. If it is not provided, the provider zone is used."
  type        = string
}

variable "image" {
  description = "The image from which to initialize this disk. This can be one of: the image's self_link, projects/{project}/global/images/{image}, projects/{project}/global/images/family/{family}, global/images/{image}, global/images/family/{family}, family/{family}, {project}/{family}, {project}/{image}, {family}, or {image}. If referred by family, the images names must include the family name. If they don't, use the google_compute_image data source. For instance, the image centos-6-v20180104 includes its family name centos-6. These images can be referred by family name here."
  type        = string
}

variable "network" {
  description = "The name or self_link of the network to attach this interface to. Either network or subnetwork must be provided."
  type        = string
}


variable "subnetwork" {
  description = "The name or self_link of the subnetwork to attach this interface to. The subnetwork must exist in the same region this instance will be created in. If network isn't provided it will be inferred from the subnetwork. Either network or subnetwork must be provided."
  type        = string
}

# variable "subnetwork_project" {
#   description = "The project in which the subnetwork belongs. If the subnetwork is a self_link, this field is ignored in favor of the project defined in the subnetwork self_link. If the subnetwork is a name and this field is not provided, the provider project is used."
#   type        = string
# }


variable "auto_delete" {
  description = "Whether the disk will be auto-deleted when the instance is deleted. Defaults to true."
  type        = string
}

variable "size" {
  description = "The size of the image in gigabytes. If not specified, it will inherit the size of its base image."
  type        = string
}

variable "type" {
  description = "The GCE disk type. May be set to pd-standard, pd-balanced or pd-ssd."
  type        = string
}

variable "service_account_email" {
  description = "the service account email"
  type        = string
}

variable "tags" {
  description = "the hostname"
  type        = list(string)
}
