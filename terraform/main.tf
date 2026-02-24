module "ecr" {
  source = "./modules/ecr"

  repo_name   = var.ecr_repo_name
  common_tags = var.common_tags
}
module "ecr" {
  source = "./modules/ecr"
}

# Use default VPC data
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
  source       = "./modules/ecs"
  cluster_name = "swathi-strapi"
  image_url    = module.ecr.repository_url
  vpc_id       = data.aws_vpc.default.id
  subnets      = data.aws_subnets.default.ids
}
