# create EC2 instance
resource "aws_instance" "myec2"{
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type[0]
    count = var.ec2_instance_count
    tags = {
        "Name" = "Myec2"
    }
}