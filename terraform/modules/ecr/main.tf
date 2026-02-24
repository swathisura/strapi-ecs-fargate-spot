resource "aws_ecr_repository" "this" {
  name         = var.repo_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(var.common_tags, { Name = var.repo_name })
}

output "repository_url" {
  value = aws_ecr_repository.this.repository_url
}
