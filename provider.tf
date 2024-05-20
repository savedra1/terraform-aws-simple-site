# MODULE PROVIDERS

# Backend setup
terraform {
  backend "s3" {
    bucket = "tf-module-teststate-22132024"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" { # Provider with input region (default)
  region = var.aws_region
}

provider "aws" { # Provider used for ACM (hardcoded region as this is required for ACM cert)
  alias  = "acm_provider"
  region = "us-east-1"
}
