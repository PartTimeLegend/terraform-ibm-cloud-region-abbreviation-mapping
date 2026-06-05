output "ibm_cloud_region_abbr_map" {
  value       = var.ibm_cloud_region_abbr_map
  description = "The canonical map of IBM Cloud region identifiers to abbreviations."
}

output "lookup_region_abbreviation" {
  value       = local.ibm_cloud_region_abbr_lookup_map
  description = "Map for looking up an IBM Cloud region abbreviation from either the canonical region identifier or a normalized lowercase name without hyphens."
}

output "region_names" {
  value       = keys(var.ibm_cloud_region_abbr_map)
  description = "List of canonical IBM Cloud region identifiers."
}

output "region_abbreviations" {
  value       = values(var.ibm_cloud_region_abbr_map)
  description = "List of all region abbreviations."
}
