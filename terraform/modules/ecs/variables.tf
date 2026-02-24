variable "cluster_name" {}
variable "ecr_image_url" {}
variable "ecs_execution_role_arn" {}
variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
