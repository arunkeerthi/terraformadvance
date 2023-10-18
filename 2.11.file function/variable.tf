variable "ec2_ami_id" {
    description = "instance ami id"
    type = string
    default = "ami-051f7e7f6c2f40dc1"
}

variable "ec2_instance_type" {
    description = "instace type"
    type = string
    default = "t2.micro"
}

variable "ec2_key_name" {
    description = "key name"
    type = string
    default = "jenkinsslave"
}

variable "ec2_security_group" {
    description = "security group"
    type = map(string)
    default = {
      type1 = "all tcp"

    } 
}

variable "ec2_count" {
    description = "count"
    type = number
    default =1
}

variable "ec2_tags"{
    description = "tag"
    type = string
    default = "aruninstance1"
}

variable "aws_region" {
    description = "region name"
    type = string
    default = "us-east-1"
}