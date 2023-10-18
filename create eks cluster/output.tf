output "public_ip" {
    description = "this is the public ip"
    value = aws_instance.myec2.public_ip
}

output "private_ip" {
    description = "this is the public ip"
    value = aws_instance.myec2.private_ip
}