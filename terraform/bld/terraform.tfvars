project_id = "velvety-maker-480912-u3"
region     = "us-central1"
env        = "bld"

service_accounts = {
  app = {
    roles = [
      "roles/logging.logWriter",
      "roles/monitoring.metricWriter"
    ]
  }

  ci = {
    roles = [
      "roles/artifactregistry.writer"
    ]
  }

   cd = {
    roles = [
      "roles/artifactregistry.writer"
    ]
  }
}

buckets = {
  "school-bld-app-bucket" = {
    location       = "us-central1"
    versioning     = true
    lifecycle_days = 30
    iam_roles = [
      "roles/storage.objectViewer"
    ]
    labels = {
      env         = "bld"
      app         = "school-app"
      cost_center = "education"
    }
  }
}

# vm instances

zone = "us-central1-a"

instances = {
  app-vm = {
    machine_type = "e2-medium"
    image        = "debian-cloud/debian-11"
    network      = "default"
  }

  ci-vm = {
    machine_type = "e2-small"
    image        = "debian-cloud/debian-11"
    network      = "default"
  }
}

# GKE clusters

cluster_name = "school-bld-gke"
node_count   = 2
machine_type = "e2-medium"
zone1 = "us-central1-a"

#vpc networking

vpc_name = "school-bld-vpc"

subnets = {
  gke-subnet = {
    cidr = "10.10.0.0/16"
  }
  vm-subnet = {
    cidr = "10.20.0.0/16"
  }
}

firewall_rules = {
  allow-internal = {
    protocol      = "tcp"
    ports         = ["0-65535"]
    source_ranges = ["10.0.0.0/8"]
  }

  allow-ssh = {
    protocol      = "tcp"
    ports         = ["22"]
    source_ranges = ["0.0.0.0/0"]
  }

  allow-http = {
    protocol      = "tcp"
    ports         = ["80", "443"]
    source_ranges = ["0.0.0.0/0"]
  }
}


