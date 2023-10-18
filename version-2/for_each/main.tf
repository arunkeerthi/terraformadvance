resource "aws_vpc" "my_vpc" {
    for_each = toset(var.vpcs)
    cidr_block = each.value
    
}