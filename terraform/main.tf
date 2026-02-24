provider "aws" {
  region = "us-east-1"
}

# --- ECR Module ---
module "ecr" {
  source      = "./modules/ecr"
  repo_name   = var.ecr_repo_name
  common_tags = var.common_tags
}

# --- VPC Data ---
data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# --- ECS Module ---
module "ecs" {
  source               = "./modules/ecs"
  cluster_name         = var.ecs_cluster_name
  ecr_image_url        = module.ecr.repository_url
  ecs_execution_role_arn = var.ecs_execution_role_arn
  vpc_id               = data.aws_vpc.default.id
  subnets              = data.aws_subnets.default.ids
}
