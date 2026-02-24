variable "repo_name" {
  description = "ECR repository name"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}
