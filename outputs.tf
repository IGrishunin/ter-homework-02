output "yandex_compute_instance_name" {
  value = yandex_compute_instance.platform.name
}

output "yandex_compute_instance_external_ip" {
  value = yandex_compute_instance.platform.network_interface.0.nat_ip_address
}

output "yandex_compute_instance_fqdn" {
  value = yandex_compute_instance.platform.fqdn
}

output "yandex_compute_instance_name-db" {
  value = yandex_compute_instance.platform-db.name
}

output "yandex_compute_instance_external_ip-db" {
  value = yandex_compute_instance.platform-db.network_interface.0.nat_ip_address
}

output "yandex_compute_instance_fqdn-db" {
  value = yandex_compute_instance.platform-db.fqdn
}
