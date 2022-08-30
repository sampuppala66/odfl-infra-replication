variable "cloud_sql_name" {
  description = "The name of the db"
  type        = string
  default = "cloudsql"
}
variable "env" {
  type        = string
  description = "Environment"
}

variable "data_database_name" {
  description = "The name of the db"
  type        = string
  default = "datadb"
}

variable "data_database_region" {
  description = "The region of the db"
  type        = string
  default = "us-east1"
}

variable "odfl_database_version" {
  description = "The version of the db"
  type        = string
  default = "POSTGRES_14"
}

variable "data_database_tier" {
  description = "The tier of the db"
  type        = string
  default = "db-f1-micro"
}

variable "data_database_protection" {
  description = "The database deletion protection"
  type        = string
  default = "false"
}

variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
}

variable "cloudsql_name" {
  description = "Name of the Private Cloud SQL instance, a random id will be appended."
  type        = string
}

variable "cloudsql_region" {
  description = "The region the instance will sit in. Note, Cloud SQL is not available in all regions - choose from one of the options listed here. A valid region must be provided to use this resource. If a region is not provided in the resource definition, the provider region will be used instead, but this will be an apply-time error for instances if the provider region is not supported with Cloud SQL. If you choose not to provide the region argument for this resource, make sure you understand this."
  type        = string
}

variable "cloudsql_database_version" {
  description = "The MySQL, PostgreSQL or SQL Server (beta) version to use."
  type        = string
}

variable "cloudsql_root_password" {
  description = "Initial root password. Required for MS SQL Server, ignored by MySQL and PostgreSQL."
  type        = string
}

variable "cloudsql_tier" {
  description = "The machine type to use. See tiers for more details and supported versions. Postgres supports only shared-core machine types such as db-f1-micro, and custom machine types such as db-custom-2-13312. See the Custom Machine Type Documentation to learn about specifying custom machine types."
  type        = string
}

variable "cloudsql_availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL).' For MySQL instances, ensure that settings.backup_configuration.enabled and settings.backup_configuration.binary_log_enabled are both set to true."
  type        = string
}

variable "cloudsql_disk_size" {
  description = "The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased."
  type        = number
}

variable "cloudsql_disk_type" {
  description = "The type of data disk: PD_SSD or PD_HDD."
  type        = string
}

variable "cloudsql_ipv4_enabled" {
  description = "Whether this Cloud SQL instance s]hould be assigned a public IPV4 address. Either ipv4_enabled must be enabled or a private_network must be configured."
  type        = bool
}

variable "cloudsql_require_ssl" {
  description = "Whether SSL connections over IP are enforced or not."
  type        = bool
}

variable "cloudsql_zone" {
  description = "The preferred compute engine zone."
  type        = string
}

variable "cloudsql_backup_enabled" {
  description = "True if backup configuration is enabled."
  type        = bool
}

variable "cloudsql_binary_log_enabled" {
  description = "True if binary logging is enabled. If settings.backup_configuration.enabled is false, this must be as well. Cannot be used with Postgres."
  type        = bool
}

variable "cloudsql_start_time" {
  description = "HH:MM format time indicating when backup configuration starts."
  type        = string
}

variable "vpc_network" {
  description = "Vpc network"
  type        = string
}

variable "private_ip_address" {
  description = "The IP address or beginning of the address range represented by this resource. This can be supplied as an input to reserve a specific address or omitted to allow GCP to choose a valid one for you."
  type        = string
}

variable "private_ip_name" {
  description = "Name of the resource. Provided by the client when the resource is created. The name must be 1-63 characters long, and comply with RFC1035. Specifically, the name must be 1-63 characters long and match the regular expression [a-z]([-a-z0-9]*[a-z0-9])? which means the first character must be a lowercase letter, and all following characters must be a dash, lowercase letter, or digit, except the last character, which cannot be a dash."
  type        = string
}

variable "private_ip_purpose" {
  description = "The purpose of the resource. For global internal addresses it can be VPC_PEERING - for peer networks PRIVATE_SERVICE_CONNECT - for (Beta only) Private Service Connect networks This should only be set when using an Internal address. Possible values are VPC_PEERING and PRIVATE_SERVICE_CONNECT."
  type        = string
}

variable "private_ip_address_type" {
  description = "The type of the address to reserve. EXTERNAL indicates public/external single IP address. INTERNAL indicates internal IP ranges belonging to some network. Default value is EXTERNAL. Possible values are EXTERNAL and INTERNAL."
  type        = string
}

variable "private_ip_version" {
  description = "The IP Version that will be used by this address. The default value is IPV4. Possible values are IPV4 and IPV6."
  type        = string
}

variable "private_ip_prefix_length" {
  description = "he prefix length of the IP range. If not present, it means the address field is a single IP address. This field is not applicable to addresses with addressType=EXTERNAL, or addressType=INTERNAL when purpose=PRIVATE_SERVICE_CONNECT"
  type        = number
}
