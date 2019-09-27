module "gke" {
    source = "../../modules/gke"

    project = "kubernetes-252917"
    name = "gke-test"
    network = data.terraform_remote_state.vpc.outputs.vpc_name
    subnetwork = google_compute_subnetwork.subnetwork.name

    node_count = "1"
}