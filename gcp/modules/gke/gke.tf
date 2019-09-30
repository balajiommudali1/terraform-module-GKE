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
  # We use dynamic block to avoid an error when
  # cluster_autoscaling is disabled.
  cluster_autoscaling {
    enabled = var.cluster_autoscaling_enabled

    dynamic "resource_limits" {
      for_each = var.cluster_autoscaling_enabled ? [1] : []
      
      content {
        resource_type = "cpu"
        maximum = var.cpu_max
        minimum = var.cpu_min
      }
    }

    dynamic "resource_limits" {
      for_each = var.cluster_autoscaling_enabled ? [1] : []
      
      content {
        resource_type = "memory"
        maximum = var.mem_max
        minimum = var.mem_min
      }
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {

  project = google_container_cluster.gke.project
  name       = "default-pool"
  location   = google_container_cluster.gke.location
  cluster    = google_container_cluster.gke.name
  node_count = var.node_count

  dynamic "autoscaling" {
    for_each = var.min_node_count != null ? [1] : []

    content {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }
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