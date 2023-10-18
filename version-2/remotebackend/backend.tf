terraform{
    backend "s3" {
        bucket = "arun-s3-demo-backend"
        region = "us-east-2"
        key = "arun/terraform.tfstate"
        dynamodb_table = "terraform-lock-1"
    }
}