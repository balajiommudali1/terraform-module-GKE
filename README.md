# kubernetes-IaC

This repository contain GKE, EKS and AKS modules to deploy production kubernetes cluster. In variables.tf you can see the description of each argument to deploy kubernetes, for more information you can go to the Terraform website of each provider [GKE](https://www.terraform.io/docs/providers/google/r/container_cluster.html), [EKS](https://www.terraform.io/docs/providers/aws/r/eks_cluster.html) or [AKS](https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html).

> This project is in constant evolution by now we're focus in GKE kubernetes cluster.

## Compatibility

This project is meant to use at least Terraform  0.12 version if you haven't this version you need to [upgrade](https://www.terraform.io/upgrade-guides/0-12.html) the terraform version.

