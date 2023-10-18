# terraform Block
terraform{
    required_version = "~> 1.6.0"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "5.20.0"
        }
    }
}

# Provider Block
provider "aws" {
    region = var.aws_region
}