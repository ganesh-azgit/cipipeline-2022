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
  subnet_id = "subnet-41bb870d"
  vpc_security_group_ids = [
    "sg-0c942cb0e2ef565d5"
  ]
  user_data = <<EOF
  #!/bin/bash
  sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
  sed -i 's/UsePAM no/UsePAM yes/' /etc/ssh/sshd_config
  sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
  systemctl restart sshd.service
  useradd ganesh
  echo "test@123"|passwd --stdin ganesh
  echo "Test#1@123"|passwd --stdin root
  echo "ganesh ALL=(ALL) NOPASSWD:ALL"|tee -a /etc/sudoers.d/90-cloud-init-users
  systemctl restart sshd.service
  EOF
}
