variable "ec2_intance_tag"{
    description = " create the tag"
    type = map(string)
    default = {
        project = "alpha"
        env = "dev"
    }
}