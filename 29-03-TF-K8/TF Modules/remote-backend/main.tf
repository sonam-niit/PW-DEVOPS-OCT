provider "aws" {
  region = "us-east-1"
}

module "s3-backend" {
  source = "./s3-backend"
}