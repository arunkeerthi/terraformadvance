resource "aws_instance" "myec211" {
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    count = var.ec2_instance_count
    associate_public_ip_address = var.ec2_public_ip
    tags = {
        Name = var.ec2_tag
    }
}