module "gke" {
    source = "../../modules/gke"

    name = "gke-test"
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork.name
    cluster_autoscaling_enabled = false
    // cpu_min = 1
    // cpu_max = 2
    // mem_min = 1024
    // mem_max = 2048

    node_count = "1"
}