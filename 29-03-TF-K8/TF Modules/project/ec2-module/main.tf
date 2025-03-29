
resource "aws_instance" "web" {
  ami = var.image_id
  instance_type = var.type

  tags = {
    Name = var.name
  }
}