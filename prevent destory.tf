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

resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "terravpc"
    }
    lifecycle{
     ignore_changes = [tags]
    }
}  

/*
 lifecycle{
     ignore_changes = [tags]
    }