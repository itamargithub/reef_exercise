variable "region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "cluster_name" {
  default = "hello-world-cluster"
}

variable "service_name" {
  default = "hello-world-service"
}

variable "desired_count" {
  default = 1
}
