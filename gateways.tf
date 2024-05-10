resource "aws_internet_gateway" "databee" {
  vpc_id = aws_vpc.databee.id
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_nat_gateway" "databee" {
  allocation_id = aws_eip.databee.id
  subnet_id     = aws_subnet.public_1.id
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
  depends_on = [aws_internet_gateway.databee]
}

resource "aws_eip" "databee" {
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
  depends_on = [aws_internet_gateway.databee]
}
