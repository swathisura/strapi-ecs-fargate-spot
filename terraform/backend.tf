terraform {
  backend "s3" {
    bucket         = "swatho-terraform-state"
    key            = "strapi-platform/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
