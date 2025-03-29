provider "aws" {
  region = "us-east-1"
}

module "ec2-module" {
  source = "./ec2-module"
  image_id = "ami-084568db4383264d4"
  name = "sonamvm"
  type = "t2.micro"
}