provider "google" {
  version = "~> 2.16"
  project = "kubernetes-252917"
  region  = "europe-west4"
  zone    = "europe-west4-b"
}

provider "google-beta" {
  version = "~> 2.16"
  project = "kubernetes-252917"
  region  = "europe-west4"
  zone    = "europe-west4-b"
}

terraform {
  backend "gcs" {
    bucket  = "tfbackend"
    prefix  = "terraform/gke"
  }
}