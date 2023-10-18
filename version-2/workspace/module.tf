provider "aws" {
    region = "us-east-2"
}

variable "ami" {
    description = "value"
}

varialbe "instance_type" {
    description = "value"
}

variable "tag" {
    description = "this is the value of tage"
}


module "ec2-instance" {
    source = "/root/day-7"
    ami = var.ami
    instance_type = var.instance_type
    tags = var.tag
}