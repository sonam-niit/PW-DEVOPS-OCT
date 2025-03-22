provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  count = 3
  ami = "ami-084568db4383264d4" #ubuntu AMI
  instance_type = "t2.micro"

  tags = {
    Name = "sonamvm-${count.index+1}"
  }
}