output "data_project_id"{
 value = google_project.project_data.project_id
}


output "audit_project_id"{
    value = google_project.project_audit.project_id
}

 output host_project_id {
    value = google_project.project_shared_hvpc.project_id
 }