project_id = "master-project-professor"
vpc_name   = "money-heist-network-1"
subnets = [
  {
    name          = "royal-mint-1"
    ip_cidr_range = "10.0.0.0/24"
    region        = "us-central1"
    secondary_ip_range = {
      pods = "172.16.0.0/20"
    services = "192.168.0.0/24" }
  },
]
cluster_name             = "money-heist-cluster-1"
location                 = "us-central1"
nodepool_name            = "royal-mint-node-pool-1"
subnet_name              = "royal-mint-1"
secondary_range_pods     = "pods"
secondary_range_services = "services"