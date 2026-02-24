provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

module "ecs" {
  source                 = "./modules/ecs"
  cluster_name           = "swathi-strapi"
  vpc_id                 = data.aws_vpc.default.id
  subnets                = data.aws_subnets.default.ids
  ecs_execution_role_arn = "arn:aws:iam::811738710312:role/ecs_fargate_taskRole"
  ecr_image_url          = "811738710312.dkr.ecr.us-east-1.amazonaws.com/swatho-strapi-app:latest"
}
