################################
###  Security Group for ec2
################################
resource "aws_security_group" "eks_control_plane" {
  name        = "eks_control_plane"
  description = "Security group attached to an EKS control plane"
  vpc_id      = aws_vpc.cloudacia_vpc.id


  # All TCP port
  ingress {
    description = "Allow inbound HTTP traffic"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.default_tag
  }
}

#####################################
###  Security Group for VPN endpoint
####################################

resource "aws_security_group" "client-vpn-access" {
  name   = "terraform-shared-client-vpn-access"
  vpc_id = aws_vpc.cloudacia_vpc.id

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
