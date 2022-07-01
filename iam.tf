###############################################
#  AWS IAM ROLE FOR EKS CLUSTER               #
###############################################
resource "aws_iam_role" "eks_control_plane" {
  name               = "CloudaciaServiceRoleForEKSCluster"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
      }
    ]
  }
EOF
}

###############################################
#  AWS IAM ROLE FOR EKS WORKERS               #
###############################################
resource "aws_iam_role" "eks_data_plane" {
  name               = "CloudaciaServiceRoleForEKSWorkers"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
      }
    ]
  }
EOF
}

###############################################
#  AWS IAM POLICY FOR EKS CONTROL PLANE       #
###############################################
data "aws_iam_policy" "eks_control_plane" {
  name = var.eks_control_plane_policy
}

###############################################
#  AWS IAM POLICY FOR EKS DATA PLANE #1       #
###############################################
data "aws_iam_policy" "eks_data_plane_policy_1" {
  name = var.eks_data_plane_policy["policy1"]
}

###############################################
#  AWS IAM POLICY FOR EKS DATA PLANE #2       #
###############################################
data "aws_iam_policy" "eks_data_plane_policy_2" {
  name = var.eks_data_plane_policy["policy2"]
}

###############################################
#  AWS IAM POLICY FOR EKS DATA PLANE #3       #
###############################################
data "aws_iam_policy" "eks_data_plane_policy_3" {
  name = var.eks_data_plane_policy["policy3"]
}

####################################################
#  ATTACHING POLICY TO IAM EKS CONTROL PLANE ROLE  #
####################################################
resource "aws_iam_role_policy_attachment" "eks_control_plane" {
  role       = aws_iam_role.eks_control_plane.name
  policy_arn = data.aws_iam_policy.eks_control_plane.arn
}

####################################################
#  ATTACHING POLICY TO IAM EKS DATA PLANE ROLE     #
####################################################
resource "aws_iam_role_policy_attachment" "eks_data_plane_1" {
  role       = aws_iam_role.eks_data_plane.name
  policy_arn = data.aws_iam_policy.eks_data_plane_policy_1.arn
}

####################################################
#  ATTACHING POLICY TO IAM EKS DATA PLANE ROLE     #
####################################################
resource "aws_iam_role_policy_attachment" "eks_data_plane_2" {
  role       = aws_iam_role.eks_data_plane.name
  policy_arn = data.aws_iam_policy.eks_data_plane_policy_2.arn
}

####################################################
#  ATTACHING POLICY TO IAM EKS DATA PLANE ROLE     #
####################################################
resource "aws_iam_role_policy_attachment" "eks_data_plane_3" {
  role       = aws_iam_role.eks_data_plane.name
  policy_arn = data.aws_iam_policy.eks_data_plane_policy_3.arn
}
