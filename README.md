# SBA Cloud Foundations
Provision GCP infrastructure resource for SBA

# Code structure
Two dimention structure for IaC:
* Structured by module per product or service. Each module has its cohesiveness of provivisoning a GCP product or service.
* This is just for the dev env.  


```shell
│───README.md
│
├───config
│   ├───test
│   │   terraform.tfvars
│   │   backend.tfvars
│   ├───dev
│   │   terraform.tfvars
│   │   backend.tfvars
│   ├───prod
│   │   terraform.tfvars
│   │   backend.tfvars
│
├───modules
│   ├───bigquery
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
│   ├───cloudsql
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
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
│   ├───pubsub
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
│   ├───secret_manager
│   │       main.tf
│   │       outputs.tf
│   │       variables.tf
│   └───...
├───backend.tf
├───main.tf
├───provider.tf
├───variables.tf
├───versions.tf
```

# File Contents
## config/terraform.tfvars
Apply variables needed for the modules defined in your main.tf in this file. Variables include: `project ID`, ... and `service account credentials file`

## main.tf
Resources being created for the client project should be designed by referencing modules from this repository.  To Reference a module use the following format:

``` shell


## backend.tf
Terrafrom remote state being created in GCP storage.
``` shell
  terraform {
    backend "gcs" {
      bucket      = "odfl-global-state"
      prefix      = "foundations/"
    }
  }
```

## variables.tf
Define all the variables being used.

# About

This terraform configuration creates all the inner components of the NESTcc cloud.

## Terraform Design

The Terraform scripts are a multi environment solution. The environments are:

-   `dev`
-   `preprod`
-   `prod`

This solution will contain both static files and configurable files for each environment.

# Getting Started

The following dependencies are necessary to run the application.

-   [Terraform](https://www.terraform.io/downloads.html)
-   [Google Cloud SDK](https://cloud.google.com/sdk/install)

Terraform uses service accounts to grant permissions to create resources within a GCP project.
To run the scripts the JSON key must be downloaded and set as an environmental variable, `GOOGLE_APPLICATION_CREDENTIALS`.

## 1. Setup Dependecies

```shell
gcloud init
gcloud auth application-default login
export GOOGLE_APPLICATION_CREDENTIALS=/path/to/terraform/service/account.json
terraform init
```

## 2. Initialize Terraform

```shell
ENV="dev" # Or whatever env (dev, preprod, prod)
cd src/ # Navigate to the source folder
terraform init -input=false -reconfigure -backend-config="../envs/${ENV}/config/backend.tfvars"
```

## 2. Plan

Use the following command to produce a reviewable plan. Use the -out argument to persist the plan to an output file.

```shell
terraform plan -input=false -out="../output/tfplan" -var-file="../envs/${ENV}/config/terraform.tfvars"
```

## 3. Apply

Use to run a generated plan. This will modify infrastructure.

```shell
terraform apply -input=false -auto-approve "../output/tfplan"

```
