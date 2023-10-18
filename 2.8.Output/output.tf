# Define Output Values
# Attribute Reference : EC2 instance public IP
output "ec2_public_ip" {
    description = "my public IP"
    value = aws_instance.myec2[0].public_ip
}

output "ec2_private_ip" {        # output ,description name we can give any
    description = "my private IP"       
    value = aws_instance.myec2[0].private_ip
}