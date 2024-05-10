resource "aws_route_table" "public" {
  vpc_id = aws_vpc.databee.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.databee.id
  }
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.databee.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.databee.id
  }
  tags = {
    Name = "databee-private-route-table"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
  
}

