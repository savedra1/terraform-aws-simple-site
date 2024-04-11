# Backend setup
terraform {
  backend "s3" {
    bucket = "tf-module-teststate-22132024"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}

# Provider with default region
provider "aws" {
  region = "${var.AWS_REGION}"
}

provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}
