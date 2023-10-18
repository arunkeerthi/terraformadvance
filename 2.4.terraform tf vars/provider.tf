# terraform plan -var-file="dev.tfvars"
# terraform plan -var-file="qa.tfvars"

# terraform block
terraform{
    required_version = "~> 1.5.0"
    required_providers{
        aws = {
            source = "hashi/corp"
            version = "5.6.2"
        }
    }
}

# Provider Block
provider 'aws' {
    region = var.aws_region
}