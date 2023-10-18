# Input Variables

variable "aws_regions" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "ap-south-1"
}

variable "db_username" {
    description = "RDS Database Administaration Username"
    type = string
	sensitive = true
}  

variable "db_password" {
    description = "db password"
    type = string
    sensitive = true
}

 