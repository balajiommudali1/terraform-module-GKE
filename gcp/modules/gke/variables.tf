variable "name" {
    description = "the name of the cluster"
    type = "string"
}

variable "description" {
    description = "the description of the cluster"
    type = "string"
    default = ""
}

variable "location" {
    description = "the location (region or zone) to the host the cluster in"
    type = "string"
    default = "europe-west4"
}

variable "network" {
    description = "the VPC network to host the cluster in"
    type = "string"
}

variable "subnetwork" {
    description = "subnetwork to host the cluster in"
    type = "string"
}

variable "cluster_autoscaling_enabled" {
    description = "enable or disable autoscaling cluster"
    type = "string"
    default = "false"
}

variable "cpu_min" {
    description = "Minimum amount of the cpu. This field is required if the cluster_autoscaling_enabled is true"
    type = "string"
    default = null
}

variable "cpu_max" {
    description = "Maximum amount of the cpu. This field is required if the cluster_autoscaling_enabled is true"
    type = "string"
    default = null
}

variable "mem_min" {
    description = "Minimum amount of the memory. This field is required if the cluster_autoscaling_enabled is true"
    type = "string"
    default = null
}

variable "mem_max" {
    description = "Maximum amount of the memory. This field is required if the cluster_autoscaling_enabled is true"
    type = "string"
    default = null
}

variable "network_policy_enabled" {
    description = "Whether network policy is enabled on the cluster. Defaults to false"
    type = "string"
    default = "false"
}

variable "network_policy_provider" {
    description = "The selected network policy provider. Defaults to PROVIDER_UNSPECIFIED"
    type = "string"
    default = "PROVIDER_UNSPECIFIED"
}

variable "node_count" {
    type = "string"
    default = 1
}

variable "min_node_count" {
    type = "string"
    description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count"
    default = null
}

variable "max_node_count" {
    type = "string"
    description = "Maximum number of nodes in the NodePool. Must be >= min_node_count"
    default = null
}

variable "machine_type" {
    type = "string"
    default = "n1-standard-1"
}