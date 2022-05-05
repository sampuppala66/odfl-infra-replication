# SBA Cloud Foundations
Provision GCP infrastructure resource for SBA

# Code structure
Two dimention structure for IaC:
* Structured by module per product or service. Each module has its cohesiveness of provivisoning a GCP product or service.
* Structured by environments: test, dev, stage and prd.  


```shell
│───README.md
│
├───config
│       terraform.tfvars
│
├───modules
│   ├───folders
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
│   ├───iam
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
│   ├───networks
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
│   └───projects
│   |        main.tf
│   |        outputs.tf
│   |        variables.tf
│   └───...
├───dev
|   |   backend.tf
|   |   main.tf
|   |   variables.tf
|   |   versions.tf
|   |   values.tfvars
|───prod
|   |   backend.tf
|   |   main.tf
|   |   variables.tf
|   |   versions.tf
|   |   values.tfvars
├───stage
|   |   backend.tf
|   |   main.tf
|   |   variables.tf
|   |   versions.tf
|   |   values.tfvars
│
```
# File Contents
## config/terraform.tfvars
Apply variables needed for the modules defined in your main.tf in this file. Variables include: `project ID`, ... and `service account credentials file`

## main.tf
Resources being created for the client project should be designed by referencing modules from this repository.  To Reference a module use the following format:

``` shell
resource "google_bigquery_dataset" "sba_data" {
  # source  = "terraform-google-modules/bigquery/google"
  # version = "~> 4.0"
  dataset_id                  = "${var.project_id}_${var.dataset_name}_${var.env}"
  friendly_name                = "${var.project_id}_${var.dataset_name}_${var.env}"
}
```

## test/backend.tf
Terrafrom remote state being created in GCP storage.
``` shell
  terraform {
    backend "gcs" {
      bucket      = "sba-global-state"
      prefix      = "foundations/"
    }
  }
```

## test/variables.tf
Define all the variables being used.

# Terraform commands
Run the following commands
```shell
terraform init -input=false -reconfigure      
```

```shell
terraform plan  -input=false -var-file=".config/terraform.tfvars" -out="./output/tfplan"
```

```shell
terraform apply -input=false "./output/tfplan"
```
