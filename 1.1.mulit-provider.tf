#terrafrom block
terraform{
    required_version = "~> 1.5.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }
    }
}

# Provider-1 for mumbai (default provider)
provider "aws" {
  region = "ap-south-1"
}

# Provider-2 for singapore 
provider "aws" {
  region = "ap-south-1"
  alias = "sing"
}

# resource Block to Create VPC in ap-south-1 which use default provider
resource "aws_vpc" "my_vpc_1" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "terra-vpc-mumbai"
    }
}

# resource Block to Create VPC in ap-south-1 which use alias
resource "aws_vpc" "my_vpc_2" {
    provider = aws.sing
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "terra-vpc-sing"
    }
}