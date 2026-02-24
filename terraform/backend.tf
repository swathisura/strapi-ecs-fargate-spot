terraform {
  backend "s3" {
    bucket = "your-terraform-state-bucket"
    key    = "strapi/terraform.tfstate"
    region = "us-east-1"
  }
}
