/*
# Sample
export TF_VAR_variable_name=value

#set Environment Variables
export TF_VAR_ec2_instance_count=1
export TF_VAR_ec2_instance_type=t3.large
echo $TF_VAR_ec2_instance_count, $TF_VAR_ec2_instance_type

# Initialize Terraform
terraform init

#validate Terraform Configuration files
terraform validate

#Format terraform Configuration files
terraform fmt

# revivew the terraform plan
terraform plan

#UNSET Environment Variables after demo
unset TF_VAR_ec2_instance_count
unset TF_VAR_ec2_instance_type
*/




variable "aws_region" {
    description = "Region in which AWS resources to be created"
    type = string
    default = "us-east-2"
}

variable "ec2_ami_id" {
    description = "AMI ID for creating a EC2"
    type = string
    default = "ami-0da59f1af71ea4ad2"
}

variable "ec2_instance_count" {
    description = "no of ec2 instance"
    type = number
    default = 1
}

variable "ec2_instance_type"{
    description = "the instance type of ec2"
    type = string
    default = "t2.micro"
}