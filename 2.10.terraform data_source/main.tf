data "aws_ami" "arun" {
   most_recent = true
   owners      = ["amazon"]
   filter {
      name = "name"
      values = ["al2023-ami-2023.2.20231002.0-kernel-6.1-x86_64*"]  #by future any ami number changed it will update here.
      }
}

resource "aws_instance" "myec2" {
    ami = data.aws_ami.arun.id
    instance_type = "t2.micro"
    tags = {
        "Name" = "dataec2"
    }
}


output "ami_id" {
  value = data.aws_ami.arun.id
 }

# Data Source is used to fetch data dynamically from amazon. Based on the latest update the resource will be created.