provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "arun" {
    instance_type = "t2.micro"
    ami = "ami-0d406e26e5ad4de53"
}

resource "aws_dynamodb_table" "terraform" {
    name = "terraform-lock-1"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
        name = "LockID"
        type = "S"
    }

}


resource "aws_s3_bucket" "s3_bucket" {
    bucket = "arun-s3-demo-backend"   
}

resource "aws_s3_bucket_versioning" "arun-s3-version" {
    bucket = aws_s3_bucket.s3_bucket.id
    versioning_configuration {
      status = "Enabled"
    }
}
