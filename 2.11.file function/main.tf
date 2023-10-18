resource "aws_instance" "myinstance" {
    ami = var.ec2_ami_id
    count = var.ec2_count
    instance_type = var.ec2_instance_type
    key_name = var.ec2_key_name
    security_groups = [var.ec2_security_group["type1"]]
    user_data = file("installhttpd.sh")
    tags = {
        Name = var.ec2_tags
        
    }

}


resource "aws_instance" "myinstance1"{
    ami = var.ec2_ami_id
    instance_type = var.ec2_instance_type
    key_name = var.ec2_key_name
    security_groups = [var.ec2_security_group["type1"]]
    user_data = <<-EOF
    #!/bin/bash
    sudo yum install httpd -y
    cd /var/www/html
    echo "<html><h1>Welcome to greens...!!</h1></html>" > index.html
    sudo systemctl enable httpd
    sudo systemctl start httpd
    EOF
    tags = {
        Name = var.ec2_tags
        
    }

}
