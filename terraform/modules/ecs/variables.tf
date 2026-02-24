variable "cluster_name" {
  description = "Name of ECS cluster"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ECS service will run"
  type        = string
}

variable "subnets" {
  description = "List of subnet IDs for ECS tasks"
  type        = list(string)
}

variable "ecs_execution_role_arn" {
  description = "ARN of existing IAM role for ECS tasks"
  type        = string
}

variable "ecr_image_url" {
  description = "Full ECR image URL including tag"
  type        = string
}
