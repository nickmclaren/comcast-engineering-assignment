resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.databee.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.databee.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.databee.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-west-2a"
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.databee.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-2b"
  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}