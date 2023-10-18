module "arunmodule" {
    source = "/root/javahome/module/networking"
}

module "myec2" {
    source = "/root/javahome/module/ec2"
    ami_id = "ami-080c09858e04800a1"
    subnet_id = module.arunmodule.public_subnet[0].subnet_id
}