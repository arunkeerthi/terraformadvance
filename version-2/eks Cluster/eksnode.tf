resource "aws_instance" "kubect-server" {
    ami = "ami-036f5574583e16426"
    instance_type = "t2.micro"
    key_name = "shellscripit"
    associate_public_ip_address = true
    subnet_id = aws_subnet.public-1.id
    vpc_security_group_ids = [aws_security_group.sgw.id]

    tags = {
        Name = "kubectlserver"
    }
  
}

resource "aws_eks_node_group" "node-grp" {
    cluster_name = aws_eks_cluster.eks.id
    node_group_name = "arun_node_group"
    node_role_arn = aws_iam_role.eks_node_role.arn
    subnet_ids = [aws_subnet.public-1.id,aws_subnet.public-2.id]
    capacity_type = "ON_DEMAND"
    disk_size = "20"
    instance_types = ["t2.small"]

    remote_access {
      ec2_ssh_key = "shellscripit"
      source_security_group_ids = [aws_security_group.sgw.id]
    }
    labels = tomap({ env = "dev"})

    scaling_config {
        desired_size = 2    
        max_size = 3
        min_size = 1
    }

    update_config {
      max_unavailable = 1
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.eks_node_role-AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.eks_node_role-AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.eks_node_role-AmazonEKSWorkerNodePolicy
     ]
  
}