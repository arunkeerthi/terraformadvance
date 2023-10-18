provider "aws" {
    region = var.region
}

resource "aws_vpc" "demo" {
    cidr_block = "10.10.0.0/16"
}

//create Subnet
resource "aws_subnet" "pub-subnet"{
    vpc_id = aws_vpc.demo.id
    cidr_block = "10.10.1.0/24"
    tags={
        "Name" = "pub_subnet"
    }
}

//create internet gateway
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.demo.id
    tags={
        "Name" = "demo_igw"
    }
}

//create Rout Table
resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.demo.id

route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

tags={
    Name= "public_rout"
}
}
// subnet Associate with rout table
resource "aws_route_table_association" "public_as" {
    subnet_id = aws_subnet.pub-subnet.id
    route_table_id = aws_route_table.pub_rt.id
}

//security group
resource "aws_security_group" "demo_sg"{
    name = "arun.sgw"
    vpc_id = aws_vpc.demo.id
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    tags= {
        Name = "ssh tcp"
    }    

    }

    resource "aws_instance" "myec2" {
        ami = var.ami
        key_name = var.key
        instance_type = var.instance_type
        subnet_id = aws_subnet.pub-subnet.id
        security_groups   = [aws_security_group.demo_sg.id]
        associate_public_ip_address = true
    }


#vpc_security_group_ids









