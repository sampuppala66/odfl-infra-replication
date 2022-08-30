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
data_folder_id = "folders/684427362895"
billing_account = "01576B-0CD5E1-6341D4"
host_project_id = "odfl-shared-hvpc"
cloud_sql_ip_range = "10.78.176.0"
iap_ports = ["22"]
iap_source_ranges = [ "35.235.240.0/20"]
ips_ports = ["80", "22", "4340", "4343"]
ips_source_ranges = [ "0.0.0.0/0"]
tcp_ports = ["80", "22", "443", "4343"]
tcp_source_ranges = [ "216.54.213.8/29",
                    "216.54.213.80/29",
                    "216.54.213.96/28",
                    "66.162.6.80/28",
                    "209.136.214.192/26",
                    "66.192.161.216/29",
                    "35.248.29.128/26",
                    "50.58.48.248/29"
                  ]
