resource "aws_instance" "myec22" {
    ami = "ami-06f621d90fa29f6d0"
    instance_type = "t2.micro"
    tags = var.ec2_intance_tag
}        
