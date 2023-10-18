provider "aws" {
    alias = "ap-south-1"   # alias name we can give any name
    region = "ap-south-1"    
}

provider "aws" {
    alias = "us-east-2"  # alias name we can give any name
    region = "us-east-2"
}

resource "aws_instance" "my_ec2_ohio" {
    ami = "ami-0d406e26e5ad4de53"
    instance_type = "t2.micro"
    provider = aws.us-east-2
}

resource "aws_instance" "my_ec2_south" {
    ami = "ami-067c21fb1979f0b27"
    instance_type = "t2.micro"
    provider = aws.ap-south-1
}