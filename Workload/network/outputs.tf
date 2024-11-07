output "subnet_pep_id" {
  value = module.subnet_pep.subnet_id
}

output "private_dns_zone_id_blob" {
  value = module.private_dns_zone[0].private_dns_zone
}

output "private_dns_zone_id_dfs" {
  value = module.private_dns_zone[1].private_dns_zone
}

output "private_dns_zone_id_db" {
  value = module.private_dns_zone[2].private_dns_zone
}

output "subnet_compute_id" {
  value = module.subnet_compute.subnet_id
}

output "resource_group_name" {
  value = module.RG.resource_group_name
}

output "resource_group_location" {
  value = module.RG.resource_group_location
}
