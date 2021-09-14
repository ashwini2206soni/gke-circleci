variable "project_id" {
  type        = string
  description = "Project id for Money Heist project"
}

variable "vpc_name" {
  type        = string
  description = "Name of VPC used by Cluster"
}

variable "subnets" {
  description = "subnet created inside VPC network"
  type = list(object({
    ip_cidr_range      = string
    name               = string
    region             = string
    secondary_ip_range = map(string)
  }))
  default = []
}
variable "subnet_name" {
  description = "name of teh subnet used by cluster"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name."
  type        = string
}

variable "location" {
  description = "Cluster location."
  type        = string
}

variable "nodepool_name" {
  description = "Name of node pool"
  type        = string
}

variable "secondary_range_pods" {
  description = "Subnet secondary range name used for pods"
  type        = string
}

variable "secondary_range_services" {
  description = "Subnet secondary range name used for services"
  type        = string
}
