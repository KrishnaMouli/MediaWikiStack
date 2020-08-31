variable "region" {
  description = "Type AWS region in which cluster need to be lauched"
}

variable "service_ports_worker_one" {
  description = "ingress allowed point for worker-node-1"
}


variable "service_ports_worker_two" {
  description = "ingress allowed point for worker-node-2"
}

variable "cluster_version" {
  description = "Cluster version"
}

variable "node_one_size" {}

variable "node_two_size" {}

variable "cluster_name" {}

variable "identifier" {
  description = "provide db identifier name"
}

variable "instance_class" {
  description = "Provide db instance type"
}

variable "name" {
  description = "provide db name"
}

variable "db_user" {
  description = "provide db user name"
}

variable "db_password" {
  description = "provide db password"
}
