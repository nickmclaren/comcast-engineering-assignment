variable "region" {
  description = "The AWS region where the resources will be deployed."
  type        = string
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "mclaren"
}

variable "kubernetes_version" {
  description = "The specific Kubernetes version to deploy in the EKS cluster."
  type        = string
  default     = "1.27"
}


variable "fargate_profile_name" {
  description = "Name of Fargate profile"
  type = string
  default = "fargate_profile_nickmclaren"
  
}

variable "eks_cluster_service_role" {
  description = "Name of EKS service role."
  type = string
  default = "eks_cluster_service_role"
  
}

variable "fargate_role" {
  description = "The name of the IAM role for EKS Fargate pods."
  type = string
  default = "fargate_pod_execution_role"
  
}

variable "kubernetes_namespace" {
  description = "name of namespace"
  type = string
  default = "mclaren"
  
}

variable "internet_gateway_name" {
  description = "Name for the Internet Gateway."
  type        = string
  default     = "databee-internet-gateway"
}

variable "nat_gateway_name" {
  description = "Name for the NAT Gateway."
  type        = string
  default     = "databee-nat-gateway"
}

variable "eip_name" {
  description = "Name for the Elastic IP used for the NAT Gateway."
  type        = string
  default     = "databee-nat-eip"
}