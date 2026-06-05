variable "ibm_cloud_region_abbr_map" {
  type        = map(string)
  description = "Map of IBM Cloud region identifiers to short abbreviations for naming resources"
  default = {
    "au-syd"   = "syd"
    "br-sao"   = "sao"
    "ca-mon"   = "mon"
    "ca-tor"   = "tor"
    "eu-de"    = "fra"
    "eu-es"    = "mad"
    "eu-fr2"   = "par"
    "eu-gb"    = "lon"
    "in-che"   = "che"
    "in-mum"   = "mum"
    "jp-osa"   = "osa"
    "jp-tok"   = "tok"
    "kr-seo"   = "seo"
    "us-east"  = "wdc"
    "us-south" = "dal"
  }
}

locals {
  ibm_cloud_region_abbr_map_normalized = {
    for region_name, abbreviation in var.ibm_cloud_region_abbr_map :
    lower(replace(region_name, "-", "")) => abbreviation
  }

  ibm_cloud_region_abbr_lookup_map = merge(
    var.ibm_cloud_region_abbr_map,
    local.ibm_cloud_region_abbr_map_normalized,
  )
}
