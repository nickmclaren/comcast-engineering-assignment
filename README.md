
# EKS Deployment using Terraform and GitHub Actions

# Project Overview
This repository sets up an AWS Elastic Kubernetes Service cluster with Terraform, and is managed and deployed through GitHub Actions. The setup includes VPC configuration, EKS cluster, security groups, subnets, and IAM roles needed to have a functional EKS cluster to use with Fargate.

# Prerequisites
AWS Account with necessary permissions to create VPC, EKS, IAM Roles, and etc.

GitHub Account
Terraform installed on the local machine (if running Terraform commands locally)
AWS CLI installed on the local machine

# Architecture
The Terraform configuration sets up the following resources:

VPC with public and private subnets spread across multiple availability zones.

Internet Gateway and NAT Gateway to allow communication with the internet.

Route Tables for public and private subnet traffic management.

EKS Cluster: Configured to run with Fargate profiles.

IAM Roles and Policy Attachments for EKS and Fargate.

Security Groups to secure access to the EKS cluster.

# Terraform Structure
EKS Cluster Setup: Configures the EKS cluster along with associated networking settings.

Networking Setup: Includes creation of VPC, subnets, and gateway configurations.

Security Setup: Manages the security groups necessary for the EKS cluster.

IAM Setup: Handles the creation of IAM roles and policy attachments necessary for EKS and Fargate operations.

Outputs: Defines outputs for VPC ID and subnet IDs.

# GitHub Actions Workflow
The GitHub Actions pipeline is configured to automate the deployment of the Terraform-managed infrastructure:

Setup AWS Resources: Crestes a DynamoDB table for state locking and S3 for state storage before Terraform execution.

Terraform Deploy: Handles initialization, planning, and application of the Terraform configuration.

Cleanup: Optional destruction of Terraform-managed infrastructure and removal of the S3 bucket on demand.

Workflow Dispatch Options
Destroy: Set this to true to clean up all resources managed by Terraform.

# Running the Project Locally

Install Python and boto3:

`sudo apt-get install python3
pip install boto3`


Terraform Initialization:

`terraform init`

Plan Deployment:

`terraform plan`

Apply Configuration:

`terraform apply`

Clean Up:

To destroy the infrastructure use the following line:

`terraform destroy`
