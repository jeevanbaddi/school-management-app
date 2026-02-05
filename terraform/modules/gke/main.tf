resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone1   # 👈 ZONAL
  
  deletion_protection = false  # 👈 EXPLICIT
  remove_default_node_pool = true
  initial_node_count       = 1

  workload_identity_config {
    workload_pool = "${data.google_client_config.current.project}.svc.id.goog"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone1
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_type    = "pd-standard"
    disk_size_gb = 50

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

data "google_client_config" "current" {}
