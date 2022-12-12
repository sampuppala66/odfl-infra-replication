env = "prod"
project_id =
credential_file = "./terraform_sa.json"
gcp_region = "us-east1"
gcp_zone = "us-east1-c"
terraform_project_id = "pandera-cloud-devops-terraform"
cloudsql_root_password =
secret_id =
cloudsql_name =
cloudsql_database_version =
cloudsql_tier =
cloudsql_availability_type =
cloudsql_disk_size =
cloudsql_disk_type =
cloudsql_ipv4_enabled =  true
cloudsql_require_ssl =  false
cloudsql_backup_enabled = true
cloudsql_backup_start_time =  "04:00"
service_account_name =
pilot_service_account_name =
delta_vm_type = "n2-standard-4"
vm_instance_name =
delta_vm_disk_type = "pd-standard"
delta_vm_disk_size ="20"
resources_zone = "us-east1-c"
hostname = "odfl-pilot-hvr-agentvm"
odfl_folder_id = "folders/878125556822"
monitoring_users =
developer_users =
sa_users =
admins =
reviewers =
tester_users = []
vpc_name =
subnet_name =
data_folder_id =
billing_account =
host_project_id = "odfl-shared-hvpc"
cloud_sql_ip_range = "10.78.176.0"
tags = ["allow-ssh", "allow-hvr"]
tcp_ports = ["80", "22", "443", "4343"]
tcp_source_ranges = [
                  ]
subnetwork_regions = ["us-east1"]
odfl_folder_admins = 
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
tester_roles = ["roles/bigquery.connectionUser",
                "roles/bigquery.user",
              "roles/bigquerydatapolicy.maskedReader",
              "roles/storage.objectAdmin",
              "roles/cloudsql.client"]
admin_roles = [
                      "roles/iam.serviceAccountAdmin",
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
