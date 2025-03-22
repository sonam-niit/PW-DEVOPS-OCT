provider "aws" {
  region = var.aws_region ## assign value from variables
}

resource "aws_instance" "web" {
  ami = var.ami_id ## assign value from variables
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [ aws_security_group.web_sg1.id ] #give id of cretaed Security Group

  tags = {
    Name = "sonamvm"
  }
}

//SECURITY GROUP
resource "aws_security_group" "web_sg1" {
  name = "web_sg1"
  description = "Allow Port SSH and Port HTTP"
#   Inbound Rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

    # Outbound Rules
    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}