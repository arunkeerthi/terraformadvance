#locals
locals{
    project = "A"
}


#creating bucket
resource "aws_s3_bucket" "mybucket" {
    bucket = "arunkumar0901"
    acl = "private"
    tags = {
        "Name" = "arun"
        "project" = local.project
    }
}

#creating VPC
resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        "project" = local.project
    }
}

#creating  EC2 instance
resource "aws_instance" "myec2" {
    ami = "ami-06f621d90fa29f6d0"
    instance_type = "t2.micro"
    tags = {
        "Name" = "arun"
        "project" = local.project
    }
}