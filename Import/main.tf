provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc"
    }
  
}



#command terrform aws_vpc.myvpc.vpc-0420c7de93edf1b21