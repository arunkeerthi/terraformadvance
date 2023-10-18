locals{
    env = "dev"
}


resource "aws_vpc" myvpc {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "${local.env} - vpc"
    }
}

resource "aws_instance" "myec2" {
    ami = "ami-036f5574583e16426"
    instance_type = "t2.micro"
    tags = {
        Name = "${local.env} - ec2"
    }
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "ramu010201"
    tags = {
        Name = "${local.env} - s3"
    }
}