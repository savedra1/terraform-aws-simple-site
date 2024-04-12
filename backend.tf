# Backend setup
terraform {
  backend "s3" {
    bucket = "tf-module-teststate-22132024"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}