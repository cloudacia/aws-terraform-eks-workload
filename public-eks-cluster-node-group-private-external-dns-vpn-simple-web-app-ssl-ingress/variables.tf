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

# AWS SUBNET #7 IP SUBNET
variable "subnet07" {
  type        = string
  default     = "10.0.7.0/24"
  description = "A public network"
}

# AWS SUBNET #8 IP SUBNET
variable "subnet08" {
  type        = string
  default     = "10.0.8.0/24"
  description = "A public network"
}

# AWS SUBNET #9 IP SUBNET
variable "subnet09" {
  type        = string
  default     = "10.0.9.0/24"
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
  default = "cloudacia_eks_node_group"
}

# AWS RESOURCE TAG
variable "default_tag" {
  type    = string
  default = "Cloudacia Development"
}

# AWS ROUTE53 hosted zone
variable "cloudacia_hosted_zoned" {
  type    = string
  default = "Z04635131CEYH4L1VZ635"
}

#EKS CLUSTER NAME
variable "eks_cluster_name" {
  type    = string
  default = "cloudacia-eks-cluster"
}

# EKS Service Account Name
variable "eks_service_account_name" {
  type    = string
  default = "external-dns"
}

# EKS Service Account Name
variable "eks_service_account_name_2" {
  type    = string
  default = "aws-load-balancer-controller"
}

# EKS Service Account Name namespace
variable "eks_service_account_namespace" {
  type    = string
  default = "default"
}

# External-DNS manifiest
variable "eks_external_dns_manifest" {
  type    = string
  default = "external-dns.yml"
}

# K8S deployment manifest
variable "eks_deployment_manifest_1" {
  type    = string
  default = "simple-web-app.yml"
}

# K8S deployment manifest
variable "eks_deployment_manifest_2" {
  type    = string
  default = "2048_full.yaml"
}

# SSL CERTIFICATE
variable "ssl_certificate_01" {
  type    = string
  default = "*.cloudacia.net"
}

# WWWW DNS RECORD
variable "www_dns_record01" {
  type    = string
  default = "www.cloudacia.net"
}

# DNS DOMAIN NAME
variable "domain_name" {
  type    = string
  default = "cloudacia.net."
}

# TargetGroupBinding for AWS ALB INGRESS operator
variable "targetgroupbinding" {
  type    = string
  default = "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
}

# EKS chart repository
variable "els_charts_repo" {
  type    = string
  default = "https://aws.github.io/eks-charts"
}

# AWS Load Balanceer controller name
variable "eks_alb_controller_name" {
  type    = string
  default = "aws-load-balancer-controller eks/aws-load-balancer-controller"
}

# WWWW DNS RECORD
variable "www_dns_record02" {
  type    = string
  default = "game.cloudacia.net"
}
