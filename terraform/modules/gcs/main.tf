resource "google_storage_bucket" "bucket" {
  for_each = var.buckets

  name     = each.key
  location = each.value.location

  versioning {
    enabled = each.value.versioning
  }

  lifecycle_rule {
    condition {
      age = each.value.lifecycle_days
    }
    action {
      type = "Delete"
    }
  }

  labels = each.value.labels
}

resource "google_storage_bucket_iam_member" "bucket_iam" {
  for_each = {
    for bucket_name, cfg in var.buckets :
    bucket_name => cfg.iam_roles
  }

  bucket = google_storage_bucket.bucket[each.key].name
  role   = each.value[0]
  member = "serviceAccount:${var.service_account_email}"
}
