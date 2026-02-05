resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets

  name          = each.key
  ip_cidr_range = each.value.cidr
  region        = var.region
  network       = google_compute_network.vpc.id

  private_ip_google_access = true
}

resource "google_compute_firewall" "rules" {
  for_each = var.firewall_rules

  name    = each.key
  network = google_compute_network.vpc.name

  allow {
    protocol = each.value.protocol
    ports    = each.value.ports
  }

  source_ranges = each.value.source_ranges
}
