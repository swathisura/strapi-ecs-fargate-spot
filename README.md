# Strapi ECS Fargate Spot Deployment

This repository contains a **Strapi CMS** application deployed on **AWS ECS Fargate Spot** using **Terraform** for infrastructure as code and **GitHub Actions** for CI/CD automation.

---

## Project Structure
## Project Structure


terraform/
├── provider.tf # AWS provider
├── backend.tf # Remote state backend (S3)
├── variables.tf # Global variables
├── main.tf # Root module references
├── outputs.tf # Root outputs
└── modules/
├── ecr/
│ ├── main.tf # ECR repository creation
│ ├── variables.tf
│ └── outputs.tf
└── ecs/
├── main.tf # ECS cluster, task, service
├── variables.tf
└── outputs.tf

.github/workflows/deploy.yml # GitHub Actions workflow for CI/CD
strapi-app/ # Strapi application code
Dockerfile # Dockerfile for Strapi


---

## Prerequisites

1. AWS account with access to:
   - ECS
   - ECR
   - IAM (existing ECS task execution role)
   - VPC & Subnets

2. Terraform installed locally: [Terraform Download](https://www.terraform.io/downloads.html)

3. Docker installed locally for building Strapi image.

4. GitHub repository secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_ACCOUNT_ID`
   - `ecs_execution_role_arn` (ARN of IAM role for ECS tasks)

---

## Local Deployment (Terraform)

1. Clone this repository:

git clone https://github.com/<your-username>/strapi-ecs-fargate-spot.git
cd strapi-ecs-fargate-spot/terraform

CI/CD via GitHub Actions

Workflow file: .github/workflows/deploy.yml

Trigger: push to main branch

Steps:

Checkout repository

Configure AWS credentials

Build Docker image

Push image to ECR

Update ECS service (force new deployment)

Terraform Modular Structure

modules/ecr → Manages ECR repository

modules/ecs → Manages ECS cluster, task, service, security groups

Root module → Combines ECR + ECS + VPC/subnet data

Outputs

After running terraform apply, you can view:

ecr_repository_url → URL for pushing Docker images

ecs_cluster_id → ECS cluster ARN

ecs_service_name → ECS service name

ecs_task_definition_arn → Current task definition ARN

Notes

Uses FARGATE_SPOT for cost-efficient ECS tasks.

ECS tasks run with an existing IAM execution role (ecs_execution_role_arn).

CloudWatch logging and metrics are optional (not implemented here per requirements).

Each Git push to main automatically builds and deploys the new Docker image.
