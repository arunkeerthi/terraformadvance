# terraform Block
terraform{
    required_version = "~> 1.6.0"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }
    }
}

# Provider Block
provider "aws" {
    region = "us-east-2"
}


