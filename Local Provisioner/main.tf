resource "aws_instance" "myec2" {
    ami = "ami-051f7e7f6c2f40dc1"
    instance_type = "t2.micro"
    key_name = "jenkinsslave"
    security_groups = ["all tcp"]
    tags = {
        "Name" = "arun"
    }

provisioner "local-exec" {
    command = "echo ${self.private_ip} >> private_ips.txt"
 }    
}

#  Local-exec which is used to execute some command in local meachine 
#  In real time scenireo which is used for ansible playbook or shell script 