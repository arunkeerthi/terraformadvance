# remove the default option then it will prompet the value when we execute the terraform command

variable "aws_regions_mumbai" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "ap-south-1"
}

variable "ec2_ami_id" {
    description = "AMI ID for creating a EC2"
    type = string
    
}

variable "ec2_instance_count" {
    description = "no of ec2 instance"
    type = number
    
}

variable "ec2_instance_type"{
    description = "the instance type of ec2"
    type = string
    default = "t2.micro"
}