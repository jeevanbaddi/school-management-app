terraform {
    backend "gcs" {
      bucket = "school-terraform-state"
      prefix = "bld"
    }
}
