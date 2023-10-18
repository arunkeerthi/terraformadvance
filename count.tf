#terraform block
terraform{
    required_version = "~> 1.5.0"
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }
    }

}

#terraform provider
provider "aws" {
    region = "ap-south-1"
}

#resource ec2-instance
resource "aws_instance" "My-ec2"{
    ami = "ami-0da59f1af71ea4ad2"
    count = "3"
    instance_type = "t2.micro"
    tags = {
        # "Name" = "web"
        "Name" = "web-${count.index}" # web-0 , web-1, web-2
    }
}
