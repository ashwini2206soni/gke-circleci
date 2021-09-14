module "vpc" {
  source     = "../modules/net-vpc"
  project_id = var.project_id
  name       = var.vpc_name
  subnets    = var.subnets
}

module "cluster_1" {
  source                   = "../modules/gke-cluster"
  project_id               = var.project_id
  name                     = var.cluster_name
  location                 = var.location
  network                  = module.vpc.name
  subnetwork               = var.subnet_name
  secondary_range_pods     = var.secondary_range_pods
  secondary_range_services = var.secondary_range_services
  enable_autopilot         = false
  master_authorized_ranges = {
    internal-vms = "10.0.0.0/8"
  }
  private_cluster_config = {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "10.255.255.240/28"
    master_global_access    = false
  }
  labels = {
    environment = "heist"
  }
}

module "cluster-1-nodepool-1" {
  source       = "../modules/gke-nodepool"
  depends_on   = [module.cluster_1]
  project_id   = var.project_id
  cluster_name = var.cluster_name
  location     = var.location
  name         = var.nodepool_name
}