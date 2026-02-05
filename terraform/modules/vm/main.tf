# vm instances
resource "google_compute_instance" "vm" {
  for_each = var.instances

  name         = "${each.key}-${var.env}"
  machine_type = each.value.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = each.value.image
    }
  }

  network_interface {
    network = each.value.network
  }
}


