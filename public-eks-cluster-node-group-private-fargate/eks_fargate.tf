####################################################
#                EKS FARGATE PROFILE               #
####################################################

resource "aws_eks_fargate_profile" "example" {
  cluster_name           = aws_eks_cluster.cloudacia_eks.name
  fargate_profile_name   = "profile-1"
  pod_execution_role_arn = aws_iam_role.example.arn
  subnet_ids = [aws_subnet.subnet04.id,
  aws_subnet.subnet05.id, aws_subnet.subnet06.id]

  selector {
    namespace = "eks-fargate-nodes"
  }
}

####################################################
#                EKS FARGATE ROLE                  #
####################################################

resource "aws_iam_role" "example" {
  name = "eks-fargate-profile-example"

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
  role       = aws_iam_role.example.name
}
