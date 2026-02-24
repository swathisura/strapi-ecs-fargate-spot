variable "ecr_repo_name" {
  type    = string
  default = "swatho-strapi-app"
}

variable "common_tags" {
  type = map(string)
  default = {
    Environment = "dev"
    ManagedBy   = "terraform"
    Project     = "strapi-platform"
    Team        = "swatho"
    Owner       = "swatho-devops"
  }
}

variable "ecs_cluster_name" {
  type    = string
  default = "swathi-strapi"
}

variable "ecs_execution_role_arn" {
  type        = string
  description = "Use existing IAM role ARN for ECS task execution"
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "ecr_image_url" {
  type = string
}
