resource "google_container_cluster" "gke" {
  name     = "${var.name}"
  description = "${var.description}"
  
  location = "${var.location}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "default-pool"
  location   = "${google_container_cluster.gke.location}"
  cluster    = "${google_container_cluster.gke.name}"
  node_count = "${var.node_count}"

  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}