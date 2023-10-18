provider "aws" {
    region = "us-east-2"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "eksvpc"
    }
}

resource "aws_subnet" "public-1"{
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true
    tags = {
        Name = "pub-1"
    }
}

resource "aws_subnet" "public-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2b"
    map_public_ip_on_launch = true
    tags = {
        Name = "pub-2"
    }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "pubrt" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "public-rtb"
    }

}

resource "aws_route_table_association" "pub-1" {
    subnet_id = aws_subnet.public-1.id
    route_table_id = aws_route_table.pubrt.id 
}

resource "aws_route_table_association" "pub-2" {
    subnet_id = aws_subnet.public-2.id
    route_table_id = aws_route_table.pubrt.id
  
}

resource "aws_security_group" "sgw" {
    name = "allowtls"
    description = "allow all traffice"
    vpc_id = aws_vpc.myvpc.id
    ingress {
        description = "tls from vpc"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    

    ingress {
        description = "tls from vpc"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks =  ["0.0.0.0/16"]
    }

    tags = {
        Name = "allow_all_tags"
    }

}
  
 