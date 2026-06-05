# Terraform IBM Cloud Region Abbreviation Mapping

[![Tag](https://github.com/PartTimeLegend/terraform-ibm-cloud-region-abbreviation-mapping/actions/workflows/tag.yml/badge.svg)](https://github.com/PartTimeLegend/terraform-ibm-cloud-region-abbreviation-mapping/actions/workflows/tag.yml)

A simple module that provides mappings between IBM Cloud region identifiers and standardized abbreviations for consistent resource naming.

## Features

- Mapping of IBM Cloud region identifiers to short abbreviations
- Supports both canonical region IDs and normalized lowercase names without hyphens
- Uses IBM Cloud region IDs as the default keys
- Helper output map to simplify regional naming across IBM Cloud resources
- Zero external dependencies

## Usage

### Basic Usage

```terraform
locals {
  ibm_cloud_region = "eu-gb"
}

module "region_abbreviation_mapping" {
  source  = "PartTimeLegend/region-abbreviation-mapping/ibm"
  version = "~> 1.0" # Replace with the latest version
}

output "region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.ibm_cloud_region]
}
```

### Using Normalized Region IDs

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/ibm"
}

locals {
  canonical_region  = "us-south"
  normalized_region = "ussouth"
}

output "canonical_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.canonical_region]
}

output "normalized_region_abbreviation" {
  value = module.region_abbreviation_mapping.lookup_region_abbreviation[local.normalized_region]
}
```

### Using the Region Lookup Map

```terraform
module "region_abbreviation_mapping" {
  source = "PartTimeLegend/region-abbreviation-mapping/ibm"
}

locals {
  resource_name = "${module.region_abbreviation_mapping.lookup_region_abbreviation["eu-gb"]}-app"
}
```

## Available Outputs

| Name | Description |
| ---- | ----------- |
| `ibm_cloud_region_abbr_map` | Canonical map of IBM Cloud region identifiers to their abbreviations |
| `lookup_region_abbreviation` | Lookup map supporting canonical region identifiers and normalized lowercase names without hyphens |
| `region_names` | List of canonical IBM Cloud region identifiers |
| `region_abbreviations` | List of all region abbreviations |

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
