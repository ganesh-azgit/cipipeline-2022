provider "aws" {
  region = "us-east-2"
}


resource "aws_instance" "ganesh-2022" {
  count         = 2
  ami           = var.image_id
  instance_type = var.instance_type
  availability_zone = "us-east-2c"
  tags          = {
    Name = "ganesh-2022-${count.index}"
  }
}
