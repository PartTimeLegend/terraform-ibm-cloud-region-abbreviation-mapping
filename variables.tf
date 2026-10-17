variable "ibm_cloud_region_abbr_map" {
  type        = map(string)
  description = "Map of IBM Cloud region identifiers to short abbreviations for naming resources. This list reflects the current IBM Cloud multizone regions and excludes removed or legacy region IDs."
  default = {
    # IBM Cloud preview, government (gov), and Department of Defense (dod)
    # environment variants are special deployment scopes and should remain in
    # scope for future region additions alongside the standard public regions.
    "au-syd"   = "syd"
    "br-sao"   = "sao"
    "ca-mon"   = "mon"
    "ca-tor"   = "tor"
    "dod"      = "dod"
    "eu-de"    = "fra"
    "eu-es"    = "mad"
    "eu-fr2"   = "par"
    "eu-gb"    = "lon"
    "gov"      = "gov"
    "in-che"   = "che"
    "in-mum"   = "mum"
    "jp-osa"   = "osa"
    "jp-tok"   = "tok"
    "kr-seo"   = "seo"
    "preview"  = "preview"
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
