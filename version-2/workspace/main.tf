provider "aws" {
    region = "us-east-2"
}

variable "ami" {
    description = "This is the ami"
}

variable "instance_type" {
    description = "This is the instance Type"
}

variable "tag" {
    description = "this is the value of tage"
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
        Name = var.tag
    }

}