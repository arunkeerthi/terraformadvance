# Terraform Block
terraform {
    required_version ="~>1.6.0"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }
    }

# Adding Backend as for Remote state Storage
    backend "s3" {
      bucket = "s3terraform2020" 
      key = "terraform.tfstate"
      region = "us-east-2"
      dynamodb_table = "terra-table"
   }

}

#provider block
provider "aws" {
    region = var.aws_region

}

