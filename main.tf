# EKS Terraform module

module "eks" {
  source             = "./modules/eks"
  aws-region         = var.aws-region
  availability-zones = local.azs
  cluster-name       = local.cluster-name
  k8s-version        = var.k8s-version
  node-instance-type = var.node-instance-type
  root-block-size    = var.root-block-size
  desired-capacity   = var.desired-capacity
  max-size           = var.max-size
  min-size           = var.min-size
  # The below lines is an option for worker nodes on Public subnets
  public-desired-capacity = var.public-desired-capacity
  public-max-size         = var.public-max-size
  public-min-size         = var.public-min-size
  vpc-subnet-cidr     = var.vpc-subnet-cidr
  private-subnet-cidr = var.private-subnet-cidr
  public-subnet-cidr  = var.public-subnet-cidr
  # And The below line is for DB subnets
  #  db-subnet-cidr          = var.db-subnet-cidr
  eks-cw-logging = var.eks-cw-logging
  ec2-key        = var.ec2-key
  # bastion-ingress-range = var.bastion-ingress-range
}
