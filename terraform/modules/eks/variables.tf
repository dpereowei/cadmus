variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where EKS will be deployed"
}

variable "instance_types" {
  type        = list(string)
  default     = ["t3.medium"]
  description = "EC2 instance types for EKS nodes"
}

variable "node_count" {
  type        = number
  default     = 2
  description = "Desired number of worker nodes"
}

variable "node_min_size" {
  type        = number
  default     = 1
  description = "Minimum number of worker nodes"
}

variable "node_max_size" {
  type        = number
  default     = 3
  description = "Maximum number of worker nodes"
}
