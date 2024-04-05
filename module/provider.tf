# Backend setup
terraform {
  backend "s3" {
    bucket = var.STATE_BUCKET
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}

# Provider with default region
provider "aws" {
  region = var.AWS_REGION
}