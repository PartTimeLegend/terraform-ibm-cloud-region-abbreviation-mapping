locals {
  ibm_cloud_region = "eu-gb"
}

module "region_abbreviation" {
  source = "../../"
}

output "region_abbreviation" {
  value = module.region_abbreviation.ibm_cloud_region_abbr_map[local.ibm_cloud_region]
}

output "all_region_names" {
  value = module.region_abbreviation.region_names
}

output "all_abbreviations" {
  value = module.region_abbreviation.region_abbreviations
}
