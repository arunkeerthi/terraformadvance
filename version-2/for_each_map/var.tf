variable "vpcs"{
    default = {
       app_one = "10.0.0.0/16",
       app_two = "10.1.0.0/16"
    }
}

variable "region" {
    type = string
    default = "us-east-2"
}