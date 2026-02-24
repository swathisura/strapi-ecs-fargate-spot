variable "cluster_name" {}
variable "image_url" {}
variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
