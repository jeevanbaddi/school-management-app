resource "google_service_account" "sa" {
  for_each = var.service_accounts

  account_id   = "school-${each.key}-${var.env}"
  display_name = "School ${each.key} Service Account (${var.env})"
}

resource "google_project_iam_member" "sa_roles" {
  for_each = {
    for sa_name, sa_cfg in var.service_accounts :
    sa_name => sa_cfg.roles
  }

  project = var.project_id
  role    = each.value[0]
  member  = "serviceAccount:${google_service_account.sa[each.key].email}"
}
