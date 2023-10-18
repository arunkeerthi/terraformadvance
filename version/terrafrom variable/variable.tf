variable "ec2_ami_id" {
    description = "ami id"
    type = string
    default = "ami-06f621d90fa29f6d0"
}
variable "ec2_instance_type"{
    description = "instance type"
    type = string
    default = "t2.micro"
}
variable "ec2_instance_count"{
    description = "count"
    type = number
    default = 2
}
variable "ec2_public_ip" {
    description = "public ip"
    type = bool
    default = true
}
variable "ec2_tag"{
    description = "tag"
    type = string
    default = "my instance"
}

# type variables mentioned above
   # string
   # number
   # bool
