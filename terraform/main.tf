locals {
    vpc_cidr = "10.1.0.0/16"
    public_subnets = ["10.1.1.0/24", "10.1.2.0/24"]
    azs = ["eu-north-1a", "eu-north-1b"]
}

module "vpc" {
    source = "./modules/vpc"
    region = var.region
    vpc_cidr = local.vpc_cidr
    public_subnets = local.public_subnets
    azs = local.azs
    vpc_name = "new-main-vpc"
}

module "eks" {
    source = "./modules/eks"
    cluster_name = "new-eks-cluster"
    subnet_ids = module.vpc.subnet_ids
    instance_types = ["t3.medium"]
    node_count = 2
    node_min_size = 1
    node_max_size = 3
}

output "vpc_id" {
    value = module.vpc.vpc_id
}

output "eks_cluster_id" {
    value = module.eks.eks_cluster_id  
}

output "eks_cluster_endpoint" {
    value = module.eks.eks_cluster_endpoint  
}