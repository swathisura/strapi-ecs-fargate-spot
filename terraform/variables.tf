variable "aws_region" {
  default = "us-east-1"
}

variable "project_name" {
  default = "swatho-strapi-platform"
}

variable "environment" {
  default = "dev"
}

variable "ecr_repo_name" {
  default = "swatho-strapi-app"
}

variable "common_tags" {
  default = {
    Team        = "swatho"
    Owner       = "swatho-devops"
    Project     = "strapi-platform"
    ManagedBy   = "terraform"
    Environment = "dev"
  }
}
