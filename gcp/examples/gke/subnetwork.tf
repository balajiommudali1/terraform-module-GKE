data "terraform_remote_state" "vpc" {
    backend = "gcs"
    config = {
        bucket = "tfbackend"
        prefix = "terraform/vpc_gke"
    }
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = "gke-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "europe-west4"
  network       = data.terraform_remote_state.vpc.outputs.vpc_name
}