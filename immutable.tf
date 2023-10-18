#terraformblock
terraform{
  required_version = "~> 1.5.0"
  required_providers{
    aws = {
        source = "hashicorp/aws"
        version = "5.6.2"
    }
  
  }

}
# adding provider
provider "aws" {
    region = "ap-south-1"
}

# adding resources
resource "aws_vpc" "myvpc1"{
    cidr_block = "10.0.0.0/16"
    tags = {
         "Name" = "terraf-vpc-mumbai"
         "Env" = "dev"
         "Author" = "arun"
    }
}