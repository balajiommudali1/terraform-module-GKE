module "gke" {
    source = "../../modules/gke"

    # google_container_cluster
    name = "gke-test"
    location = "europe-west4"
    node_locations = ["europe-west4-a","europe-west4-b","europe-west4-c"]
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork.name
    // cluster_autoscaling_enabled = true
    // cpu_min = 1
    // cpu_max = 2
    // mem_min = 1024
    // mem_max = 2048
    network_policy_enabled = true
    network_policy_provider = "CALICO"

    # google_container_node_pool
    node_count = "1"
    // min_node_count = "1"
    // max_node_count = "2"
}