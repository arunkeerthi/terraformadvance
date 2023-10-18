#create ec2 instance
resource "aws_instance" "kumar" {
    ami = "ami-051f7e7f6c2f40dc1"
    instance_type = "t2.micro"
    key_name = "jenkinsslave"
    security_groups = ["all tcp"]
    tags = {
        Name = "arun"
    }
#connection block for provisioner to connect to EC2 instance
connection{
    type = "ssh"
    host = self.public_ip # understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("jenkinsslave.pem")  #key should be avaliable in terrafrom folder
}    

# copies the file.copy.html file to /tmp/file-copy.html
provisioner "file" {
    source = "index.html"
    destination = "/tmp/index.html"
 } 
}
