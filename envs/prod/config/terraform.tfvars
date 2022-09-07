env = "prod"
project_id = "odfl-gca-pilot"
credential_file = "./odfl-devops-terraform-777240d022501.json"
gcp_region = "us-west3"
gcp_zone = "us-west3-c"
terraform_project_id = "pandera-cloud-devops-terraform"
cloudsql_root_password = "Exp31n5er_=!"
secret_id = "kgfdfghjklxcfghjkiuytfdfghjklop"
cloudsql_name = "odfl-gca-data"
cloudsql_database_version = "POSTGRESQL_14"
cloudsql_tier =  "db-custom-4-26624"
cloudsql_availability_type = "ZONAL"
cloudsql_disk_size =  50
cloudsql_disk_type = "PD_SSD"
cloudsql_ipv4_enabled =  true
cloudsql_require_ssl =  false
cloudsql_backup_enabled = true
cloudsql_backup_start_time =  "04:00"
service_account_name =  "odfl-hvr-sa"
delta_vm_type = "n2-standard-4"
vm_instance_name = "odfl-pilot-hvr-agent"
delta_vm_disk_type = "pd-standard"
delta_vm_disk_size ="20"
resources_zone = "us-west3-c"
hostname = "odfl-pilot-hvr-agent"
odfl_folder_id = "folders/878125556822"
developer_users = ["group:adfs_gcp-developers_prod@odfl.com"]
vpc_name = "odfl-pilot-vpc"
subnet_name = "odfl-pilot-subnetwork"
data_folder_id = "folders/684427362895"
billing_account = "01576B-0CD5E1-6341D4"
host_project_id = "odfl-shared-hvpc"
cloud_sql_ip_range = "10.78.176.0"
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
subnetwork_regions = ["us-west3"]
odfl_folder_admins = ["user:sam.puppala@panderasystems.com", "group:adfs_gcp-dba_admin_prod@odfl.com"]
security_reviewers = ["user:sam.puppala@panderasystems.com",
                      "user:carter.richard@panderasystems.com",
                      "user:joshua.ibrahim@panderasystems.com",
                      "group:adfs_gcp-dba_admin_prod@odfl.com"]
