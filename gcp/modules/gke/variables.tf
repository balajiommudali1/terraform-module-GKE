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

variable "node_count" {
    type = "string"
    default = 1
}

variable "machine_type" {
    type = "string"
    default = "n1-standard-1"
}