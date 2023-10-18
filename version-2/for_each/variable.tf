variable "vpcs" {
    default = [
        "10.0.0.0/16",
        "10.1.0.0/16"
    ]
}

variable "region" {
    type = string
    default = "us-east-2"
}

