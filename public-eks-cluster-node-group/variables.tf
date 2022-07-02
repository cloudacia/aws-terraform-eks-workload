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

variable "node_group_name" {
  type    = string
  default = "cloudacia_eks_node_group"
}
