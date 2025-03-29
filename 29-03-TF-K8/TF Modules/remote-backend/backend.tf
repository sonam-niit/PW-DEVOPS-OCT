terraform {
  backend "s3" {
    bucket = "sonam-bucket-927fec3e"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
