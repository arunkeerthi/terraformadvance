variable "aws_region" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "ap-south-1"
}

variable "ec2_ami_id" {
    description = "AMI ID for creating a EC2"
    type = string
    default = "ami-0da59f1af71ea4ad2"
}

variable "ec2_instance_count" {
    description = "no of ec2 instance"
    type = number
    default = 1
}

variable "ec2_instance_type"{
    description = "the instance type of ec2"
    type = map(string)
    default = {
	"small-apps" = "t3.micro"
	"medium-apps" = "t3.micro"
	"large-apps" = "t3.large"
	}
   }	