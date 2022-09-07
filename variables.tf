variable "project_id" {
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
  type        = string
  default = "odfl-gca-pilot-test"
}
variable "credential_file" {
  type        = string
  description = "Service account key file"
  default     = "./odfl-devops-terraform-777240d022501.json"
}

variable "env" {
  type        = string
  description = "Environment"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-east1"
}

variable "gcp_zone" {
  type        = string
  description = "GCP Zone"
  default = "us-west1a"
}

variable "terraform_project_id" {
  type        = string
  description = "Environment"
  default = "pandera-cloud-devops-terraform"
}

variable "cloudsql_root_password" {
   type        = string
  description = ""
  default = "Exp31n5er_=!"
}
variable "secret_id" {
  type        = string
  description = "Environment"
  default = "kgfdfghjklxcfghjkiuytfdfghjklop"
}

variable "cloudsql_name" {
  description = "The name of the cloudsql resource"
  type        = string
  default = "odfl-gca-pilot-cloudsql"
}

variable "cloudsql_zone" {
  description = "The name of the cloudsql resource"
  type        = string
  default = "us-east1c"
}

variable "cloudsql_database_version" {
  description = "The MySQL, PostgreSQL or SQL Server (beta) version to use."
  type        = string
  default = "POSTGRESQL_14"
}

variable "cloudsql_tier" {
  description = "The machine type to use. See tiers for more details and supported versions. Postgres supports only shared-core machine types such as db-f1-micro, and custom machine types such as db-custom-2-13312. See the Custom Machine Type Documentation to learn about specifying custom machine types."
  type        = string
  default = "db-f1-micro"
}

variable "cloudsql_availability_type" {
  description = "The availability type of the Cloud SQL instance, high availability (REGIONAL) or single zone (ZONAL).' For MySQL instances, ensure that settings.backup_configuration.enabled and settings.backup_configuration.binary_log_enabled are both set to true."
  type        = string
  default = "ZONAL"
}

variable "cloudsql_disk_size" {
  description = "The size of data disk, in GB. Size of a running instance cannot be reduced but can be increased."
  type        = number
  default = 1024
}

variable "cloudsql_disk_type" {
  description = "The type of data disk: PD_SSD or PD_HDD."
  type        = string
  default = "PD_SSD"

}

variable "cloudsql_ipv4_enabled" {
  description = "Whether this Cloud SQL instance should be assigned a public IPV4 address. Either ipv4_enabled must be enabled or a private_network must be configured."
  type        = bool
  default = true
}

variable "cloudsql_require_ssl" {
  description = "Whether SSL connections over IP are enforced or not."
  type        = bool
  default = false
}

variable "cloudsql_backup_start_time" {
  description = "HH:MM format time indicating when backup configuration starts."
  type        = string
  default = "04:00"
}
variable "service_account_name" {
  description = "HVR service Account name"
  type        = string
  default = "odfl-hvr-sa"
}

variable "delta_vm_type" {
  description = "Vm instance type"
  type        = string
  default = "n2-standard-4"
}

variable "vm_instance_name" {
  description = "Vm instance type"
  type        = string
  default = "odfl-pilot-hvr-vm"
}

variable "delta_vm_disk_type" {
  description = "Vm instance type"
  type        = string
  default = "pd-standard"
}

variable "delta_vm_disk_size" {
  description = "disk"
  type        = string
  default = "20"
}

variable "resources_zone" {
  description = "Vm instance type"
  type        = string
  default = "us-east1-c"
}

variable "hostname" {
  description = "hostname"
  type        = string
  default = "odfl-pilot-hvr-agent"
}

variable "odfl_folder_id" {
  description = "ODFL folder Id"
  type = string
  default = "folders/878125556822"
}

variable "developer_users" {
  description = "list of big query users"
  type = list(string)
  default = ["group:ADFS_GCP-Developers@odfl.com"]

}


variable "vpc_name" {
    description = "vpc name"
    type = string
    default = "odfl-hostvpc"
}
variable "subnet_name" {
    description = "subnet name"
    type = string
    default = "odfl-pilot-subnet"
}

variable "data_folder_id" {
  description = "The folder id of the data folder"
  type = string

}

variable "host_project_id" {
  description = "The project_id of the host project"
  type = string

}


variable "billing_account" {
  description = "The billing account attached to the project"
  type = string

}

variable "cloud_sql_ip_range" {
  description = "ip range of the cloud sql"
  type = string
}


variable "tcp_ports" {
  description = "list enabled ports"
  type = list(string)
}

variable "tcp_source_ranges" {
  description = "ip ranges of the firewall rule for the iap"
  type = list(string)
}
variable "tags" {
  description = "The target tags "
  type = list(string)
}

variable "subnetwork_regions" {
  description = "list of subnet zones"
  type = list(string)
}

variable "odfl_folder_admins" {
  description = "the list of odfl folder admins"
  type = list(string)
}

variable "security_reviewers" {
  description = "the list of security reviewers"
  type = list(string)
}
