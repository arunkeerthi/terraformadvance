provider "aws" {
    region = "us-east-2"
}

module "ec2-instance" {
    source = "/root/module/ec2_instance"
    ami = "ami-0d406e26e5ad4de53"
    instance_type = "t2.micro" 
}