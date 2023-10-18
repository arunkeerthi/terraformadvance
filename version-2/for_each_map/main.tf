resource "aws_vpc" "vpc1" {
    for_each = var.vpcs
    cidr_block = each.value
    tags = {
        "Name" = each.key
    }
  
}