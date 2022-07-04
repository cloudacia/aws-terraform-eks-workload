resource "aws_eip" "nat01" {
  vpc = true

  tags = {
    Name = var.default_tag
  }
}

resource "aws_eip" "nat02" {
  vpc = true

  tags = {
    Name = var.default_tag
  }
}

resource "aws_eip" "nat03" {
  vpc = true

  tags = {
    Name = var.default_tag
  }
}
