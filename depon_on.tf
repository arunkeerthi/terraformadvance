terraform {
    required_version =  "~>1.5.0"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }
    }
}
provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "mybucket"{
    for_each = {
        qa = "qa-bucket-random"
        dev = "dev-bucket-random"
    }
    bucket = "${each.key}-${each.value}"
    tags ={
        name = each.key
    }
    depends_on = [aws_iam_user.myuser]

}

resource "aws_iam_user" "myuser"{
    for_each = toset(["arun","kumar","rami"])
    name = each.key
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "myvpc"
    }
    depends_on = [aws_s3_bucket.mybucket]
}