output "instance_names" {
    value = keys(google_compute_instance.vm)
}