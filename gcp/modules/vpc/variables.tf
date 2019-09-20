variable "name" {
    type = "string"
}

variable "location" {
    type = "string"
    default = "europe-west4"
}

variable "zone" {
    type = "string"
    default = "europe-west4-b"
}

variable "auto_create_subnetworks" {
    type = "string"
    default = "false"
}
