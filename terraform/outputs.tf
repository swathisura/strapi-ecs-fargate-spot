# ECS outputs
output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "ecs_service_name" {
  value = module.ecs.ecs_service_name
}

output "ecs_task_definition_arn" {
  value = module.ecs.ecs_task_definition_arn
}

# ECR output
output "ecr_repository_url" {
  value = module.ecr.repository_url
}
