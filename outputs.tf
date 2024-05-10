output "vpc_id" {
  description = "The VPC ID where the EKS cluster is deployed."
  value       = aws_vpc.databee.id
}

output "subnet_ids" {
  description = "The IDs of the subnets used by the EKS cluster."
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id, aws_subnet.public_1.id, aws_subnet.public_2.id]
}