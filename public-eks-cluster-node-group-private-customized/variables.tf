# AWS REGION
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "US East (N. Virginia)"
}

# AWS VPC CIDR
variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = ""
}

# AWS SUBNET #1 IP SUBNET
variable "subnet01" {
  type        = string
  default     = "10.0.1.0/24"
  description = "A public network"
}

# AWS SUBNET #2 IP SUBNET
variable "subnet02" {
  type        = string
  default     = "10.0.2.0/24"
  description = "A public network"
}

# AWS SUBNET #3 IP SUBNET
variable "subnet03" {
  type        = string
  default     = "10.0.3.0/24"
  description = "A public network"
}

# AWS SUBNET #4 IP SUBNET
variable "subnet04" {
  type        = string
  default     = "10.0.4.0/24"
  description = "A public network"
}

# AWS SUBNET #5 IP SUBNET
variable "subnet05" {
  type        = string
  default     = "10.0.5.0/24"
  description = "A public network"
}

# AWS SUBNET #6 IP SUBNET
variable "subnet06" {
  type        = string
  default     = "10.0.6.0/24"
  description = "A public network"
}

# AWS AVAILABILITY ZONE
variable "availability_zone01" {
  type        = string
  default     = "us-east-1a"
  description = "US East (N. Virginia)"
}

# AWS AVAILABILITY ZONE
variable "availability_zone02" {
  type        = string
  default     = "us-east-1b"
  description = "US East (N. Virginia)"
}

# AWS AVAILABILITY ZONE
variable "availability_zone03" {
  type        = string
  default     = "us-east-1c"
  description = "US East (N. Virginia)"
}

# AWS INSTANCE TYPE
variable "instance_type" {
  type    = string
  default = "t2.small"
}

# EKS CONTROL PLAN POLICY
variable "eks_control_plane_policy" {
  type    = string
  default = "AmazonEKSClusterPolicy"
}


# EKS CONTROL PLAN POLICY
variable "eks_data_plane_policy" {
  type = map(any)
  default = {
    policy1 = "AmazonEKSWorkerNodePolicy"
    policy2 = "AmazonEC2ContainerRegistryReadOnly"
    policy3 = "AmazonEKS_CNI_Policy"
  }
}

# EKS NODE GROUP NAME
variable "node_group_name" {
  type    = string
  default = "eks-nodegroup-testing"
}

# AWS RESOURCE TAG
variable "default_tag" {
  type    = string
  default = "Development"
}

# AWS EKS CLUSTER VERSION
variable "eks_cluster_version" {
  type    = string
  default = "1.22"
}

# AWS EKS CLUSTER NAME
variable "eks_cluster_name" {
  type    = string
  default = "eks-cluster-testing"
}

# AWS EKS CONTROL PLANE
variable "eks_control_plane_iam_role_name" {
  type    = string
  default = "ServiceRoleForEKSCluster"
}


# AWS EKS DATA PLANE
variable "eks_data_plane_iam_role_name" {
  type    = string
  default = "RoleForEKSWorkers"
}
