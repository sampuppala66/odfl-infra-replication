env = "prod"
project_id = "odfl-gca-pilot-prod"
credential_file = "./odfl-devops-terraform-777240d022501.json"
gcp_region = "us-east1"
gcp_zone = "us-east1c"
terraform_project_id = "pandera-cloud-devops-terraform"
cloudsql_root_password = "Exp31n5er_=!"
secret_id = "kgfdfghjklxcfghjkiuytfdfghjklop"
cloudsql_name = "odfl-cloud-dev"
cloudsql_database_version = "POSTGRESQL_14"
cloudsql_tier =  "db-f1-micro"
cloudsql_availability_type = "ZONAL"
cloudsql_disk_size =  50
cloudsql_disk_type = "PD_SSD"
cloudsql_ipv4_enabled =  false 
cloudsql_require_ssl =  false
cloudsql_backup_start_time =  "04:00"
service_account_name =  "odfl-hvr-sa"
delta_vm_type = "n2-standard-4"
vm_instance_name = "odfl-pilot-hvr-vm"
delta_vm_disk_type = "pd-standard"
delta_vm_disk_size ="20"
resources_zone = "us-east1-c"
hostname = "odfl-pilot-hvr-agent"
odfl_folder_id = "folders/878125556822"
bigquery_users = ["user:carter.richard@panderasystems.com","group:ADFS_GCP-Developers@odfl.com"]
bigquery_editors = ["user:carter.richard@panderasystems.com", "group:ADFS_GCP-Developers@odfl.com"]
cloudsql_admins = ["user:joshua.ibrahim@panderasystems.com","user:sam.puppala@panderasystems.com"]
service_account_admins = ["user:joshua.ibrahim@panderasystems.com","user:sam.puppala@panderasystems.com",]
odfl_folder_admins = ["user:joshua.ibrahim@panderasystems.com","user:sam.puppala@panderasystems.com"]
vpc_name = "odfl-hostvpc"
subnet_name = "odfl-pilot-subnet"