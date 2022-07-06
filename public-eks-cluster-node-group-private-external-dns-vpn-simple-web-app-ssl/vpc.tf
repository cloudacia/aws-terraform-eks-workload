####################################################
# Virtual Private Cloud (VPC)                      #
####################################################
resource "aws_vpc" "cloudacia_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 01                                        #
####################################################
resource "aws_subnet" "subnet01" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 02                                        #
####################################################
resource "aws_subnet" "subnet02" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet02
  availability_zone = var.availability_zone02

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 03                                        #
####################################################
resource "aws_subnet" "subnet03" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet03
  availability_zone = var.availability_zone03

  tags = {
    Name = var.default_tag
  }
}


####################################################
# SUBNET 04                                        #
####################################################
resource "aws_subnet" "subnet04" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet04
  availability_zone = var.availability_zone01

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 05                                        #
####################################################
resource "aws_subnet" "subnet05" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet05
  availability_zone = var.availability_zone02

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 06                                        #
####################################################
resource "aws_subnet" "subnet06" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet06
  availability_zone = var.availability_zone03

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 07                                        #
####################################################
resource "aws_subnet" "subnet07" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet07
  availability_zone = var.availability_zone01

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 08                                        #
####################################################
resource "aws_subnet" "subnet08" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet08
  availability_zone = var.availability_zone02

  tags = {
    Name = var.default_tag
  }
}

####################################################
# SUBNET 07                                        #
####################################################
resource "aws_subnet" "subnet09" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet09
  availability_zone = var.availability_zone03

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt02" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt03" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt04" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt05" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt06" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE                                    #
####################################################
resource "aws_route_table" "rt07" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt01.id
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta02" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.rt01.id
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta03" {
  subnet_id      = aws_subnet.subnet03.id
  route_table_id = aws_route_table.rt01.id
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta04" {
  subnet_id      = aws_subnet.subnet04.id
  route_table_id = aws_route_table.rt02.id
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta05" {
  subnet_id      = aws_subnet.subnet05.id
  route_table_id = aws_route_table.rt03.id
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta06" {
  subnet_id      = aws_subnet.subnet06.id
  route_table_id = aws_route_table.rt04.id
}

####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta07" {
  subnet_id      = aws_subnet.subnet07.id
  route_table_id = aws_route_table.rt05.id
}


####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta08" {
  subnet_id      = aws_subnet.subnet08.id
  route_table_id = aws_route_table.rt06.id
}


####################################################
# ROUTING TABLE ASSOCIATION                        #
####################################################
resource "aws_route_table_association" "rta09" {
  subnet_id      = aws_subnet.subnet09.id
  route_table_id = aws_route_table.rt07.id
}

####################################################
# INTERNET GATEWAY                                 #
####################################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = var.default_tag
  }
}

####################################################
# VPC NAT Gateway                                  #
####################################################
resource "aws_nat_gateway" "gw01" {
  allocation_id = aws_eip.nat01.id
  subnet_id     = aws_subnet.subnet01.id

  tags = {
    Name = var.default_tag
  }

  depends_on = [aws_internet_gateway.ig]
}

####################################################
# VPC NAT Gateway                                  #
####################################################
resource "aws_nat_gateway" "gw02" {
  allocation_id = aws_eip.nat02.id
  subnet_id     = aws_subnet.subnet02.id

  tags = {
    Name = var.default_tag
  }

  depends_on = [aws_internet_gateway.ig]
}

####################################################
# VPC NAT Gateway                                  #
####################################################
resource "aws_nat_gateway" "gw03" {
  allocation_id = aws_eip.nat03.id
  subnet_id     = aws_subnet.subnet03.id

  tags = {
    Name = var.default_tag
  }

  depends_on = [aws_internet_gateway.ig]
}



####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}

####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "nat_gateway_01" {
  route_table_id         = aws_route_table.rt02.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw01.id
}


####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "nat_gateway_02" {
  route_table_id         = aws_route_table.rt03.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw02.id
}

####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "nat_gateway_03" {
  route_table_id         = aws_route_table.rt04.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw03.id
}

####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "nat_gateway_04" {
  route_table_id         = aws_route_table.rt05.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw01.id
}

####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "nat_gateway_05" {
  route_table_id         = aws_route_table.rt06.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw02.id
}

####################################################
# ADDING ROUTE TO A ROUTING TABLE                  #
####################################################
resource "aws_route" "nat_gateway_06" {
  route_table_id         = aws_route_table.rt07.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw03.id
}
