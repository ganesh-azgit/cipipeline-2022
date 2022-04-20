provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "ganesh-2022" {
  count         = 2
  ami           = var.image_id
  instance_type = var.instance_type
  tags          = var.tags-${count.index}
}
