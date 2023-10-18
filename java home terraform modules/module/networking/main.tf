resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = var.vpc_tags
 
}

#create Public Subnet
resource "aws_subnet" "public" {
    count = length(var.pub_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.pub_cidrs[count.index]
    availability_zone = data.aws_availability_zones.az.names[count.index]
    tags = {
        Name = "Public-${count.index + 1}"     #interpolitaion used for partially text we give the varialbe.
    }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
}

# create route table for public subnet
resource "aws_route_table" "pub_route" {
    vpc_id = aws_vpc.main.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "publi-route"
    }
  
}

#assoicate rout table with public subnet
resource "aws_route_table_association" "public" {
    count = length(var.pub_cidrs)
    route_table_id = aws_route_table.pub_route.id
    subnet_id = aws_subnet.public.*.id[count.index]
  
}

resource "aws_subnet" "private" {
    count = length(var.prv_cidrs)
    vpc_id = aws_vpc.main.id
    cidr_block = var.prv_cidrs[count.index]
    availability_zone = data.aws_availability_zones.az.names[count.index]
    tags = {
        Name = "private-${count.index + 1}"     #interpolitaion used for partially text we give the varialbe.
    }
}