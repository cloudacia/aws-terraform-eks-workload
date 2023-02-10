####################################################
#                EKS FARGATE PROFILE               #
####################################################

resource "aws_eks_fargate_profile" "profile-1" {
  cluster_name           = aws_eks_cluster.this.name
  fargate_profile_name   = var.eks_fargate_profile_name
  pod_execution_role_arn = aws_iam_role.eks_fargate_profile.arn
  subnet_ids             = [aws_subnet.subnet04.id, aws_subnet.subnet05.id, aws_subnet.subnet06.id]

  selector {
    namespace = var.eks_fargate_selector_1
  }
}

####################################################
#                EKS FARGATE ROLE                  #
####################################################

resource "aws_iam_role" "eks_fargate_profile" {
  name = var.eks-fargate-profile-role

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

####################################################
#                EKS FARGATE ROLE ATTACHMENT       #
####################################################

resource "aws_iam_role_policy_attachment" "example-AmazonEKSFargatePodExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.eks_fargate_profile.name
}
