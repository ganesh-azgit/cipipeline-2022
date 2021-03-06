variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "image_id" {
  type    = string
  default = "ami-074cce78125f09d61"
}

variable "tags" {
  type = map(any)
  default = {
    name = "ganesh2022"
  }
}

variable "vpc" {
  type = string
  default = "vpc-22285e49"
}
