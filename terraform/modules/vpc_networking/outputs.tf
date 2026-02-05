output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "subnet_ids" {
  value = { for k, s in google_compute_subnetwork.subnets : k => s.id }
}
