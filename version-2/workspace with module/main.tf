resource "aws_instance" "myec2" {
    count = 3
    ami = var.ami
    instance_type = var.instance_type 
    tags = {
        Name = "${terraform.workspace}-${count.index+1}"
    }
}