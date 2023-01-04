env = "prod"
project_id = "odfl-gca-pilot"
credential_file = "./terraform_sa.json"
gcp_region = "us-east1"
gcp_zone = "us-east1-c"
terraform_project_id = "pandera-cloud-devops-terraform"
cloudsql_root_password = ""
secret_id = ""
cloudsql_name = ""
cloudsql_ipv4_enabled =  true
cloudsql_require_ssl =  false
cloudsql_backup_enabled = true
cloudsql_backup_start_time =  "04:00"
service_account_name = "odfl-hvr-sa-prod"
pilot_service_account_name = "odfl-pilot-sa-prod"
delta_vm_type = "n2-standard-4"
vm_instance_name = "odfl-pilot-hvr-agentvm"
delta_vm_disk_type = "pd-standard"
delta_vm_disk_size ="20"
resources_zone = "us-east1-c"
nat_ip = ["34.148.90.74"]
hostname = "odfl-gca-pilothvr"
odfl_folder_id = "folders/878125556822"
monitoring_users =  ["adfs_gcp-sysops-monitoring_admin@odfl.com"]
developer_users =  ["group:adfs_gcp-developers_prod@odfl.com"]
sa_users =  ["group:adfs_gcp-dba_admin_prod@odfl.com"]
admins = ["group:adfs_gcp-dba_admin_prod@odfl.com"]
reviewers =  ["group:adfs_gcp-dba_admin_prod@odfl.com"]
tester_users =  ["adfs_gcp-qateam@odfl.com"]
vpc_name = "odfl-pilot-vpc"
subnet_name = "odfl-pilot-subnetwork-prod-us-east1"
data_folder_id = "folders/684427362895"
billing_account = "01576B-0CD5E1-6341D4"
cloud_sql_ip_range = "10.78.176.0"
tags = ["allow-ssh", "allow-hvr"]
tcp_ports = ["80", "22", "443", "4343"]
tcp_source_ranges = ["0.0.0.0/0"]
subnetwork_regions = ["us-east1"]
odfl_folder_admins =  ["user:paulg-admin@odfl.com", "user:pauln-admin@odfl.com"]
roles = ["roles/bigquery.user",
         "roles/bigquerydatapolicy.maskedReader",
          "roles/datacatalog.categoryFineGrainedReader",
          "roles/bigquery.dataEditor",
          "roles/cloudsql.client",
          "roles/storage.objectAdmin"]
reviewer_roles = ["roles/iam.securityReviewer"]
developer_roles = ["roles/bigquery.user",
         "roles/bigquery.connectionUser",
         "roles/bigquerydatapolicy.maskedReader",
          "roles/datacatalog.categoryFineGrainedReader",
          "roles/cloudsql.client"]
tester_roles = ["roles/notebooks.admin",
              "roles/bigquerydatapolicy.maskedReader",
              "roles/storage.objectViewer",
              "roles/iam.serviceAccountUser"]
admin_roles = ["roles/iam.serviceAccountAdmin",
                      "roles/iam.serviceAccountUser",
                      "roles/bigquery.dataEditor",
                      "roles/compute.osLogin",
                      "roles/iap.tunnelResourceAccessor",
                      "roles/bigquery.admin",
                      "roles/cloudsql.admin",
                      "roles/storage.admin",
                      "roles/compute.instanceAdmin.v1"]

monitoring_roles = [
        "roles/compute.admin",
        "projects/odfl-gca-pilot-prod/roles/dynatrace_function.cloud_function_deployment",
        "roles/compute.osLogin",
        "roles/monitoring.admin",
        "roles/monitoring.alertPolicyEditor",
        "roles/serviceusage.serviceUsageConsumer",
        "roles/cloudfunctions.viewer",
        "roles/pubsublite.viewer",
        "roles/logging.admin",
        "roles/compute.instanceAdmin.v1"]

dynatrace_permissions = ["appengine.applications.create",
                       "appengine.applications.get",
                       "cloudfunctions.functions.create",
                       "cloudfunctions.functions.get",
                       "cloudfunctions.functions.getIamPolicy",
                       "cloudfunctions.functions.list",
                       "cloudfunctions.functions.sourceCodeSet",
                       "cloudfunctions.functions.update",
                       "cloudfunctions.operations.get",
                       "cloudfunctions.operations.list",
                       "cloudscheduler.jobs.create",
                       "cloudscheduler.jobs.delete",
                       "cloudscheduler.jobs.get",
                       "cloudscheduler.jobs.list",
                       "cloudscheduler.locations.list",
                       "iam.roles.create",
                       "iam.roles.list",
                       "iam.roles.update",
                       "iam.serviceAccounts.actAs",
                       "iam.serviceAccounts.create",
                       "iam.serviceAccounts.getIamPolicy",
                       "iam.serviceAccounts.list",
                       "iam.serviceAccounts.setIamPolicy",
                       "monitoring.dashboards.create",
                       "monitoring.dashboards.list",
                       "pubsub.topics.create",
                       "pubsub.topics.list",
                       "pubsub.topics.update",
                       "resourcemanager.projects.get",
                       "resourcemanager.projects.getIamPolicy",
                       "resourcemanager.projects.setIamPolicy",
                       "secretmanager.secrets.create",
                       "secretmanager.secrets.getIamPolicy",
                       "secretmanager.secrets.list",
                       "secretmanager.secrets.setIamPolicy",
                       "secretmanager.versions.add",
                       "secretmanager.versions.list",
                       "serviceusage.services.enable"
        ]
