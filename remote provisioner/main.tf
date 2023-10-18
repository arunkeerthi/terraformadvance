resource "aws_instance" "myec2" {
    ami = "ami-051f7e7f6c2f40dc1"
    instance_type = "t2.micro"
    key_name = "jenkinsslave"
    security_groups = ["all tcp"]
    tags = {
        "Name" = "arun"
    }

provisioner "file"{
    source = "index.html"
    destination = "/tmp/index.html"
    connection{
     type = "ssh"
     host = self.public_ip
     user = "ec2-user"
     password = ""
     private_key = file("jenkinsslave.pem")
} 
}
provisioner "remote-exec" {
    inline = [
        "sudo amazon-linux-extras enable nginx1.12",
        "sudo yum -y install nginx",
        "sudo systemctl start nginx",
        "sudo cp /tmp/index.html /usr/share/nginx/html/index.html",
    ]
    connection{
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        password = ""
        private_key = file("jenkinsslave.pem")

    }
}   

}
#Why we use remote.exec?
#If we want to exec some command in remote machine we can use this concept
#This is smiliarly like userdata concept
#we can send the file to remote machine by using file provisioner and able the execute command to remote machine 
#setup
#first we should create the index.html in local terraform
#Add pem file in terraform dirctory
