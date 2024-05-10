resource "aws_security_group" "eks_security_group" {
  vpc_id = aws_vpc.databee.id
  name   = "eks-cluster-sg"

  ingress {
    description = "Allow specific IP"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["196.182.32.48/32"]
  }

  ingress {
    description = "Allow node traffic"
    from_port   = 1025
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    OWNER    = "McLarenN"
    CATEGORY = "ENG_ASSESSMENT"
  }
}