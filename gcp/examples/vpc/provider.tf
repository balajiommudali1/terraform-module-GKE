provider "google" {
  version = "~> 2.16"
  project = "kubernetes-252917"
  region  = "europe-west4"
}

terraform {
  backend "gcs" {
    bucket  = "tfbackend"
    prefix  = "terraform/vpc_gke"
  }
}