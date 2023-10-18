terraform{
    required_version = "~> 1.5.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }
    }
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "mybucket" {
    for_each = {
        dev = "dev-bucket-6666"
        qa = "qa-bucket-6666"
        prod = "prod-bucket-6666"
    }
    bucket = "${each.key}-${each.value}"
    acl = "private"
    tags = {
        Name = each.key
    }
 
}