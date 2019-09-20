variable "name" {
    type = "string"
}

variable "location" {
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