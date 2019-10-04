# kubernetes-IaC

This repository contain GKE, EKS and AKS modules to deploy production kubernetes cluster. In variables.tf you can see the description of each argument to deploy kubernetes, for more information you can go to the Terraform website of each provider [GKE](https://www.terraform.io/docs/providers/google/r/container_cluster.html), [EKS](https://www.terraform.io/docs/providers/aws/r/eks_cluster.html) or [AKS](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html).

> This project is in constant evolution by now we're focus in GKE kubernetes cluster.

## Compatibility

This project is meant to use at least [Terraform  0.12 version](https://www.terraform.io/downloads.html) if you haven't this version you need to [upgrade](https://www.terraform.io/upgrade-guides/0-12.html) the Terraform version.

## Usage

There are a multiple examples in the example folder inside each provider [GKE](https://github.com/namku/kubernetes-IaC/tree/master/gcp/examples), EKS, AKS:

```
module "gke" {
    source = "../../modules/gke"

    # google_container_cluster
    name = "gke-test"
    location = "europe-west4"
    node_locations = ["europe-west4-a","europe-west4-b","europe-west4-c"]
    network = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnetwork.name
    cluster_autoscaling_enabled = true
    cpu_min = 1
    cpu_max = 2
    mem_min = 1024
    mem_max = 2048
    network_policy_enabled = true
    network_policy_provider = "CALICO"

    # google_container_node_pool
    node_count = "1"
    min_node_count = "1"
    max_node_count = "2"
}
```
This example deploy GKE in europe-west4 with 3 nodes each one in different zones a, b and c defined with node_locations argument also it has autoscaling.