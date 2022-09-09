output "hvr_vm"{
 value = google_compute_instance.hvr_agent_vm
}
output "hvr_vm_ip" {
  value = google_compute_instance.hvr_agent_vm.network_interface.0.access_config.0.nat_ip
}
