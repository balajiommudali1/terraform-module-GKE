variable "name" {
  description = "the name of the cluster"
  type        = string
}

variable "description" {
  description = "the description of the cluster"
  type        = string
  default     = ""
}

variable "location" {
  description = "The location (region or zone) in which the cluster master will be created, as well as the default node location. If you specify a zone (such as us-central1-a), the cluster will be a zonal cluster with a single cluster master. If you specify a region (such as us-west1), the cluster will be a regional cluster with multiple masters spread across zones in the region, and with default node locations in those zones as well."
  type        = string
  default     = ""
}

variable "node_locations" {
    description = "The list of zones in which the cluster's nodes are located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If this is specified for a zonal cluster, omit the cluster's zone."
    type        = list(string)
    default     = []
}

variable "horizontal_pod_autoscaling" {
  description = "The status of the Horizontal Pod Autoscaling addon, which increases or decreases the number of replica pods a replication controller has based on the resource usage of the existing pods. It ensures that a Heapster pod is running in the cluster, which is also used by the Cloud Monitoring service"
  type        = bool
  default     = false
}

variable "http_load_balancing" {
  description = "The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster"
  type        = bool
  default     = false
}

variable "kubernetes_dashboard" {
  description = "The status of the Kubernetes Dashboard add-on, which controls whether the Kubernetes Dashboard is enabled for this cluster"
  type        = bool
  default     = true
}

variable "network_policy_config" {
  description = "Whether we should enable the network policy addon for the master. This must be enabled in order to enable network policy for the nodes. To enable this, you must also define a network_policy block, otherwise nothing will happen. It can only be disabled if the nodes already do not have network policies enabled"
  type        = bool
  default     = false
}

variable "network" {
  description = "the VPC network to host the cluster in"
  type        = string
}

variable "subnetwork" {
  description = "subnetwork to host the cluster in"
  type        = string
}

variable "cluster_autoscaling_enabled" {
  description = "enable or disable autoscaling cluster"
  type        = string
  default     = "false"
}

variable "cpu_min" {
  description = "Minimum amount of the cpu. This field is required if the cluster_autoscaling_enabled is true"
  type        = string
  default     = null
}

variable "cpu_max" {
  description = "Maximum amount of the cpu. This field is required if the cluster_autoscaling_enabled is true"
  type        = string
  default     = null
}

variable "mem_min" {
  description = "Minimum amount of the memory. This field is required if the cluster_autoscaling_enabled is true"
  type        = string
  default     = null
}

variable "mem_max" {
  description = "Maximum amount of the memory. This field is required if the cluster_autoscaling_enabled is true"
  type        = string
  default     = null
}

variable "network_policy_enabled" {
  description = "Whether network policy is enabled on the cluster. Defaults to false"
  type        = string
  default     = "false"
}

variable "network_policy_provider" {
  description = "The selected network policy provider. Defaults to PROVIDER_UNSPECIFIED"
  type        = string
  default     = "PROVIDER_UNSPECIFIED"
}

variable "node_count" {
  type    = string
  default = 1
}

variable "min_node_count" {
  type        = string
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count"
  default     = null
}

variable "max_node_count" {
  type        = string
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count"
  default     = null
}

variable "machine_type" {
  type    = string
  default = "n1-standard-1"
}