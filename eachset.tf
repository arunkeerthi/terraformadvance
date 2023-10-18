terraform {
    required_version = "~>1.5.0"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.6.2"
        }

    } 


}
provider "aws" {
    region = "ap-south-1"
}

resource "aws_iam_user" "myuser" {
    for_each = toset(["arun","kumar","raja","hari","dinesh"])
    name = each.key
}