# create security group - web traffic
resource "aws_security_group" "vpc-web" {
    name = "vpc-web"
    description = "Dev VPC web"
    ingress{
        description = "Allow Port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "Allwo Port 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        description = "allow all ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
}    
/*
resource "aws_security_group" "vpc-web-2" {
    name = "vpc-web-2"
    description = "Dev VPC web-2"
    ingress{
        description = "Allow Port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "Allwo Port 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        description = "allow all ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
} 

resource "aws_security_group" "vpc-web-3" {
    name = "vpc-web-3"
    description = "Dev VPC web-3"
    ingress{
        description = "Allow Port 80"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress{
        description = "Allwo Port 443"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        description = "allow all ip and ports outbound"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
} 

resource "aws_instance" "myinstance" {
    ami = "ami-080c09858e04800a1"
    instance_type = "t2.micro"
    tags = {
        "Name" = "web"
    }
}
*/