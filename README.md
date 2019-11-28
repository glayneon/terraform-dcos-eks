# tf-eks-aws



General aws eks deploy using Terraform
---
## Notice
This Module is origined from 'Terraform-msf-eks' module in Terraform Registry.

And I Added new variables and local variables for comprising name convension for my division AIOPS like below.
- Keypair definition and variable
- Name convension for AIOPS division so that we can easily notice our resources made by Terraform in AWS.
- I changed the Available Zone list can be generated automately.
- I upgrade k8s version and check out the userdata for k8s 1.14



## for more info
- [Amazon Elastic Kubernetes Service](https://aws.amazon.com/eks/)
- [Terraform](https://www.terraform.io/)


## Usage

create main.tf file and pass your variables link example
```terraform
module "eks" {
  source              = "git::https://github.com/glayneon/terraform-dcos-eks"
  aws-region          = var.aws-region
  availability-zones  = local.azs
  cluster-name        = local.cluster-name
  k8s-version         = var.k8s-version
  node-instance-type  = var.node-instance-type
  root-block-size     = var.root-bock-size
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
  eks-cw-logging = var.eks-cw-logging
  ec2-key        = var.ec2-key
  ## If you need an IP range for accessing your Bastion, Uncomment the below line and
  ## Add the variable 'bastion-ingress-range' in variable.tf
  # bastion-ingress-range = var.bastion-ingress-range
}

output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "config-map" {
  value = module.eks.config-map
}

```

### Terraform

You need to run the following commands to create the resources with Terraform:

```bash
terraform init
terraform plan
terraform apply
```



### Setup kubectl

Setup your `KUBECONFIG`

```bash
terraform output kubeconfig > ~/.kube/eks-cluster
export KUBECONFIG=~/.kube/eks-cluster
```

### Authorize worker nodes

Get the config from terraform output, and save it to a yaml file:

```bash
terraform output config-map > config-map-aws-auth.yaml
```

Apply the config map to EKS:

```bash
kubectl apply -f config-map-aws-auth.yaml
```

You can verify the worker nodes are joining the cluster

```bash
kubectl get nodes --watch
```

### Cleaning up

You can destroy this cluster entirely by running:

```bash
terraform plan -destroy
terraform destroy  --force
```
