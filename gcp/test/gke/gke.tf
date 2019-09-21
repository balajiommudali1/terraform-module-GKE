module "gke" {
    source = "../../modules/gke"

    name = "gke-test"
    node_count = "1"
}