
# Allow VM service account to access
# only the application storage bucket.

resource "google_storage_bucket_iam_member" "app_storage" {
  bucket = module.storage.bucket_name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.vm_sa.email}"
}

# Allow VM to read application secrets.

resource "google_project_iam_member" "secret_accessor" {
  project = var.project_id
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.vm_sa.email}"
}
