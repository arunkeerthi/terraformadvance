variable "aws_region" {
    description = "aws_region for env"
    default = "us-east-2"
}

variable "ami" {
    description = "ami"
    default = "ami-080c09858e04800a1"
}

variable "instance_type" {
    description = "instance_type"
    default = "t2.micro"
}