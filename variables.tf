# Variables Configuration

# data from AWS AZs
data "aws_availability_zones" "available" {}

# Project Name Prefix and sufix variables from Chase
variable "name-project" {
  description = "the name for this project"
  default     = "eks"
}

variable "aws-env" {
  description = "the AWS environment"
  default     = "test"
}

variable "name-prefix" {
  description = "the name prefix for AIOps"
  default     = "dcos"
}

variable "name-owner" {
  description = "The name for owner or team."
  default     = "chase"
}

variable "aws-region" {
  default     = "ap-northeast-2"
  type        = string
  description = "The AWS Region to deploy EKS"
}

# In this case, You can choose your desired AZ
#variable "availability-zones" {
#  default     = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
#  type        = list
#  description = "The AWS AZ to deploy EKS"
#}

variable "k8s-version" {
  default     = "1.14"
  type        = string
  description = "Required K8s version"
}

variable "vpc-subnet-cidr" {
  default     = "10.8.0.0/16"
  type        = string
  description = "The VPC Subnet CIDR"
}

variable "private-subnet-cidr" {
  default     = ["10.8.0.0/19", "10.8.32.0/19", "10.8.64.0/19"]
  type        = list
  description = "Private Subnet CIDR"
}

variable "public-subnet-cidr" {
  default     = ["10.8.128.0/20", "10.8.144.0/20", "10.8.160.0/20"]
  type        = list
  description = "Public Subnet CIDR"
}

variable "eks-cw-logging" {
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  type        = list
  description = "Enable EKS CWL for EKS components"
}

variable "node-instance-type" {
  default     = "m4.large"
  type        = string
  description = "Worker Node EC2 instance type"
}

variable "root-block-size" {
  default     = "20"
  type        = string
  description = "Size of the root EBS block device"
}

variable "desired-capacity" {
  default     = 2
  type        = string
  description = "Autoscaling Desired node capacity"
}

variable "max-size" {
  default     = 5
  type        = string
  description = "Autoscaling maximum node capacity"
}

variable "min-size" {
  default     = 1
  type        = string
  description = "Autoscaling Minimum node capacity"
}

variable "public-min-size" {
  default     = 0
  type        = string
  description = "Public Node groups ASG capacity"
}

variable "public-max-size" {
  default     = 3
  type        = string
  description = "Public Node groups ASG capacity"
}

variable "public-desired-capacity" {
  default     = 0
  type        = string
  description = "Public Node groups ASG capacity"
}

variable "ec2-key" {
  default     = "chase.kim-key"
  type        = string
  description = "Autoscaling Minimum node capacity"
}

# It's local values for name-convension
locals {
  fullname     = "${var.name-prefix}-${var.name-project}-${var.aws-env}"
  prefix-name  = "${local.fullname}"
  cluster-name = "${local.fullname}"
  azs          = data.aws_availability_zones.available.names
}
