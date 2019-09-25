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

variable "node_count" {
    type = "string"
    default = 1
}

variable "machine_type" {
    type = "string"
    default = "n1-standard-1"
}