module "iam" {
  source = "../modules/iam"

  project_id       = var.project_id
  env              = var.env
  service_accounts = var.service_accounts
}
module "gcs" {
  source = "../modules/gcs"

  project_id            = var.project_id
  env                   = var.env
  buckets               = var.buckets
  service_account_email = module.iam.service_account_emails["app"]
}

# vm instances

module "vm" {
  source = "../modules/vm"

  project_id = var.project_id
  env        = var.env
  zone       = var.zone
  instances  = var.instances
}

# GKE cluster

module "gke" {
  source = "../modules/gke"

  env          = var.env
  cluster_name = var.cluster_name
  node_count   = var.node_count
  machine_type = var.machine_type
  zone1         = var.zone1
}

#vpc networking

module "networking" {
  source = "../modules/vpc_networking"

  vpc_name       = var.vpc_name
  region         = var.region
  subnets        = var.subnets
  firewall_rules = var.firewall_rules
}

