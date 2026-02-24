# === ECS Outputs ===
output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = module.ecs.ecs_task_definition_arn
}

# === Optional ECR Outputs (only if ECR module exists) ===
# Uncomment this block if you have an ECR module called 'ecr'
# output "ecr_repository_url" {
#   description = "URL of the ECR repository"
#   value       = module.ecr.repository_url
# }
