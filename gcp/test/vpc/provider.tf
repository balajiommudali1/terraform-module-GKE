provider "google" {
  project = "kubernetes-252917"
  region  = "europe-west4"
  zone    = "europe-west4-b"
}

terraform {
  backend "gcs" {
    bucket  = "tfbackend"
    prefix  = "terraform/vpc_gke"
  }
}