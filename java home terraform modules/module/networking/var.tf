variable "vpc_cidr" {
    default = "10.200.0.0/16"
  
}
variable "vpc_tags" {
    default = {
        Name = "arunvpc"
    }
}

/*
variable "sub_count" {
    default = 2
}                    #nstead of using count we can use length variable.
*/

variable "pub_cidrs" {
   default = ["10.200.0.0/24","10.200.1.0/24"]
}


variable "prv_cidrs" {
   default = ["10.200.2.0/24","10.200.3.0/24"]
}