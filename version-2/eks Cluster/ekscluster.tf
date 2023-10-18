resource "aws_eks_cluster" "eks" {
  name = "aruneks"
  role_arn = aws_iam_role.cluster_role.arn

  vpc_config {
    subnet_ids = [aws_subnet.public-1.id,aws_subnet.public-2.id]
  }

  depends_on = [ 
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
   ]
}

