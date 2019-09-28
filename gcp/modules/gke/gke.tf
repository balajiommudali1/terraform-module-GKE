terraform {
  required_version = ">= 0.12"
}

resource "google_container_cluster" "gke" {
  provider = google-beta

  name     = var.name
  description = var.description
  
  location = var.location
  network = var.network
  subnetwork = var.subnetwork
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count = 1

  # We need google-beta provider to use cluster_autoscaling.
  cluster_autoscaling {
    enabled = var.cluster_autoscaling_enabled
    resource_limits {
      resource_type = "cpu"
      minimum = var.cpu_min
      maximum = var.cpu_max
    }
    resource_limits {
      resource_type = "memory"
      minimum = var.mem_min
      maximum = var.mem_max
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {

  project = google_container_cluster.gke.project
  name       = "default-pool"
  location   = google_container_cluster.gke.location
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count

  autoscaling {
    min_node_count = "1"
    max_node_count = "2"
  }

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}